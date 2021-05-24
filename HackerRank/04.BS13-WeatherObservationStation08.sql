/*
Weather Observation Station 8

Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:

+--------+--------------+
| FILEDS |     TYPE     |
+--------+--------------+
| ID     | NUMBER       |
| CITY   | VARCHAR2(21) |
| STATE  | VARCHAR2(2)  |
| LAT_N  | NUMBER       |
| LONG_W | NUMBER       |
+--------+--------------+

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/


use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_13wos08 AS
select 
	distinct(city)
from 
	basicselect.STATION
where 
	upper(left(city, 1)) in ('A','E','I','O','U') and 
	upper(right(city,1)) in ('A','E','I','O','U');
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_13wos08 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   CITY           varchar(21)
    );

    INSERT INTO actual (CITY) exec basicselect.proc_13wos08

    CREATE TABLE expected (
	   CITY           varchar(21)
    );

	INSERT INTO expected (CITY) select 'Acme'
	INSERT INTO expected (CITY) select 'Aguanga'
	INSERT INTO expected (CITY) select 'Alba'
	INSERT INTO expected (CITY) select 'Aliso Viejo'
	INSERT INTO expected (CITY) select 'Alpine'
	INSERT INTO expected (CITY) select 'Amazonia'
	INSERT INTO expected (CITY) select 'Amo'
	INSERT INTO expected (CITY) select 'Andersonville'
	INSERT INTO expected (CITY) select 'Archie'
	INSERT INTO expected (CITY) select 'Arispe'
	INSERT INTO expected (CITY) select 'Arkadelphia'
	INSERT INTO expected (CITY) select 'Atlantic Mine'
	INSERT INTO expected (CITY) select 'East China'
	INSERT INTO expected (CITY) select 'East Irvine'
	INSERT INTO expected (CITY) select 'Eastlake'
	INSERT INTO expected (CITY) select 'Eleele'
	INSERT INTO expected (CITY) select 'Elm Grove'
	INSERT INTO expected (CITY) select 'Eriline'
	INSERT INTO expected (CITY) select 'Ermine'
	INSERT INTO expected (CITY) select 'Eskridge'
	INSERT INTO expected (CITY) select 'Eufaula'
	INSERT INTO expected (CITY) select 'Oconee'
	INSERT INTO expected (CITY) select 'Ojai'
	INSERT INTO expected (CITY) select 'Osborne'
	INSERT INTO expected (CITY) select 'Oshtemo'
	INSERT INTO expected (CITY) select 'Ozona'
	INSERT INTO expected (CITY) select 'Upperco'
	INSERT INTO expected (CITY) select 'Urbana'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_13wos08]';