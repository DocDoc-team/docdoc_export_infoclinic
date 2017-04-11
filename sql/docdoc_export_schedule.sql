SET HEADING OFF;

SELECT 'DCODE'
  || '; WORKDATE'
  || '; BHOUR'
  || '; BMIN'
  || '; FHOUR'
  || '; FMIN'
  || ';'
FROM SCHEDULE ROWS 1;

SELECT  '"' || STRREPLACE(DCODE, '"', '""')
  || '"; "' || STRREPLACE(CAST(WORKDATE AS TIMESTAMP), '"', '""')
  || '"; "' || STRREPLACE(BHOUR, '"', '""')
  || '"; "' || STRREPLACE(BMIN, '"', '""')
  || '"; "' || STRREPLACE(FHOUR, '"', '""')
  || '"; "' || STRREPLACE(FMIN, '"', '""')
  || '";'
FROM SCHEDULE
WHERE WORKDATE BETWEEN CAST('NOW' as TIMESTAMP ) AND (CAST('NOW' as TIMESTAMP ) + 30)
;
