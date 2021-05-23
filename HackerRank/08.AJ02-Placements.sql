/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and
Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains
two columns: ID and Salary (offered salary in $ thousands per month).

Students
+--------+---------+
| Column |  Type   |
+--------+---------+
| ID     | Integer |
| Name   | String  |
+--------+---------+

Friends
+-----------+---------+
|  Column   |  Type   |
+-----------+---------+
| ID        | Integer |
| Friend_ID | Integer |
+-----------+---------+

Packages
+--------+---------+
| Column |  Type   |
+--------+---------+
| ID     | Integer |
| Salary | Float   |
+--------+---------+


Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.

Sample Input

Students
+----+----------+
| ID |   Name   |
+----+----------+
| 1  | Ashley   |
| 2  | Samantha |
| 3  | Julia    |
| 4  | Scarlet  |
+----+----------+

Friends
+----+-----------+
| ID | Friend_ID |
+----+-----------+
| 1  |         2 |
| 1  |         3 |
| 3  |         4 |
| 4  |         1 |
+----+-----------+

Packages
+-----+--------+
| ID  | Salary |
+-----+--------+
|   1 | 15.20  |
|   2 | 10.06  |
|   3 | 11.55  |
|   4 | 12.12  |
+-----+--------+

Sample Output

Samantha
Julia
Scarlet

Explanation

See the following table:
+---------------+--------+----------+-------+---------+
|      ID       |   1    |    2     |   3   |    4    |
+---------------+--------+----------+-------+---------+
| Name          | Ashley | Samantha | Julia | Scarlet |
| Salary        | 15.2   | 10.06    | 11.55 | 12.12   |
| Friend ID     | 2      | 3        | 4     | 1       |
| Friend Salary | 10.06  | 11.55    | 12.12 | 15.2    |
+---------------+--------+----------+-------+---------+

Now,

Samantha's best friend got offered a higher salary than her at 11.55
Julia's best friend got offered a higher salary than her at 12.12
Scarlet's best friend got offered a higher salary than her at 15.2
Ashley's best friend did NOT get offered a higher salary than her
The name output, when ordered by the salary offered to their friends, will be:

Samantha
Julia
Scarlet
*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE advancedjoin.proc_02placements AS
SELECT S.Name FROM advancedjoin.STUDENTS S
JOIN advancedjoin.FRIENDS F ON S.ID = F.ID
LEFT JOIN advancedjoin.PACKAGES P1 ON S.ID = P1.ID
LEFT JOIN advancedjoin.PACKAGES P2 ON F.Friend_ID = P2.ID
WHERE P2.Salary > P1.Salary
ORDER BY P2.Salary;
GO

CREATE or ALTER PROCEDURE AdvancedJoinTestClass.test_02placements
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	      NAME      varchar(30)        NOT NULL,
    );

    INSERT INTO actual (NAME) exec advancedjoin.proc_02placements 

    CREATE TABLE expected (
	   NAME      varchar(30)        NOT NULL,
    );

	INSERT INTO expected (NAME) SELECT 'Stuart';
	INSERT INTO expected (NAME) SELECT 'Priyanka';
	INSERT INTO expected (NAME) SELECT 'Paige';
	INSERT INTO expected (NAME) SELECT 'Jane';
	INSERT INTO expected (NAME) SELECT 'Julia';
	INSERT INTO expected (NAME) SELECT 'Belvet';
	INSERT INTO expected (NAME) SELECT 'Amina';
	INSERT INTO expected (NAME) SELECT 'Kristeen';
	INSERT INTO expected (NAME) SELECT 'Scarlet';
	INSERT INTO expected (NAME) SELECT 'Priya';
	INSERT INTO expected (NAME) SELECT 'Meera';

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedJoinTestClass.[test_02placements]';

