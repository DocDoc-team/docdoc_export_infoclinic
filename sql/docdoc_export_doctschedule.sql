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

SELECT  '"' || (select res from mreplace(DCODE, '"', '""'))
  || '"; "' || (select res from mreplace(CHAIR, '"', '""'))
  || '"; "' || (select res from mreplace(CAST(WDATE AS TIMESTAMP), '"', '""'))
  || '"; "' || (select res from mreplace(BEGHOUR, '"', '""'))
  || '"; "' || (select res from mreplace(BEGMIN, '"', '""'))
  || '"; "' || (select res from mreplace(ENDHOUR, '"', '""'))
  || '"; "' || (select res from mreplace(ENDMIN, '"', '""'))
  || '"; "' || (select res from mreplace(SHINTERV, '"', '""'))
  || '"; "' || (select res from mreplace(FILIAL, '"', '""'))
  || '";'
FROM DOCTSHEDULE INNER JOIN FILIALS on FILIALS.FILID = DOCTSHEDULE.FILIAL
WHERE WDATE BETWEEN CAST('NOW' as TIMESTAMP ) AND (CAST('NOW' as TIMESTAMP ) + 30)
;
