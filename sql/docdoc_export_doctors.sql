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

SELECT  '"' || REPLACE(TRIM(COALESCE(DCODE, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FULLNAME, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FILIAL, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(DEPNUM, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(CHAIR, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(VIEWINSCHED, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(STDTYPE, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(DOCTPOST, '')), '"', '""')
  || '";'
FROM DOCTOR
WHERE VIEWINSCHED = 1 AND VIEWINWEB = 1
;
