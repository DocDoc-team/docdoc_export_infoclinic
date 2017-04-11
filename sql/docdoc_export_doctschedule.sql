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

SELECT  '"' || STRREPLACE(DCODE, '"', '""')
  || '"; "' || STRREPLACE(CHAIR, '"', '""')
  || '"; "' || STRREPLACE(CAST(WDATE AS TIMESTAMP), '"', '""')
  || '"; "' || STRREPLACE(BEGHOUR, '"', '""')
  || '"; "' || STRREPLACE(BEGMIN, '"', '""')
  || '"; "' || STRREPLACE(ENDHOUR, '"', '""')
  || '"; "' || STRREPLACE(ENDMIN, '"', '""')
  || '"; "' || STRREPLACE(SHINTERV, '"', '""')
  || '"; "' || STRREPLACE(FILIAL, '"', '""')
  || '";'
FROM DOCTSHEDULE INNER JOIN FILIALS on FILIALS.FILID = DOCTSHEDULE.FILIAL
WHERE WDATE BETWEEN CAST('NOW' as TIMESTAMP ) AND (CAST('NOW' as TIMESTAMP ) + 30)
;
