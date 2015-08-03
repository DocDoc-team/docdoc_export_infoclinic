@echo off
rem =========================================================================
rem Script for generating export files from MIS Infoclinic database.
rem 
rem Developed for medical portal  Docdoc.ru
rem =========================================================================


rem # 1. Configure variables
SetLocal EnableDelayedExpansion
echo Loading...
call docdoc_export_config.bat


rem # 2. Delete previous existing export files if its exists
echo Cleaning from old export files
for %%a in (%exportfiles%) do (
    if exist %exportpath%%%a.txt del /Q /F %exportpath%%%a.txt
)


rem # 3. Make fresh data export from DB
echo Generate new fresh export files
for %%a in (%exportfiles%) do (
    echo - %%a
    "%fbpath%isql" -i %sqlpath%docdoc_export_%%a.sql -o %exportpath%%%a.txt -u %dbuser% -p %dbpass% -r %dbrole% %dbpath%
)


rem # 4. Correct created files (prepare them for uploading)
echo Prepare export files for uploading
for %%a in (%exportfiles%) do (
    echo - %%a
    rem Use raw export file as temporary file
    if exist %exportpath%%%a_raw.txt del /Q /F %exportpath%%%a_raw.txt
    ren %exportpath%%%a.txt %%a_raw.txt
    rem for /F "delims=; tokens=1" %%r in (%exportpath%%%a_raw.txt) do echo %%r;>> %exportpath%%%a.txt
    rem for /F "tokens=*"  %%r in (%exportpath%%%a_raw.txt) do for /F "tokens=* delims= " %%s in ('echo %%r ') do echo %%s>> %exportpath%%%a.txt
    for /F "delims= " %%r in (%exportpath%%%a_raw.txt) do (
        echo -%%r->> %exportpath%%%a.txt
    )
    rem Clear temporary file
	del /Q /F %exportpath%%%a_raw.txt
)


rem # 5. This batch is done.
rem To upload exported files run docdoc_upload.bat
echo Export files generated.
