/*
Weather Observation Station 15

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

raiserror('Now at aggregation.proc_12wos15 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_12wos15 (@OutParams float OUT)
AS
SELECT 
	@OutParams = ROUND(long_w, 4)
FROM 
	aggregation.STATION 
WHERE 
	lat_n = (
		SELECT 
			MAX(lat_n) 
		FROM 
			aggregation.STATION 
		WHERE 
			lat_n < 137.2345
	);
GO

raiserror('Now at AggregationTestClass.test_12wos15 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_12wos15
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_12wos15 @actual OUT
	SET @expected = 117.2465;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_12wos15]';