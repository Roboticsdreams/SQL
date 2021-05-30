/*
Average Population of Each Continent

Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

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

GO

raiserror('Now at basicjoin.proc_03avgpopulation creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_03avgpopulation AS
SELECT
	cc.continent as NAME,
	floor(avg(c.population)) as POPULATION
FROM
	basicjoin.CITY c, 
	basicjoin.COUNTRY cc 
WHERE
	c.countrycode = cc.code
GROUP BY
	cc.continent;
GO

raiserror('Now at BasicJoinTestClass.test_03avgpopulation creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_03avgpopulation
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  NAME			varchar(44)     NOT NULL,
		  POPULATION	int				NULL,
    );

    INSERT INTO actual (NAME, POPULATION) exec basicjoin.proc_03avgpopulation

    CREATE TABLE expected (
		  NAME			varchar(44)     NOT NULL,
		  POPULATION	int				NULL,
    );

	INSERT INTO expected (NAME, POPULATION) SELECT 'Oceania',109189
	INSERT INTO expected (NAME, POPULATION) SELECT 'South America',147435
	INSERT INTO expected (NAME, POPULATION) SELECT 'Europe',175138
	INSERT INTO expected (NAME, POPULATION) SELECT 'Africa',274439
	INSERT INTO expected (NAME, POPULATION) SELECT 'Asia',693038

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_03avgpopulation]';
