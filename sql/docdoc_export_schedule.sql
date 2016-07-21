SET HEADING OFF;

SELECT 'DCODE'
  || '; WORKDATE'
  || '; BHOUR'
  || '; BMIN'
  || '; FHOUR'
  || '; FMIN'
  || ';'
FROM SCHEDULE ROWS 1;

SELECT  '"' || REPLACE(TRIM(COALESCE(DCODE, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(CAST(WORKDATE AS TIMESTAMP ), '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(BHOUR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(BMIN, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FHOUR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FMIN, '')), '"', '""')
  || '";'
FROM SCHEDULE
WHERE WORKDATE BETWEEN CAST('NOW' as TIMESTAMP ) AND (CAST('NOW' as TIMESTAMP ) + 30)
;
