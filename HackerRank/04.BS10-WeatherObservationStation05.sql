/*
Weather Observation Station 5

Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

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

CREATE or ALTER PROCEDURE basicselect.proc_10wos05 AS
select 
	s1.CITY, 
	s1.namelength 
from (
	select 
		* 
	from (
		select 
			CITY, 
			len(CITY) namelength, 
			ROW_NUMBER() OVER (PARTITION BY len(CITY) order by CITY) as RN 
		from 
			basicselect.STATION 
		)t 
		where t.RN=1
	)s1 ,
	(SELECT 
		max(len(CITY)) maxval, 
		min(len(CITY)) minval 
	from 
		basicselect.STATION 
	) s2
	where 
		s1.namelength=s2.maxval or
		s1.namelength=s2.minval;
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_10wos05 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   CITY           varchar(21),
	   NAMELENGTH	 int
    );

    INSERT INTO actual (CITY, NAMELENGTH) exec basicselect.proc_10wos05

    CREATE TABLE expected (
	   CITY           varchar(21),
	   NAMELENGTH	 int
    );
	INSERT INTO expected (CITY, NAMELENGTH) select 'Amo',3
	INSERT INTO expected (CITY, NAMELENGTH) select 'Marine On Saint Croix',21

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_10wos05]';