SET HEADING OFF;

SELECT 'DEPNUM'
  || '; DEPNAME'
  || '; FILIAL'
  || '; SHORTNAME'
  || ';'
FROM DEPARTMENTS ROWS 1;

SELECT  '"' || STRREPLACE(DEPNUM, '"', '""')
  || '"; "' || STRREPLACE(DEPNAME, '"', '""')
  || '"; "' || STRREPLACE(FILIAL, '"', '""')
  || '"; "' || STRREPLACE(DEPARTMENTS.SHORTNAME, '"', '""')
  || '";'
FROM DEPARTMENTS INNER JOIN FILIALS on FILIALS.FILID = DEPARTMENTS.FILIAL
;
