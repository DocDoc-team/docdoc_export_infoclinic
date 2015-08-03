SET HEADING OFF;

SELECT 'DEPNUM'
  || '; DEPNAME'
  || '; FILIAL'
  || '; SHORTNAME'
  || ';'
FROM DEPARTMENTS ROWS 1;

SELECT  '"' || REPLACE(TRIM(COALESCE(DEPNUM, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(DEPNAME, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FILIAL, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(SHORTNAME, '')), '"', '""')
  || '";'
FROM DEPARTMENTS
;
