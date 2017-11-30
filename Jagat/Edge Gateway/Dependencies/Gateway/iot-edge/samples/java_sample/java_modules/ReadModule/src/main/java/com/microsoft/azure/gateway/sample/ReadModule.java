package com.microsoft.azure.gateway.sample;
/*
 * Copyright (c) Microsoft. All rights reserved.
 * Licensed under the MIT license. See LICENSE file in the project root for full license information.
 */

import java.io.FileInputStream;
import java.util.HashMap;
//import java.util.Enumeration;
import java.util.Properties;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;

import com.google.gson.Gson;
import com.microsoft.azure.gateway.core.Broker;
import com.microsoft.azure.gateway.core.GatewayModule;
import com.microsoft.azure.gateway.messaging.Message;
import com.microsoft.azure.gateway.sample.msgProperties;

public class ReadModule extends GatewayModule {

	//private boolean threadStop;
	long address=0;
	Broker broker=null;
	Context context = null;
	HashMap<String, msgProperties> msgMap = new HashMap<String, msgProperties>();

	/**
	 * Constructs a {@link GatewayModule} from the provided address and
	 * {@link Broker}. A {@link GatewayModule} should always call this super
	 * constructor before any module-specific constructor code.
	 *
	 * @param address
	 *            The address of the native module pointer
	 * @param broker
	 *            The {@link Broker} to which this module belongs
	 * @param configuration
	 *            The module-specific configuration
	 */
	public ReadModule(long address, Broker broker, String configuration) {
		super(address, broker, configuration);

		//this.threadStop = false;
		System.out.println("*************************************************");
		System.out.println("** IoT Read Module Started");
		System.out.println("*************************************************");
	}

	class ReadMsgFrmQpidQueue extends Thread { 
		private String jsonobj = null;
		private Session tsession = null;
		private MessageConsumer consumerForQpidQ = null;
		private String msg = null;
		private TextMessage message = null;
		private String t_qpidQueueMsgID = null;
		private Connection tConToQpid = null;
		private Queue tQpidQ = null;
		private boolean readNextMsg = true;
		Message msgToSendModule = null;

		public ReadMsgFrmQpidQueue(Connection Conn, Queue QpidQ){
			tConToQpid = Conn;
			tQpidQ = QpidQ;
		}

		/** 
		 * Logic for Create Session.
		 * Create Consumer.
		 * Receiving the message from qpid queue.
		 * Publish the same message to Send Module.
		 * It will Wait for the ack from SendModule.
		 * After getting the ack it will send back the ack to qpid queue to delete the message. */
		@Override
		public void run() {

			try {
				tsession = tConToQpid.createSession(true, Session.SESSION_TRANSACTED);
				consumerForQpidQ= tsession.createConsumer(tQpidQ);
			} catch (JMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			System.out.println("Thread Name : " + Thread.currentThread().getName());

			try {
				while (true) {	
					if(readNextMsg) {
						message = (TextMessage)consumerForQpidQ.receive();
						msg = message.getText().toString();
						Gson gson = new Gson();
						jsonobj = gson.toJson(msg);
						/*System.out.println("Read Module : Msg Rcv Time:"+System.currentTimeMillis());
						System.out.println("Read Module : Received msg from Qpid Queue :->\n"+jsonobj);
						System.out.println("Read Module : Msg" + message.getJMSMessageID());*/	
						HashMap<String, String> mapMsgProperties = new HashMap<>();
						mapMsgProperties.put("Qpid_msg", message.getJMSMessageID());
						msgToSendModule = new Message(jsonobj.toString().getBytes(),mapMsgProperties);
						// Publish message
						publish(msgToSendModule);
						//Write to set
						t_qpidQueueMsgID = message.getJMSMessageID();
						//ackGot = false;
						readNextMsg = false;
					}
					
					if(msgMap.containsKey(t_qpidQueueMsgID)){
						msgProperties msgPropertyValue = msgMap.get(t_qpidQueueMsgID);

						if(msgPropertyValue.deleteMsg) {
							tsession.commit();
							msgMap.remove(t_qpidQueueMsgID);
							readNextMsg= true;
							System.out.println("Read Module : deleted Msg " + t_qpidQueueMsgID);
							msgPropertyValue.deleteMsg = false;
						}
						else if(msgPropertyValue.retryMsg && msgPropertyValue.waitForMsgAck ) {
							Thread.sleep(msgPropertyValue.waitTime);
							// Publish message again
							publish(msgToSendModule);
							msgPropertyValue.waitForMsgAck = false;
							msgPropertyValue.retryMsg = false;
						}
						else if(msgPropertyValue.retryMsg){
							//wait for one second before resend the message
							Thread.sleep(1000); 
							// Publish message again
							publish(msgToSendModule);
							msgPropertyValue.retryMsg = false;
						}
						
					} else {
						Thread.sleep(2);
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					consumerForQpidQ.close();
					tsession.close();
				} catch (JMSException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void start() {

		//ExecutorService executor = null;
		Properties properties = new Properties();
		Connection connection = null;
		Queue queue = null;
		Context context;
		int rm_numOfThread = 0;
		try {
			properties.load(new FileInputStream("C:/ProgramData/Wabtec/GwConfig.Properties"));
			context = new InitialContext(properties);
			ConnectionFactory connectionFactory = (ConnectionFactory) context.lookup("qpidConnectionFactory");
			queue = (Queue) context.lookup("myqueue");
			//Read allocated thread numbers from configuration file
			rm_numOfThread = Integer.parseInt(properties.getProperty("rmThreadNumber"));
			connection = connectionFactory.createConnection();
			connection.start();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} 
		//Clear complete msgMap before 
		msgMap.clear();

		System.out.println("Read Module : Number of Thread allocated : "+rm_numOfThread);
		for(int i = 0; i<rm_numOfThread; i++)
		{
			ReadMsgFrmQpidQueue t1 = new ReadMsgFrmQpidQueue(connection,queue);
			t1.start();
		}
	}

	public int timeInSec(int sec)
	{
		return (sec * 1000);
	}

	@Override
	public void receive(Message message) {
		//System.out.println(" Message Ack Status : " + message.getContent());
		String ackMsgID = "";
		msgProperties properties = new msgProperties();
		ackMsgID = message.getProperties().get("FrmSM_AzureIoTack");
		/*System.out.println("Read Module : msg ID from send : " + ackMsgID);*/

		switch (new String(message.getContent()))
		{
		case "THROTTLED":
		case "SERVICE_BUS_ERROR":
		case "EVENT_HUB_ERROR":
			System.out.println(" INSIDE THROTTLED ");
			properties.deleteMsg = false;
			properties.retryMsg = true;
			properties.waitForMsgAck = true;
			//properties.retryCount = 3;
			properties.waitTime = timeInSec(30);
			break;
		case "INTERNAL_SERVER_ERROR":
		case "SERVER_BUSY":
			properties.deleteMsg = false;
			properties.retryMsg = true;
			properties.waitForMsgAck = true;
			//properties.retryCount = 5;
			properties.waitTime = timeInSec(60);
			break;
		case "OK":
		case "OK_EMPTY":
		case "BAD_FORMAT":
		case "UNAUTHORIZED":
		case "TOO_MANY_DEVICES":
		case "PRECONDITION_FAILED":
		case "REQUEST_ENTITY_TOO_LARGE":
		case "SERVICE_BUS_SUCCESS":
		case "EVENT_HUB_SUCCESS":
		default:
			properties.deleteMsg = true;
			properties.retryMsg = false;
			properties.waitForMsgAck = false;
			//properties.retryCount = 0;
			properties.waitTime = 0;
			break;
		}
		
		if (msgMap.containsKey(ackMsgID)){
			//System.out.println("Read Module : replacing... map");
			msgMap.replace(ackMsgID, properties);
		} else {
			//System.out.println("Read Module : updating... map");
			msgMap.put(ackMsgID, properties);
		}
	}

	@Override
	public void destroy() {
		// Causes the publishing thread to stop
		System.out.println("ReadModule Module Destroy.....: ");
		//this.threadStop = true;
	}
}
