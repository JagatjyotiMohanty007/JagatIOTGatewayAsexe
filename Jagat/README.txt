

This is to setup Runtime environment for Pre Configured QPID and Pre compiled gateway to IoT Hub.
> This Edge gateway for both IoT/servicebus
> dll has been kept in gateways debug folder
> Tasks of Inno Script :

	- This script internally calls a .bat file, which performs the following tasks.

		1. Copy "iot-edge" sdk to "C:\Program Files (x86)\Wabtec\Edge Gateway".
		2. Copy "GwConfig.Properties" congiguration to "C:\ProgramData\Wabtec".
		3. Copy jre to "C:\Program Files\Java".
		4. Copy nssm to "C:\Program Files".
		5. Run "runGwFrmNSSM.cmd" which starts gateway as service.
		6. Set JRE paths permanently as system variable. 
		7. Copy  QPID (with a test queue) under C:\.
		8. Create qpidwork directory for pre configured qpid under C:\.
		9. Start qpid as service.
		10. Copy needed .dll
		11. Copy Wabtec's "logo.ico" under "C:\Program Files (x86)\Wabtec\"
		
Todo:
Uninstall not handling. It should do the following tasks.

1. remove all coppied file/softwares and stop/delete qpid and gateway which is running as service.

