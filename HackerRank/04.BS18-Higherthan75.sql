/*
Higher Than 75 Marks

Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Input Format

+--------+---------+
| COLUMN |  TYPE   |
+--------+---------+
| ID     | Integer |
| NAME   | String  |
| MARKS  | Integer |
+--------+---------+

The STUDENTS table is described as follows:  
The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
Sample Input

+----+----------+-------+
| ID |   Name   | Marks |
+----+----------+-------+
|  1 | Ashley   |    81 |
|  2 | Samantha |    75 |
|  3 | Belvet   |    84 |
|  4 | Julia    |    76 |
+----+----------+-------+

Sample Output

Ashley
Julia
Belvet
Explanation

Only Ashley, Julia, and Belvet have Marks > 75. 

If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
*/


use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_18higherthan75 AS
select 
	name
from 
	basicselect.STUDENTS 
where 
	marks > 75 
order by 
	right(name,3);
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_18higherthan75  AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   NAME    varchar(21)
    );

    INSERT INTO actual (NAME) exec basicselect.proc_18higherthan75

    CREATE TABLE expected (
	   NAME     varchar(21)
    );

	INSERT INTO expected (NAME) select 'Stuart'
	INSERT INTO expected (NAME) select 'Kristeen'
	INSERT INTO expected (NAME) select 'Christene'
	INSERT INTO expected (NAME) select 'Aamina'
	INSERT INTO expected (NAME) select 'Amina'
	INSERT INTO expected (NAME) select 'Priya'
	INSERT INTO expected (NAME) select 'Heraldo'
	INSERT INTO expected (NAME) select 'Scarlet'
	INSERT INTO expected (NAME) select 'Julia'
	INSERT INTO expected (NAME) select 'Salma'
	INSERT INTO expected (NAME) select 'Britney'
	INSERT INTO expected (NAME) select 'Priyanka'
	INSERT INTO expected (NAME) select 'Samantha'
	INSERT INTO expected (NAME) select 'Vivek'
	INSERT INTO expected (NAME) select 'Belvet'
	INSERT INTO expected (NAME) select 'Evil'
	INSERT INTO expected (NAME) select 'Devil'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_18higherthan75]';