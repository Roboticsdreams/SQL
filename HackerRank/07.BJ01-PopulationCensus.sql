/*
Population Census

Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Input Format

The CITY and COUNTRY tables are described as follows: 

CITY
+-------------+--------------+
|    Field    |     Type     |
+-------------+--------------+
| ID          | number       |
| Name        | varchar2(17) |
| CountryCode | varchar2(3)  |
| District    | varchar2(20) |
| Population  | number       |
+-------------+--------------+

COUNTRY
+----------------+--------------+
|     Field      |     Type     |
+----------------+--------------+
| Code           | varchar2(3)  |
| Name           | varchar2(44) |
| Continent      | varchar2(13) |
| Region         | varchar2(25) |
| SurfaceArea    | number       |
| IndepYear      | varchar2(5)  |
| Population     | number       |
| Lifeexpectancy | varchar2(4)  |
| GNP            | number       |
| GNPOLD         | varchar2(9)  |
| LocalName      | varchar2(44) |
| GovernmentForm | varchar2(44) |
| HeadofState    | varchar2(32) |
| Capital        | varchar2(4)  |
| Code2          | varchar2(2)  |
+----------------+--------------+
*/

use hackerrank;


use hackerrank;

GO

raiserror('Now at basicjoin.proc_01populationcensus creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_01populationcensus (@OutParams int OUT)
AS
SELECT 
	@OutParams = sum(c.population)
FROM
	basicjoin.CITY c, 
	basicjoin.COUNTRY cc 
WHERE
	c.countrycode = cc.code and
	cc.CONTINENT = 'Asia';
GO

raiserror('Now at BasicJoinTestClass.test_01populationcensus creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_01populationcensus
AS
BEGIN
    DECLARE @expected int;
    DECLARE @actual int;
	exec basicjoin.proc_01populationcensus @actual OUT
	SET @expected = 27028484;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_01populationcensus]';