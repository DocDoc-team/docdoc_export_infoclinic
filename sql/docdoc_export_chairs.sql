SET HEADING OFF;

SELECT 'CHID'
  || '; RID'
  || '; CHNAME'
  || '; FILIAL'
  || ';'
FROM CHAIRS ROWS 1;

SELECT  '"' || REPLACE(TRIM(COALESCE(CHID, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(RID, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(CHNAME, '')), '"', '""')
  || '"; "' || REPLACE(TRIM(COALESCE(FILIAL, '')), '"', '""')
  || '";'
FROM CHAIRS;
