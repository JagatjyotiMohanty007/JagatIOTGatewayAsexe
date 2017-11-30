@echo off
echo ***********************************************************
echo 	:: GateWay Installation Script ::
echo ***********************************************************
:::: Stop and delete qpid and GateWay sevices
cmd /c "net stop WabtecONEedgeGateWay"
cmd /c "sc.exe delete WabtecONEedgeGateWay"
cmd /c "net stop wabtecONEqpid"
cmd /c "sc.exe delete wabtecONEqpid"


::::Setup GateWay
::Copy Edge gateway
SET EG_sourcePath="%CD%\..\Dependencies\Gateway"
SET EG_DestPath="C:\Program Files (x86)\Wabtec\Edge Gateway"
SET EG_fileName="iot-edge"
IF NOT EXIST %EG_DestPath% mkdir %EG_DestPath%
::IF NOT EXIST %EG_DestPath%/%EG_fileName% xcopy %EG_sourcePath% %EG_DestPath% /s /e /h
xcopy %EG_sourcePath% %EG_DestPath% /s /e /j


::Check and Copy required DLLS
SET dllSrcPATH1="%CD%\..\Dependencies\DLL\ucrtbase.dll"
SET dllSrcPATH2="%CD%\..\Dependencies\DLL\ucrtbased.dll"
SET dllSrcPATH3="%CD%\..\Dependencies\DLL\vcruntime140d.dll"
SET Sys32DestPath="C:\Windows\System32\"
SET WOW64DestPath="C:\Windows\SysWOW64\"
SET dllName1="ucrtbase.dll"
SET dllName2="ucrtbased.dll"
SET dllName3="vcruntime140d.dll"
::IF NOT EXIST %Sys32DestPath%/%dllName1% xcopy %dllSrcPATH1% %Sys32DestPath% /s /e
::IF NOT EXIST %Sys32DestPath%/%dllName2% xcopy %dllSrcPATH2% %Sys32DestPath% /s /e
::IF NOT EXIST %Sys32DestPath%/%dllName3% xcopy %dllSrcPATH3% %Sys32DestPath% /s /e

IF NOT EXIST %WOW64DestPath%/%dllName1% xcopy %dllSrcPATH1% %WOW64DestPath% /s /e
IF NOT EXIST %WOW64DestPath%/%dllName2% xcopy %dllSrcPATH2% %WOW64DestPath% /s /e
IF NOT EXIST %WOW64DestPath%/%dllName3% xcopy %dllSrcPATH3% %WOW64DestPath% /s /e


:::: Copy ICON
SET IconSourcePath="%CD%\..\Dependencies\wabtecONEicon"
SET IconDestPath="C:\Program Files (x86)\Wabtec\WabtecONEicon\"
SET iconName="logo.ico"
IF NOT EXIST %IconDestPath% mkdir %IconDestPath%
IF NOT EXIST %IconDestPath%/%iconName% xcopy %IconSourcePath% %IconDestPath% /s /e


::Copy Config file
SET SrcConfigFilePath="%CD%\..\Dependencies\ConfigFile"
SET DestConfigFilePath="C:\ProgramData\Wabtec"
SET ConfigFileName="GwConfig.Properties"
IF NOT EXIST %DestConfigFilePath% mkdir %DestConfigFilePath%
IF NOT EXIST %DestConfigFilePath%/%ConfigFileName% xcopy %SrcConfigFilePath% %DestConfigFilePath% /s /e
::xcopy %SrcConfigFilePath% %DestConfigFilePath% /s /e

::JRE
::Copy JRE
SET jreSourceDir="%CD%\..\Dependencies\Softwares\JRE"
SET jreDestDir="C:\Program Files\Java\"
SET jre_exist="jre1.8.0_131"
::JRE Path info
SET jrePath=C:\Program Files\Java\jre1.8.0_131\bin;C:\Program Files\Java\jre1.8.0_131\bin\server
::SET jreSrvPath=C:\Program Files\Java\jre1.8.0_131\bin\server

::Copy JRE from source to destination
IF NOT EXIST %jreDestDir%/%jre_exist% xcopy %jreSourceDir% %jreDestDir% /s /e /j
::Set JRE Path
setx /M PATH "%PATH%;%jrePath%;"
::IF EXIST %jreSrvPath% setx /M PATH "%PATH%;%jreSrvPath%"

::NSSM
::Copy NSSM
SET nssmSourceDir="%CD%\..\Dependencies\Softwares\NSSM"
SET nssmDestDir="C:\Program Files\"
SET nssm_exist="nssm-2.24"
::SET nssmBatchFilePath="%CD%\..\Dependencies\gwAsService\runGwFrmNSSM.cmd"
IF NOT EXIST %nssmDestDir%/%nssm_exist% xcopy %nssmSourceDir% %nssmDestDir% /s /e /j

SET SrcDirRunQpidGateway="%CD%\startQpidAndGw.bat"
SET destDirRunQpidGateway1="C:\Program Files (x86)\Wabtec\"
SET destDirRunQpidGateway2="%userprofile%\desktop\"
xcopy %SrcDirRunQpidGateway% %destDirRunQpidGateway1% /s /e
xcopy %SrcDirRunQpidGateway% %destDirRunQpidGateway2% /s /e

::::Setup Qpid as service
SET qpidNssmFileName="%CD%\..\Dependencies\qpid\setupQpid.bat"
call %qpidNssmFileName%
::Run gw NSSM batch file to make gateway up
::call %nssmBatchFilePath%
::Run NSSM
::cmd /c "net start WabtecONEedgeGateWay"
