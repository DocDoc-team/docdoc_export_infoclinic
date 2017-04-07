SET HEADING OFF;

SELECT 'DEPNUM'
  || '; DEPNAME'
  || '; FILIAL'
  || '; SHORTNAME'
  || ';'
FROM DEPARTMENTS ROWS 1;

SELECT  '"' || (select res from mreplace(DEPNUM, '"', '""'))
  || '"; "' || (select res from mreplace(DEPNAME, '"', '""'))
  || '"; "' || (select res from mreplace(FILIAL, '"', '""'))
  || '"; "' || (select res from mreplace(DEPARTMENTS.SHORTNAME, '"', '""'))
  || '";'
FROM DEPARTMENTS INNER JOIN FILIALS on FILIALS.FILID = DEPARTMENTS.FILIAL
;
