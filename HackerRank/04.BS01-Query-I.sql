/*
Revising the Select Query I

Query all the columns for all American cities in CITY with populations larger than 100000. 

The Country Code for America is USA.

Input Format:

The CITY table is described as follows:

+-------------+--------------+
|   FILEDS    |     TYPE     |
+-------------+--------------+
| ID          | NUMBER       |
| NAME        | VARCHAR2(17) |
| COUNRTYCODE | VARCHAR2(3)  |
| DISTRICT    | VARCHAR2(20) |
| POPULATION  | NUMBER       |
+-------------+--------------+

*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_01query1 AS
select 
	basicselect.CITY.id as ID, 
	basicselect.CITY.name as NAME,
	basicselect.CITY.countrycode as COUNTRYCODE,
	basicselect.CITY.district as DISTRICT,
	basicselect.CITY.population as POPULATION
from 
	basicselect.CITY
where
	basicselect.CITY.POPULATION > 100000 and 
	basicselect.CITY.COUNTRYCODE = 'USA'
order by basicselect.CITY.id;

GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_01query1
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

    INSERT INTO actual (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) exec basicselect.proc_01query1;

    CREATE TABLE expected (
	   ID         	  int        		NOT NULL,
	   NAME           varchar(17),
	   COUNTRYCODE	  varchar(3),
	   DISTRICT       varchar(20),
	   POPULATION     int,
    );

	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) SELECT 3815,'El Paso','USA','Texas',563662
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) SELECT 3878,'Scottsdale','USA','Arizona',202705
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) SELECT 3965,'Corona','USA','California',124966
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) SELECT 3973,'Concord','USA','California',121780
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) SELECT 3977,'Cedar Rapids','USA','Iowa',120758
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) SELECT 3982,'Coral Springs','USA','Florida',117549

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_01query1]';