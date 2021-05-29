/*
Weather Observation Station 18

Consider p1(a,b) and p2(c,d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.

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

raiserror('Now at aggregation.proc_15wos18 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_15wos18 (@OutParams float OUT)
AS
SELECT 
	@OutParams = ROUND(ABS(temp.a - temp.c) + ABS(temp.b - temp.d), 4)
FROM 
	(
		SELECT 
			MIN(lat_n) AS a, 
			MIN(long_w) AS b, 
			MAX(lat_n) AS c, 
			MAX(long_w) AS d 
		FROM 
			aggregation.STATION
	) temp
GO

raiserror('Now at AggregationTestClass.test_15wos18 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_15wos18
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_15wos18 @actual OUT
	SET @expected = 259.6859;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_15wos18]';