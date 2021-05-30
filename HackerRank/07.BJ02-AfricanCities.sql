/*
African Cities

Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key column

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

GO

raiserror('Now at basicjoin.proc_02africancities creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_02africancities AS
SELECT 
	c.name
FROM
	basicjoin.CITY c, 
	basicjoin.COUNTRY cc 
WHERE
	c.countrycode = cc.code and
	cc.CONTINENT = 'Africa';
GO

raiserror('Now at BasicJoinTestClass.test_02africancities creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_02africancities
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  NAME		varchar(44)     NOT NULL,
    );

    INSERT INTO actual (NAME) exec basicjoin.proc_02africancities

    CREATE TABLE expected (
		  NAME		varchar(44)     NOT NULL,
    );

	INSERT INTO expected (NAME) SELECT 'Qina'
	INSERT INTO expected (NAME) SELECT 'Warraq al-Arab'
	INSERT INTO expected (NAME) SELECT 'Kempton Park'
	INSERT INTO expected (NAME) SELECT 'Alberton'
	INSERT INTO expected (NAME) SELECT 'Klerksdorp'
	INSERT INTO expected (NAME) SELECT 'Uitenhage'
	INSERT INTO expected (NAME) SELECT 'Brakpan'
	INSERT INTO expected (NAME) SELECT 'Libreville'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_02africancities]';
