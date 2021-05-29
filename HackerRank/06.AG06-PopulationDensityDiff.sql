/*
Population Density Difference

Query the difference between the maximum and minimum populations in CITY.

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

raiserror('Now at aggregation.proc_06populationdensitydiff creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_06populationdensitydiff (@OutParams int OUT)
AS
SELECT @OutParams = max(population) - min(population) from aggregation.CITY2;
GO

raiserror('Now at AggregationTestClass.test_06populationdensitydiff creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_06populationdensitydiff
AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec aggregation.proc_06populationdensitydiff @actual OUT
	SET @expected = 4695354;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_06populationdensitydiff]';
