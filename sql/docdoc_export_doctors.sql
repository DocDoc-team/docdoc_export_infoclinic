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

SELECT  '"' || (select res from mreplace(DCODE, '"', '""'))
  || '"; "' || (select res from mreplace(DOCTOR.FULLNAME, '"', '""'))
  || '"; "' || (select res from mreplace(FILIAL, '"', '""'))
  || '"; "' || (select res from mreplace(DEPNUM, '"', '""'))
  || '"; "' || (select res from mreplace(CHAIR, '"', '""'))
  || '"; "' || (select res from mreplace(VIEWINSCHED, '"', '""'))
  || '"; "' || (select res from mreplace(STDTYPE, '"', '""'))
  || '"; "' || (select res from mreplace(DOCTPOST, '"', '""'))
  || '";'
FROM DOCTOR INNER JOIN FILIALS on FILIALS.FILID = DOCTOR.FILIAL
WHERE VIEWINSCHED = 1
;
