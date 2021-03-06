/*
Weather Observation Station 17

Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. 
Round your answer to 4 decimal places.

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

raiserror('Now at aggregation.proc_14wos17 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_14wos17(@OutParams float OUT)
AS
SELECT 
	@OutParams = ROUND(long_w, 4)
FROM 
	aggregation.STATION 
WHERE 
	lat_n = (
		SELECT 
			MIN(lat_n) 
		FROM 
			aggregation.STATION 
		WHERE 
			lat_n > 38.7780
	);
GO

raiserror('Now at AggregationTestClass.test_14wos17 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_14wos17
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_14wos17 @actual OUT
	SET @expected = 70.1378;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_14wos17]';