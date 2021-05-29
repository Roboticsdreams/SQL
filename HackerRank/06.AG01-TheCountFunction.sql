/*
Revising Aggregations - The Count Function

Query a count of the number of cities in CITY having a Population larger than 100000.

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

raiserror('Now at aggregation.proc_01thecountfunction creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_01thecountfunction (@OutParams int OUT)
AS
SELECT @OutParams = count(id) from aggregation.CITY where population >= 100000;
GO

raiserror('Now at AggregationTestClass.test_01thecountfunction creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_01thecountfunction
AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec aggregation.proc_01thecountfunction @actual OUT
	SET @expected = 6;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_01thecountfunction]';
