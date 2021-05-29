/*
Weather Observation Station 13

Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
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

Output Format

Your results must be in the form:

lat lon

where lat is the sum of all values in LAT_N and log is the sum of all values in LONG_W. Both results must be rounded to a scale of 2 decimal places.
*/

use hackerrank;

GO

raiserror('Now at aggregation.proc_10wos13 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_10wos13 (@OutParams float OUT)
AS
SELECT 
	@OutParams = CAST(SUM(lat_n) AS NUMERIC(20,4)) 
FROM 
	aggregation.STATION 
WHERE 
	LAT_N >38.7880 AND 
	LAT_N < 137.2345;
GO

raiserror('Now at AggregationTestClass.test_10wos13 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_10wos13
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_10wos13 @actual OUT
	SET @expected = 36354.8135;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_10wos13]';