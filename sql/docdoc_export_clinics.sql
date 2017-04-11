SET HEADING OFF;

set term ^ ;
execute block as begin
if (exists(select * from RDB$FUNCTIONS where RDB$FUNCTION_NAME = 'STRREPLACE')) THEN
begin
execute statement 'DROP EXTERNAL FUNCTION STRREPLACE;';
end
end^

commit^
DECLARE EXTERNAL FUNCTION STRREPLACE
  CSTRING(255), CSTRING(255), CSTRING(255)
   RETURNS CSTRING(255) FREE_IT
  ENTRY_POINT 'fn_strreplace'  MODULE_NAME 'rfunc'^

set term ; ^

SELECT 'FILID'
  || '; FULLNAME'
  || '; DIS_IN_SCHEDULE'
  || '; VIEWINWEB'
  || ';'
FROM FILIALS ROWS 1;

SELECT  '"' || STRREPLACE(FILID, '"', '""')
  || '"; "' || STRREPLACE(FULLNAME, '"', '""')
  || '"; "' || STRREPLACE(DIS_IN_SCHEDULE, '"', '""')
  || '"; "' || 1
  || '";'
FROM FILIALS
;