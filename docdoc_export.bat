@echo off
rem =========================================================================
rem Script for generating export files from MIS Infoclinic database.
rem 
rem Developed for medical portal  Docdoc.ru
rem =========================================================================


rem # 1. Configure variables
SetLocal EnableDelayedExpansion EnableExtensions
echo Loading...
call docdoc_export_config.bat


rem # 2. Delete previous existing export files if its exists
echo Cleaning from old export files
for %%a in (%exportfiles%) do (
    if exist %exportpath%%%a.csv del /Q /F %exportpath%%%a.csv
)


rem # 3. Make fresh data export from DB
echo Generate new fresh export files
for %%a in (%exportfiles%) do (
    echo - %%a
    "%fbpath%isql" -i %sqlpath%docdoc_export_%%a.sql -o %exportpath%%%a.csv -u %dbuser% -p %dbpass% -r %dbrole% %dbpath%
)


rem # 4. Correct created files (prepare them for uploading)
echo Prepare export files for uploading
for %%a in (%exportfiles%) do (
    echo - %%a
    rem Use raw export file as temporary file
    if exist %exportpath%%%a_raw.csv del /Q /F %exportpath%%%a_raw.csv
    if exist %exportpath%%%a.csv ren %exportpath%%%a.csv %%a_raw.csv
    
    for /F "tokens=* delims=;" %%r in (%exportpath%%%a_raw.csv) do (
        rem Eliminate extra spaces
        set frow=%%r##TMP#
        set frow=!frow:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ##TMP#=##TMP#!
        set frow=!frow:                                                                                                                                                                                                                                                                ##TMP#=##TMP#!
        set frow=!frow:                                                                                                                                ##TMP#=##TMP#!
        set frow=!frow:                                                                ##TMP#=##TMP#!
        set frow=!frow:                                ##TMP#=##TMP#!
        set frow=!frow:                ##TMP#=##TMP#!
        set frow=!frow:        ##TMP#=##TMP#!
        set frow=!frow:    ##TMP#=##TMP#!
        set frow=!frow:  ##TMP#=##TMP#!
        set frow=!frow: ##TMP#=##TMP#!
        set frow=!frow:##TMP#=!
        rem Store prepared row
        echo.!frow!>> %exportpath%%%a.csv
    )
	
    rem Clear temporary file
    if exist %exportpath%%%a_raw.csv del /Q /F %exportpath%%%a_raw.csv
)


rem # 5. This batch is done.
rem To upload exported files run docdoc_upload.bat
echo Export files generated.
