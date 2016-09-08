@echo off
rem =======  Database connection settings  ==================================

rem Alias or full path to Infoclinica DB file
rem 
rem If you dont know alias of your Infoclinica DB, you always can use just 
rem full path to DB file (somewhat.FDB) instead.
rem 
rem Examples:
rem   "dbpath=INFOCLINICA"
rem   "dbpath=D:\clinica\MY099.FDB"
rem   "dbpath=C:\Program Files\Infoclinica\Data\001.FDB"
rem 
set "dbpath=INFOCLINICA"


rem DB User, Password and Role for connection
rem 
rem This user must have enought privileges for retrieving data from required 
rem tables.
rem For more information see readme.txt
rem 
set dbuser=SYSDBA
set dbpass=ZbcaEwZ
set dbrole=ADMIN


rem Full path to 'isql' tool of Interbase/Firebird database management system
rem 
rem Examples:
rem   "fbpath=C:\Program Files\Firebird\Firebird_2_5\bin\"
rem   "fbpath=E:\Firebird\Firebird_2_5\bin\"
rem 
set "fbpath=C:\Program Files\Firebird\Firebird_2_5\bin\"





rem ===========  Upload settings  ===========================================

rem FTP host & port, user and password settings
rem FTP host examples:
rem   ftphost=ftp.docdoc.ru
rem   ftphost=ftp.docdoc.ru:21
set ftphost=ftp.docdoc.ru
set ftpuser=testuser
set ftppass=pass
rem Directory is where all files will be saved
set ftpstartdir=
rem path to winscp ftp client
set "winscppath=winscp\"
rem proxy settings for FTP connection
rem set "winscpsettings=ProxyHost^=testhost ProxyUsername^=testuser FtpProxyLogonType^=6 ProxyPasswordEnc^=passwordhash"
rem proxy settings for webDav connection
rem set "winscpsettings=ProxyMethod=3 ProxyHost^=testhost ProxyUsername^=testuser ProxyPasswordEnc^=passwordhash"
set ftplogpath=ftp.log
rem Accept ftp or webdav value for using approciate client protocol
set uploadmode=ftp



rem =======  Internal variables (DO NOT MODIFY THEM if not sure)  ===========

rem Subpath to sql commandlets
set sqlpath=.\sql\
rem Subpath where to put export files
set exportpath=.\export\
rem List of subnames of sql commandlets (and corresponding export files)
set exportfiles=clinics doctors depts doctschedule schedule chairs

