/*
Japan Population

Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

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

raiserror('Now at aggregation.proc_05japanpopulation creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_05japanpopulation (@OutParams int OUT)
AS
SELECT @OutParams = sum(population) from aggregation.CITY2 where countrycode='JPN';
GO

raiserror('Now at AggregationTestClass.test_05japanpopulation creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_05japanpopulation 
AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec aggregation.proc_05japanpopulation  @actual OUT
	SET @expected = 879196;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_05japanpopulation]';
