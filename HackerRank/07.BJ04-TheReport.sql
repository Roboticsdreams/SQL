/*
The Report

You are given two tables Students and Grades. Students contains three columns ID, Name and Marks.

+--------+---------+
| Column |  Type   |
+--------+---------+
| ID     | Integer |
| Name   | String  |
| Marks  | Integer |
+--------+---------+

Grades contains the following data
+-------+----------+----------+
| Grade | Min_Mark | Max_Mark |
+-------+----------+----------+
|     1 |        0 |        9 |
|     2 |       10 |       19 |
|     3 |       20 |       29 |
|     4 |       30 |       39 |
|     5 |       40 |       49 |
|     6 |       50 |       59 |
|     7 |       60 |       69 |
|     8 |       70 |       79 |
|     9 |       80 |       89 |
|    10 |       90 |      100 |
+-------+----------+----------+

Ketty gives Eve a task to generate a report containing three columns Name, Grade and Mark. Ketty doesnt want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use NULL as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.

Sample Input
+----+----------+-------+
| ID |   Name   | Marks |
+----+----------+-------+
|  1 | Julia    |    88 |
|  2 | Samantha |    68 |
|  3 | Maria    |    99 |
|  4 | Scarlet  |    78 |
|  5 | Ashley   |    63 |
|  6 | Jane     |    81 |
+----+----------+-------+

Sample Output

Maria 10 99
Jane 9 81
Julia 9 88 
Scarlet 8 78
NULL 7 63
NULL 7 68

Note

Print NULL  as the name if the grade is less than 8.

Explanation

Consider the following table with the grades assigned to the students

+----+----------+-------+-------+
| ID |   Name   | Marks | Grade |
+----+----------+-------+-------+
|  1 | Julia    |    88 |     9 |
|  2 | Samantha |    68 |     7 |
|  3 | Maria    |    99 |    10 |
|  4 | Scarlet  |    78 |     8 |
|  5 | Ashley   |    63 |     7 |
|  6 | Jane     |    81 |     9 |
+----+----------+-------+-------+

So, the following students got 8, 9 or 10 grades

Maria (grade 10)
Jane (grade 9)
Julia (grade 9)
Scarlet (grade 8)
*/

use hackerrank;

GO

raiserror('Now at basicjoin.proc_04thereport creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_04thereport AS
SELECT 
	CASE 
		WHEN g.grade < 8 THEN 'NULL' 
		ELSE s.name 
    END as name, 
	g.grade, 
	s.marks 
FROM 
	basicjoin.STUDENTS s,
	basicjoin.GRADES g 
WHERE 
	s.marks >= g.min_mark AND 
	s.marks <= g.max_mark 
ORDER BY 
	g.grade DESC, s.name;
GO

raiserror('Now at BasicJoinTestClass.test_04thereport creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_04thereport
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  NAME			varchar(44)     NULL,
		  GRADES		int				NULL,
		  MARKS			int				NULL
    );

    INSERT INTO actual (NAME, GRADES, MARKS) exec basicjoin.proc_04thereport

    CREATE TABLE expected (
		  NAME			varchar(44)     NULL,
		  GRADES		int				NULL,
		  MARKS			int				NULL
    );

	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Britney',10,95
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Heraldo',10,94
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Julia',10,96
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Kristeen',10,100
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Stuart',10,99
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Amina',9,89
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Christene',9,88
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Salma',9,81
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Samantha',9,87
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Scarlet',9,80
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Vivek',9,84
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Aamina',8,77
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Belvet',8,78
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Paige',8,74
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Priya',8,76
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'Priyanka',8,77
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'NULL',7,64
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'NULL',7,66
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'NULL',6,55
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'NULL',4,34
	INSERT INTO expected (NAME, GRADES, MARKS) SELECT 'NULL',3,24

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_04thereport]';