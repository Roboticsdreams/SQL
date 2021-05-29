/*
Weather Observation Station 14

Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.

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

raiserror('Now at aggregation.proc_11wos14 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_11wos14 (@OutParams float OUT)
AS
SELECT 
	@OutParams = ROUND(max(LAT_N),4) 
FROM 
	aggregation.STATION 
WHERE
	LAT_N < 137.2345;
GO

raiserror('Now at AggregationTestClass.test_11wos14 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_11wos14
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_11wos14 @actual OUT
	SET @expected = 137.0193;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_11wos14]';