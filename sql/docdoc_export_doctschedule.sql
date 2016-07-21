SET HEADING OFF;

SELECT 'DCODE'
  || '; CHAIR'
  || '; WDATE'
  || '; BEGHOUR'
  || '; BEGMIN'
  || '; ENDHOUR'
  || '; ENDMIN'
  || '; SHINTERV'
  || '; FILIAL'
  || ';'
FROM DOCTSHEDULE ROWS 1;

SELECT  '"' || REPLACE(TRIM(COALESCE(DCODE, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(CHAIR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(CAST(WDATE AS TIMESTAMP ), '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(BEGHOUR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(BEGMIN, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(ENDHOUR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(ENDMIN, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(SHINTERV, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FILIAL, '')), '"', '""')
  || '";'
FROM DOCTSHEDULE INNER JOIN FILIALS on FILIALS.FILID = DOCTSHEDULE.FILIAL
WHERE WDATE BETWEEN CAST('NOW' as TIMESTAMP ) AND (CAST('NOW' as TIMESTAMP ) + 30)
;
