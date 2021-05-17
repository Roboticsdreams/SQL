/*
Select By ID

Query all columns for a city in CITY with the ID 1661.

Input Format

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

CREATE or ALTER PROCEDURE basicselect.proc_04selectbyid AS
select 
	basicselect.CITY.id as ID, 
	basicselect.CITY.name as NAME,
	basicselect.CITY.countrycode as COUNTRYCODE,
	basicselect.CITY.district as DISTRICT,
	basicselect.CITY.population as POPULATION
from 
	basicselect.CITY
where
	basicselect.CITY.id = 1661
order by basicselect.CITY.id;

GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_04selectbyid
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   ID         	  int        		NOT NULL,
	   NAME           varchar(17),
	   COUNTRYCODE	  varchar(3),
	   DISTRICT       varchar(20),
	   POPULATION     int,
    );

    INSERT INTO actual (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) exec basicselect.proc_04selectbyid;

    CREATE TABLE expected (
	   ID         	  int        		NOT NULL,
	   NAME           varchar(17),
	   COUNTRYCODE	  varchar(3),
	   DISTRICT       varchar(20),
	   POPULATION     int,
    );

	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1661,'Sayama','JPN','Saitama',162472

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_04selectbyid]';