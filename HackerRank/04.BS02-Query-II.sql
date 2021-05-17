/*
Revising the Select Query II

Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.

Input Format:

The CITY table is described as follows:

FILEDS			TYPE
ID				NUMBER
NAME			VARCHAR2(17)
COUNRTYCODE		VARCHAR2(3)
DISTRICT		VARCHAR2(20)
POPULATION		NUMBER

*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_02query2 AS
select 
	basicselect.CITY.name as NAME
from 
	basicselect.CITY
where
	basicselect.CITY.POPULATION > 120000 and 
	basicselect.CITY.COUNTRYCODE = 'USA'
order by basicselect.CITY.id;

GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_02query2
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   NAME           varchar(17),
    );

    INSERT INTO actual (NAME) exec basicselect.proc_02query2;

    CREATE TABLE expected (
	   NAME           varchar(17),
    );

	INSERT INTO expected (NAME) SELECT 'El Paso'
	INSERT INTO expected (NAME) SELECT 'Scottsdale'
	INSERT INTO expected (NAME) SELECT 'Corona'
	INSERT INTO expected (NAME) SELECT 'Concord'
	INSERT INTO expected (NAME) SELECT 'Cedar Rapids'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_02query2]';