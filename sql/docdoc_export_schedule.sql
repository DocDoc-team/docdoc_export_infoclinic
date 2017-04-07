SET HEADING OFF;

SELECT 'DCODE'
  || '; WORKDATE'
  || '; BHOUR'
  || '; BMIN'
  || '; FHOUR'
  || '; FMIN'
  || ';'
FROM SCHEDULE ROWS 1;

SELECT  '"' || (select res from mreplace(DCODE, '"', '""'))
  || '"; "' || (select res from mreplace(CAST(WORKDATE AS TIMESTAMP), '"', '""'))
  || '"; "' || (select res from mreplace(BHOUR, '"', '""'))
  || '"; "' || (select res from mreplace(BMIN, '"', '""'))
  || '"; "' || (select res from mreplace(FHOUR, '"', '""'))
  || '"; "' || (select res from mreplace(FMIN, '"', '""'))
  || '";'
FROM SCHEDULE
WHERE WORKDATE BETWEEN CAST('NOW' as TIMESTAMP ) AND (CAST('NOW' as TIMESTAMP ) + 30)
;
