CD "C:\Program Files\nssm-2.24\win64" 
NSSM set WabtecONEedgeGateWay AppDirectory "C:\Program Files (x86)\Wabtec\Edge Gateway\iot-edge\build\samples\java_sample\" 
NSSM install WabtecONEedgeGateWay "C:\Program Files (x86)\Wabtec\Edge Gateway\iot-edge\build\samples\java_sample\Debug\java_sample.exe" """C:\Program Files (x86)\Wabtec\Edge Gateway\iot-edge\samples\java_sample\src\java_sample_win.json"""
NSSM set WabtecONEedgeGateWay Description "OnPremisesGateway" 
NSSM set WabtecONEedgeGateWay AppEnvironmentExtra "JAVA_HOME=C:\Program Files\Java\jre1.8.0_131" 
REM NSSM set WabtecONEedgeGateWay AppStdout C:\toCheckGWservice\stdout.log 
REM NSSM set WabtecONEedgeGateWay AppStderr C:\toCheckGWservice\stderr.log 
NSSM set WabtecONEedgeGateWay AppStdoutCreationDisposition 2 
NSSM set WabtecONEedgeGateWay AppStderrCreationDisposition 2 
NSSM set WabtecONEedgeGateWay AppStopMethodSkip 6 
REM Let's start WabtecONEedgeGateWay. 
@REM net start WabtecONEedgeGateWay