/*
Weather Observation Station 19

Consider p1(a,b) and p2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.

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

raiserror('Now at aggregation.proc_16wos19 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_16wos19 (@OutParams decimal(6,4) OUT)
AS
SELECT 
	@OutParams = CAST(round( SQRT( power(min(long_w) -min(lat_n), 2) + power(max(long_w) -max(lat_n),2) ) ,4) AS DECIMAL(6,4))
FROM
	aggregation.STATION;
GO

raiserror('Now at AggregationTestClass.test_16wos19 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_16wos19
AS
BEGIN
    DECLARE @expected decimal(6,4);
    DECLARE @actual decimal(6,4);
	exec aggregation.proc_16wos19 @actual OUT
	SET @expected = 19.8870;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_16wos19]';