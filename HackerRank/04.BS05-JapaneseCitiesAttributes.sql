/*
Japanese Cities' Attributes

Query all attributes of every Japanese city in the CITY2 table. The COUNTRYCODE for Japan is JPN.

Input Format

The CITY2 table is described as follows:

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

CREATE or ALTER PROCEDURE basicselect.proc_05jpncity AS
select 
	ID, 
	NAME, 
	COUNTRYCODE, 
	DISTRICT, 
	POPULATION 
from 
	basicselect.CITY2 
where 
	COUNTRYCODE='JPN';
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_05jpncity
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

    INSERT INTO actual (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) exec basicselect.proc_05jpncity

    CREATE TABLE expected (
	   ID         	  int        		NOT NULL,
	   NAME           varchar(17),
	   COUNTRYCODE	  varchar(3),
	   DISTRICT       varchar(20),
	   POPULATION     int,
    );

	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1613,'Neyagawa','JPN','Osaka',257315
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1630,'Ageo','JPN','Saitama',209442
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1661,'Sayama','JPN','Saitama',162472
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1681,'Omuta','JPN','Fukuoka',142889
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1739,'Tokuyama','JPN','Yamaguchi',107078

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_05jpncity]';