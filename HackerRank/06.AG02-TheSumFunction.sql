/*
Revising Aggregations - The Sum Function

Query the total population of all cities in CITY where District is California.

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

raiserror('Now at aggregation.proc_02thesumfunction creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_02thesumfunction (@OutParams int OUT)
AS
SELECT @OutParams = sum(population) from aggregation.CITY where district='California';
GO

raiserror('Now at AggregationTestClass.test_02thesumfunction creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_02thesumfunction
AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec aggregation.proc_02thesumfunction @actual OUT
	SET @expected = 339002;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_02thesumfunction]';
