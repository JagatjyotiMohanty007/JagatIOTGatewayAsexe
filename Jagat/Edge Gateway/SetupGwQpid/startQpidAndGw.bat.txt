
:::: Stop and delete qpid and GateWay sevices
cmd /c "net stop WabtecONEedgeGateWay"
cmd /c "sc.exe delete WabtecONEedgeGateWay"
cmd /c "net stop wabtecONEqpid"
cmd /c "sc.exe delete wabtecONEqpid"

SET nssmQpidFile="C:\Program Files (x86)\Wabtec\Edge Gateway\Dependencies\qpid\qpidAsService\runQpidAsService.cmd"
::run qpid NSSM
call %nssmQpidFile%
::start qpid nssm
cmd /c "net start wabtecONEqpid"

SET nssmBatchFilePath="C:\Program Files (x86)\Wabtec\Edge Gateway\Dependencies\gwAsService\runGwFrmNSSM.cmd"
::Run gw NSSM batch file to make gateway up
call %nssmBatchFilePath%
::Run NSSM
cmd /c "net start WabtecONEedgeGateWay"