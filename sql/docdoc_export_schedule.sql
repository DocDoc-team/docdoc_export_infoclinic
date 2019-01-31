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
  || '"; "' || REPLACE(TRIM(COALESCE(CAST(WORKDATE AS DATE), '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(BHOUR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(BMIN, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FHOUR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FMIN, '')), '"', '""')
  || '";'
FROM SCHEDULE
WHERE WORKDATE BETWEEN DATEADD (-1 DAY TO CURRENT_TIMESTAMP) AND DATEADD (30 DAY TO CURRENT_TIMESTAMP)
;
