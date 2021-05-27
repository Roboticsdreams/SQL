/*
Occupations 

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows:

+------------+--------+
|  COLUMNS   |  TYPE  |
+------------+--------+
| Name       | String |
| Occupation | String |
+------------+--------+

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input

+-----------+------------+
|   Name    | Occupation |
+-----------+------------+
| Samantha  | Doctor     |
| Julia     | Actor      |
| Maria     | Actor      |
| Meera     | Singer     |
| Ashley    | Professor  |
| Ketty     | Professor  |
| Christeen | Professor  |
| Jane      | Actor      |
| Jenny     | Doctor     |
| Priya     | Singer     |
+-----------+------------+


Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria

Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.
*/

use hackerrank;

GO

raiserror('Now at the create procedure 2.3 Occupations....',0,1)

GO

CREATE or ALTER PROCEDURE advancedselect.proc_03occupations AS
Select [Doctor],[Professor],[Singer],[Actor]
From (
Select Occupation, Name, Row_Number() Over(Partition By Occupation Order by Name)SNo
From advancedselect.OCCUPATIONS
)tt
Pivot (Max(Name) For Occupation in ([Doctor],[Professor],[Singer],[Actor]))a
GO

CREATE or ALTER PROCEDURE AdvancedSelectTestClass.test_03occupations
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  DOCTOR		varchar(10)		   NULL,
	      PROFESSOR		varchar(10)        NULL,
	      SINGER		varchar(10)        NULL,
	      ACTOR			varchar(10)        NULL,
    );

    INSERT INTO actual (DOCTOR, PROFESSOR, SINGER, ACTOR) exec advancedselect.proc_03occupations

    CREATE TABLE expected (
		  DOCTOR		varchar(10)		   NULL,
	      PROFESSOR		varchar(10)        NULL,
	      SINGER		varchar(10)        NULL,
	      ACTOR			varchar(10)        NULL,
    );

    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT 'Aamina','Ashley','Christeen','Eve'
    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT 'Julia','Belvet','Jane','Jennifer'
    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT 'Priya','Britney','Jenny','Ketty'
    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT NULL,'Maria','Kristeen','Samantha'
    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT NULL,'Meera',NULL,NULL
    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT NULL,'Naomi',NULL,NULL
    INSERT INTO expected (DOCTOR, PROFESSOR, SINGER, ACTOR) SELECT NULL,'Priyanka',NULL,NULL

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'AdvancedSelectTestClass.[test_03occupations]';

