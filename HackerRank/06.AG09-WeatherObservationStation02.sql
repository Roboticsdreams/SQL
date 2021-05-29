/*
Weather Observation Station 2

Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.

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

raiserror('Now at aggregation.proc_09wos02 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_09wos02 AS
SELECT 
	CAST(ROUND(SUM(LAT_N),2) AS NUMERIC(10,2)) LAT, 
	CAST(ROUND(SUM(LONG_W),2) AS NUMERIC(10,2)) LON
from
	aggregation.STATION;
GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_09wos02 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   LAT        float,
	   LON		  float
    );

    INSERT INTO actual (LAT, LON) exec aggregation.proc_09wos02

    CREATE TABLE expected (
	   LAT        float,
	   LON		  float
    );

	INSERT INTO expected (LAT, LON) select 42850.04,47381.48

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_09wos02]';