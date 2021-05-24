/*
Weather Observation Station 4

Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; query the value of N - N' from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

Input Format

The STATION table is described as follows:

+--------+--------------+
| FILEDS |     TYPE     |
+--------+--------------+
| ID     | NUMBER       |
| CITY   | VARCHAR2(21) |
| STATE  | VARCHAR2(2)  |
| LAT_N  | NUMBER       |
| LONG_W | NUMBER       |
+--------+--------------+

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_09wos04 (@OutParams int OUT) AS
select 
	@OutParams = (count(CITY)- count(DISTINCT CITY))
from 
	basicselect.STATION;
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_09wos04 AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec basicselect.proc_09wos04 @actual OUT
	SET @expected = '13';

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_09wos04]';