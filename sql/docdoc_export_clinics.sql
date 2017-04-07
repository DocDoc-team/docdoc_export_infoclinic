SET HEADING OFF;

set term ^ ;

RECREATE PROCEDURE MREPLACE(
  ORIGIN VARCHAR(1000),
  SEARCHTEXT VARCHAR(1000),
  REPLACESTR VARCHAR(1000) )
RETURNS (
  RES VARCHAR(1000))
AS
declare pos int;
  declare curPosition int;
  declare startPosition int;
  declare tmp varchar(1000);
begin
  origin = trim(COALESCE(origin, ''));
  res = '';
  if (position('"', origin) = 0) then
  begin
   res = origin;
  end
  else
  begin
  curPosition = 1;
	while (curPosition <= char_length(origin)) do
	begin
	startPosition = curPosition;
	curPosition = position(searchText, origin, startPosition);

        if (curPosition = 0) then
        begin
             res = res || substring(origin from startPosition for char_length(origin));
             curPosition = char_length(origin) + char_length(searchText);
        end
        else
        begin
        	res = res || substring(origin from startPosition for (curPosition - startPosition )) || replaceStr;
               	curPosition = curPosition + char_length(searchText);
        end
	end
  end
  suspend;
end^
set term ; ^

SELECT 'FILID'
  || '; FULLNAME'
  || '; DIS_IN_SCHEDULE'
  || '; VIEWINWEB'
  || ';'
FROM FILIALS ROWS 1;

SELECT  '"' || (select res from mreplace(FILID, '"', '""'))
  || '"; "' || (select res from mreplace(FULLNAME, '"', '""'))
  || '"; "' || (select res from mreplace(DIS_IN_SCHEDULE, '"', '""'))
  || '"; "' || 1
  || '";'
FROM FILIALS
;