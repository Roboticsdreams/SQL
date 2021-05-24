/*
Weather Observation Station 6

Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

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

Sample Input

Let's say that CITY only has four entries: DEF, ABC, PQRS and WXY

Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with the respective lengths 3, 3, 4 and 3. The longest-named city is obviously PQRS, but there are 3 options for shortest-named city; we choose ABC, because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. It need not be a single query.
*/


use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_11wos06 AS
select 
	distinct(city) 
from 
	basicselect.STATION
where 
	upper(substring(city, 1,1)) in ('A','E','I','O','U');
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_11wos06 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   CITY           varchar(21)
    );

    INSERT INTO actual (CITY) exec basicselect.proc_11wos06

    CREATE TABLE expected (
	   CITY           varchar(21)
    );

	INSERT INTO expected (CITY) select 'Acme'
	INSERT INTO expected (CITY) select 'Addison'
	INSERT INTO expected (CITY) select 'Agency'
	INSERT INTO expected (CITY) select 'Aguanga'
	INSERT INTO expected (CITY) select 'Alanson'
	INSERT INTO expected (CITY) select 'Alba'
	INSERT INTO expected (CITY) select 'Albany'
	INSERT INTO expected (CITY) select 'Albion'
	INSERT INTO expected (CITY) select 'Algonac'
	INSERT INTO expected (CITY) select 'Aliso Viejo'
	INSERT INTO expected (CITY) select 'Allerton'
	INSERT INTO expected (CITY) select 'Alpine'
	INSERT INTO expected (CITY) select 'Alton'
	INSERT INTO expected (CITY) select 'Amazonia'
	INSERT INTO expected (CITY) select 'Amo'
	INSERT INTO expected (CITY) select 'Andersonville'
	INSERT INTO expected (CITY) select 'Andover'
	INSERT INTO expected (CITY) select 'Anthony'
	INSERT INTO expected (CITY) select 'Archie'
	INSERT INTO expected (CITY) select 'Arispe'
	INSERT INTO expected (CITY) select 'Arkadelphia'
	INSERT INTO expected (CITY) select 'Arlington'
	INSERT INTO expected (CITY) select 'Arrowsmith'
	INSERT INTO expected (CITY) select 'Athens'
	INSERT INTO expected (CITY) select 'Atlantic Mine'
	INSERT INTO expected (CITY) select 'Auburn'
	INSERT INTO expected (CITY) select 'East China'
	INSERT INTO expected (CITY) select 'East Haddam'
	INSERT INTO expected (CITY) select 'East Irvine'
	INSERT INTO expected (CITY) select 'Eastlake'
	INSERT INTO expected (CITY) select 'Edgewater'
	INSERT INTO expected (CITY) select 'Effingham'
	INSERT INTO expected (CITY) select 'Eleele'
	INSERT INTO expected (CITY) select 'Elkton'
	INSERT INTO expected (CITY) select 'Elm Grove'
	INSERT INTO expected (CITY) select 'Emmett'
	INSERT INTO expected (CITY) select 'Equality'
	INSERT INTO expected (CITY) select 'Eriline'
	INSERT INTO expected (CITY) select 'Ermine'
	INSERT INTO expected (CITY) select 'Eros'
	INSERT INTO expected (CITY) select 'Eskridge'
	INSERT INTO expected (CITY) select 'Esmond'
	INSERT INTO expected (CITY) select 'Eufaula'
	INSERT INTO expected (CITY) select 'Eureka Springs'
	INSERT INTO expected (CITY) select 'Eustis'
	INSERT INTO expected (CITY) select 'Everton'
	INSERT INTO expected (CITY) select 'Irvington'
	INSERT INTO expected (CITY) select 'Oakfield'
	INSERT INTO expected (CITY) select 'Oconee'
	INSERT INTO expected (CITY) select 'Odin'
	INSERT INTO expected (CITY) select 'Ojai'
	INSERT INTO expected (CITY) select 'Olmitz'
	INSERT INTO expected (CITY) select 'Onaway'
	INSERT INTO expected (CITY) select 'Orange City'
	INSERT INTO expected (CITY) select 'Orange Park'
	INSERT INTO expected (CITY) select 'Osage City'
	INSERT INTO expected (CITY) select 'Osborne'
	INSERT INTO expected (CITY) select 'Oshtemo'
	INSERT INTO expected (CITY) select 'Ottertail'
	INSERT INTO expected (CITY) select 'Ozona'
	INSERT INTO expected (CITY) select 'Udall'
	INSERT INTO expected (CITY) select 'Ukiah'
	INSERT INTO expected (CITY) select 'Union Star'
	INSERT INTO expected (CITY) select 'Upperco'
	INSERT INTO expected (CITY) select 'Urbana' 

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_11wos06]';