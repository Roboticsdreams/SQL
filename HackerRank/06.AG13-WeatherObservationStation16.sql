/*
Weather Observation Station 16

Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is greater than 38.7780. 
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

raiserror('Now at aggregation.proc_13wos16 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_13wos16 (@OutParams float OUT)
AS
SELECT 
	@OutParams = CAST(MIN(LAT_N) AS NUMERIC(20,4))
FROM 
	aggregation.STATION 
WHERE 
	LAT_n > 38.7780
GO

raiserror('Now at AggregationTestClass.test_13wos16 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_13wos16
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_13wos16 @actual OUT
	SET @expected = 38.8526;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_13wos16]';