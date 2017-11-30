@echo off
echo ***********************************************************
echo 	:: Qpid Installation Script ::
echo ***********************************************************
::NSSM
::Copy NSSM
SET nssmSourceDir="%CD%\..\Dependencies\Softwares\NSSM"
SET nssmDestDir="C:\Program Files"
SET nssm_exist="nssm-2.24"
SET nssmBatchFilePath="%CD%\..\Dependencies\gwAsService\runGwFrmNSSM.cmd"
IF NOT EXIST %nssmDestDir%/%nssm_exist% xcopy %nssmSourceDir% %nssmDestDir% /s /e /h

::Setup Qpid
SET qpidSourcePath="%CD%\..\Dependencies\Softwares\QPID"
SET qpidDestPath="C:\qpid"
SET qpidDirName="qpid-broker"
::SET nssmQpidFile="%CD%\..\Dependencies\qpid\qpidAsService\runQpidAsService.cmd"
SET qpidWorkSrcDir="%CD%\..\Dependencies\qpid\qpidwork"
SET qpidWorkDirPath="C:\qpidwork"
IF NOT EXIST %qpidDestPath% mkdir %qpidDestPath%
IF NOT EXIST %qpidDestPath%/%qpidDirName% xcopy %qpidSourcePath% %qpidDestPath% /s /e /h
IF NOT EXIST %qpidWorkDirPath% mkdir %qpidWorkDirPath%
xcopy %qpidWorkSrcDir% %qpidWorkDirPath% /s /e /h
setx /M QPID_WORK "C:\qpidwork"
::run qpid NSSM
::call %nssmQpidFile%
::start qpid nssm
::cmd /c "net start wabtecONEqpid"


