@echo off
rem =========================================================================
rem Script for uploading export files to external FTP server
rem 
rem Developed for medical portal  Docdoc.ru
rem =========================================================================


rem # 1. Configure variables
SetLocal
call docdoc_export_config.bat



rem # 2. Recreate temporary file with FTP commands

rem Check previous of temporary file with FTP commands
set ftpbatchfile=tmp\ftpcmd.dat
if exist %ftpbatchfile% del %ftpbatchfile%

rem Prepare header of temporary file with FTP commands
echo USER %ftpuser%> %ftpbatchfile%
echo %ftppass%>> %ftpbatchfile%
if not "%ftpstartdir%"=="" (
    echo CD %ftpstartdir%>> %ftpbatchfile%
)
echo BINARY>> %ftpbatchfile%

rem Make fresh data export from DB
for %%a in (%exportfiles%) do (
	echo PUT %exportpath%%%a.txt>> %ftpbatchfile%
)

rem Prepare footer of temporary file with FTP commands
echo QUIT>> %ftpbatchfile%



rem # 3. Run prepared FTP batch file
echo Uploading...
ftp -n -s:%ftpbatchfile% %ftphost%


rem # 4. This batch is done. All must be OK.
echo Done.
