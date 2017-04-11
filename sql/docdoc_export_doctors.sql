SET HEADING OFF;

SELECT 'DCODE'
  || '; FULLNAME'
  || '; FILIAL'
  || '; DEPNUM'
  || '; CHAIR'
  || '; VIEWINSCHED'
  || '; STDTYPE'
  || '; DOCTPOST'
  || ';'
FROM DOCTOR ROWS 1;

SELECT  '"' || STRREPLACE(DCODE, '"', '""')
  || '"; "' || STRREPLACE(DOCTOR.FULLNAME, '"', '""')
  || '"; "' || STRREPLACE(FILIAL, '"', '""')
  || '"; "' || STRREPLACE(DEPNUM, '"', '""')
  || '"; "' || STRREPLACE(CHAIR, '"', '""')
  || '"; "' || STRREPLACE(VIEWINSCHED, '"', '""')
  || '"; "' || STRREPLACE(STDTYPE, '"', '""')
  || '"; "' || STRREPLACE(DOCTPOST, '"', '""')
  || '";'
FROM DOCTOR INNER JOIN FILIALS on FILIALS.FILID = DOCTOR.FILIAL
WHERE VIEWINSCHED = 1
;
