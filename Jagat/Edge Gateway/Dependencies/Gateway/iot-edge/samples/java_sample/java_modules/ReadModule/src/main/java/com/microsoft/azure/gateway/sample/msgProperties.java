package com.microsoft.azure.gateway.sample;

public class msgProperties {

	boolean waitForMsgAck;
	boolean retryMsg;
	boolean deleteMsg;
	int retryCount;
	long waitTime;
	
	msgProperties() {
		waitForMsgAck = false;
		retryMsg = false;
		deleteMsg = false;
		retryCount = 0;
		waitTime = 0;
	}
}
