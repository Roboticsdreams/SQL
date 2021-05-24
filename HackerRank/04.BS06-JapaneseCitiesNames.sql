/*
Japanese Cities' Names

Query the names of all the Japanese cities in the CITY2 table. The COUNTRYCODE for Japan is JPN.

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

CREATE or ALTER PROCEDURE basicselect.proc_06jpncityname AS
select 
	NAME
from 
	basicselect.CITY2 
where 
	COUNTRYCODE='JPN';
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_06jpncityname
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   NAME           varchar(17)
    );

    INSERT INTO actual (NAME) exec basicselect.proc_06jpncityname

    CREATE TABLE expected (
	   NAME           varchar(17)
    );

	INSERT INTO expected (NAME) select 'Neyagawa'
	INSERT INTO expected (NAME) select 'Ageo'
	INSERT INTO expected (NAME) select 'Sayama'
	INSERT INTO expected (NAME) select 'Omuta'
	INSERT INTO expected (NAME) select 'Tokuyama'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_06jpncityname]';