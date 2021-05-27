/*
The PADS

Generate the following two result sets:

1.Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

2. There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

Input Format

+------------+--------+
|   COLUMN   |  TYPE  |
+------------+--------+
| Name       | String |
| Occupation | String |
+------------+--------+

The OCCUPATIONS table is described as follows:  Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input

An OCCUPATIONS table that contains the following records:

+-----------+------------+
|   Name    | Occupation |
+-----------+------------+
| Samantha  | Doctor     |
| Julia     | Actor      |
| Maria     | Actor      |
| Meera     | Singer     |
| Ashely    | Professor  |
| Ketty     | Professor  |
| Christeen | Professor  |
| Jane      | Actor      |
| Jenny     | Doctor     |
| Priya     | Singer     |
+-----------+------------+

Sample Output

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)

There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

Explanation

The results of the first query are formatted to the problem description's specifications.
The results of the second query are ascendingly ordered first by number of names corresponding to each profession (2 <= 2 <= 3 <= 3), and then alphabetically by profession (Doctor <= singer and actor <= professor ).
*/

use hackerrank;

GO

raiserror('Now at the create procedure 2.2 the pads....',0,1)

GO

CREATE or ALTER PROCEDURE advancedselect.proc_02thepads AS
select 
	CONCAT('There are a total of ', a.pcount, ' ', 
		case 
			when a.pcount > 1 
				then concat(lower(a.occupation), 's') 
			else lower(a.occupation) 
		end,'.') 
from (
	select 
		occupation, 
		count(name) as pcount 
	from 
		advancedselect.OCCUPATIONS
	group by 
		occupation 
	having count(name) > 0 
	) as a order by a.pcount
GO

CREATE or ALTER PROCEDURE AdvancedSelectTestClass.test_02thepads
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	      RESULT		varchar(50)        NOT NULL,
    );

    INSERT INTO actual (RESULT) exec advancedselect.proc_02thepads

    CREATE TABLE expected (
	      RESULT		varchar(50)        NOT NULL,
    );

	INSERT INTO expected (RESULT) SELECT 'There are a total of 3 doctors.'
	INSERT INTO expected (RESULT) SELECT 'There are a total of 4 actors.'
	INSERT INTO expected (RESULT) SELECT 'There are a total of 4 singers.'
	INSERT INTO expected (RESULT) SELECT 'There are a total of 7 professors.'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedSelectTestClass.[test_02thepads]';

