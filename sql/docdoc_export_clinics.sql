SET HEADING OFF;

SELECT 'FILID'
  || '; FULLNAME'
  || '; DIS_IN_SCHEDULE'
  || '; VIEWINWEB'
  || ';'
FROM FILIALS ROWS 1;

SELECT  '"' || REPLACE(TRIM(COALESCE(FILID, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FULLNAME, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(DIS_IN_SCHEDULE, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(VIEWINWEB, '')), '"', '""')
  || '";'
FROM FILIALS WHERE VIEWINWEB = 1
;
