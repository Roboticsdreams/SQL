/*
Average Population

Query the average population for all cities in CITY2, rounded down to the nearest integer.

Input Format

The CITY2 table is described as follows: 

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

raiserror('Now at aggregation.proc_04averagepopulation creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_04averagepopulation (@OutParams int OUT)
AS
SELECT @OutParams = round(avg(population),0) from aggregation.CITY2;
GO

raiserror('Now at AggregationTestClass.test_04averagepopulation creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_04averagepopulation
AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec aggregation.proc_04averagepopulation @actual OUT
	SET @expected = 454250;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

exec tSQLt.Run 'AggregationTestClass.[test_04averagepopulation]';
