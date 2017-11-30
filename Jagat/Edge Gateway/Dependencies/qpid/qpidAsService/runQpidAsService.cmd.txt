CD "C:\Program Files\nssm-2.24\win64"
NSSM set wabtecONEqpid AppEnvironmentExtra "QPID_WORK=C:\qpidwork"
NSSM set wabtecONEqpid AppDirectory "C:\qpid"
NSSM set wabtecONEqpid AppEnvironmentExtra "QPID_HOME=C:\qpid\qpid-broker\6.1.2"
NSSM install wabtecONEqpid "C:\qpid\qpid-broker\6.1.2\bin\qpid-server.bat"
REM NSSM set qpid AppParameters -prop "qpid.amqp_port=10003"
NSSM set wabtecONEqpid AppEnvironmentExtra "JAVA_HOME=C:\Program Files\Java\jre1.8.0_131"
REM NSSM set wabtecONEqpid AppStdout C:\toCheckQpidservice\stdout.log
REM NSSM set wabtecONEqpid AppStderr C:\toCheckQpidservice\stderr.log
REM Replace stdout and stderr files
NSSM set wabtecONEqpid AppStdoutCreationDisposition 2
NSSM set wabtecONEqpid AppStderrCreationDisposition 2
REM Disable WM_CLOSE, WM_QUIT in the Shutdown options. Without it, NSSM can't stop qpid properly
NSSM set wabtecONEqpid AppStopMethodSkip 6
REM Let's start qpid. I assume a correct configuration is already in place
@REM net start qpid



