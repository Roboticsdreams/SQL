/*
Revising Aggregations - Averages

Query the average population of all cities in CITY where District is California.

Input Format

The CITY table is described as follows: 

+-------------+--------------+
|    Field    |     Type     |
+-------------+--------------+
| ID          | number       |
| Name        | varchar2(17) |
| CountryCode | varchar2(3)  |
| District    | varchar2(20) |
| Population  | number       |
+-------------+--------------+
*/

use hackerrank;

GO

raiserror('Now at aggregation.proc_03averages creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_03averages (@OutParams float OUT)
AS
SELECT @OutParams = ROUND(AVG(CAST(population AS FLOAT)), 3) from aggregation.CITY where district='California';
GO

raiserror('Now at AggregationTestClass.test_03averages creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_03averages
AS
BEGIN
    DECLARE @expected float;
    DECLARE @actual float;
	exec aggregation.proc_03averages @actual OUT
	SET @expected = 113000.667;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_03averages]';
