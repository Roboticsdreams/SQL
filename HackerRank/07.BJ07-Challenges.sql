/*
Challenges

Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Input Format

The following tables contain challenge data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 
+---------------+---------+
|    Column     |  Type   |
+---------------+---------+
| hacker_id     | Integer |
| name          | String  |
+---------------+---------+

Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge.
+---------------+---------+
|    Column     |  Type   |
+---------------+---------+
| chanllenge_id | Integer |
| hacker_id     | Integer |
+---------------+---------+

Sample Input 0

Challenges Table: 
+--------------+-----------+
| challenge_id | hacker_id |
+--------------+-----------+
|        61654 |      5077 |
|        58302 |     21283 |
|        40587 |     88255 |
|        29477 |      5077 |
|         1220 |     21283 |
|        69514 |     21283 |
|        46561 |     62743 |
|        58077 |     62743 |
|        18483 |     88255 |
|        76766 |     21283 |
|        52382 |      5077 |
|        74467 |     21283 |
|        33625 |     96196 |
|        26053 |     88255 |
|        42665 |     62743 |
|        12859 |     62743 |
|        70094 |     21283 |
|        34599 |     88255 |
|        54680 |     88255 |
|        61881 |      5077 |
+--------------+-----------+

Hackers Table: 
+-----------+---------+
| hacker_id |  name   |
+-----------+---------+
|      5077 | Rose    |
|     21283 | Angela  |
|     62743 | Frank   |
|     88255 | Patrick |
|     96196 | Lisa    |
+-----------+---------+

Sample Output 0
+-----------+---------+--------------------+
| hacker_id |  name   | challenges_created |
+-----------+---------+--------------------+
|     21283 | Angela  |                  6 |
|     88255 | Patrick |                  5 |
|     96196 | Lisa    |                  1 |
+-----------+---------+--------------------+


Sample Input 1

Challenges Table: 
+--------------+-----------+
| challenge_id | hacker_id |
+--------------+-----------+
|        63963 |     81041 |
|        63117 |     79345 |
|        28225 |     34856 |
|        21989 |     12299 |
|         4653 |     12299 |
|        70070 |     79345 |
|        36905 |     34856 |
|        61136 |     80491 |
|        17234 |     12299 |
|        80308 |     79345 |
|        40510 |     34856 |
|        79820 |     80491 |
|        22720 |     12299 |
|        21394 |     12299 |
|        36261 |     34856 |
|        15334 |     12299 |
|        71435 |     79345 |
|        23157 |     34856 |
|        54102 |     34856 |
|        69065 |     80491 |
+--------------+-----------+

Hackers Table: 
+-----------+---------+
| hacker_id |  name   |
+-----------+---------+
|     12299 | Rose    |
|     34856 | Angela  |
|     79345 | Frank   |
|     80491 | Patrick |
|     81041 | Lisa    |
+-----------+---------+

Sample Output 1
+-----------+---------+--------------------+
| hacker_id |  name   | challenges_created |
+-----------+---------+--------------------+
|     12299 | Rose    |                  6 |
|     34856 | Angela  |                  6 |
|     79345 | Frank   |                  4 |
|     80491 | Patrick |                  3 |
|     81041 | Lisa    |                  1 |
+-----------+---------+--------------------+

Explanation

For Sample Case 0, we can get the following details:
+-----------+---------+--------------------+
| hacker_id |  name   | challenges_created |
+-----------+---------+--------------------+
|     21283 | Angela  |                  6 |
|     88255 | Patrick |                  5 |
|      5077 | Rose    |                  4 |
|     62743 | Frank   |                  4 |
|     96196 | Lisa    |                  1 |
+-----------+---------+--------------------+

Students 5077 and 62743 both created 4 challenges, but the maximum number of challenges created is 6 so these students are excluded from the result.

For Sample Case 1, we can get the following details:
+-----------+---------+--------------------+
| hacker_id |  name   | challenges_created |
+-----------+---------+--------------------+
|     12299 | Rose    |                  6 |
|     34856 | Angela  |                  6 |
|     79345 | Frank   |                  4 |
|     80491 | Patrick |                  3 |
|     81041 | Lisa    |                  1 |
+-----------+---------+--------------------+

Students 12299 and 34856 both created 6 challenges. 
Because 6 is the maximum number of challenges created, these students are included in the result.
*/

use hackerrank;

GO

raiserror('Now at basicjoin.proc_07challenges creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_07challenges AS
;WITH H AS
(
    SELECT
        h.hacker_id, h.name,
        COUNT(c.challenge_id) AS Ct
    FROM
        basicjoin.CH_HACKERS AS h
    INNER JOIN
        basicjoin.CH_CHALLENGES AS c
    ON
        h.hacker_id = c.hacker_id
    GROUP BY
        h.hacker_id, h.name
), C AS
(
    SELECT Ct, COUNT(*) AS TCt, MAX(Ct) OVER() AS MCT
    FROM H
    GROUP BY Ct
)
SELECT
    h.hacker_id,
    h.name,
    h.Ct as cnt
FROM
    H
INNER JOIN
    C
ON
    H.Ct = C.Ct AND
    (C.TCt = 1 OR C.Ct = MCT)
ORDER BY
    h.Ct DESC,
    h.hacker_id;
GO

raiserror('Now at BasicJoinTestClass.test_07challenges creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_07challenges
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  hacker_id		int				NOT NULL,
		  name			varchar(25)	    NULL,
		  cnt			int				NULL,
    );

    INSERT INTO actual (hacker_id, name, cnt) exec basicjoin.proc_07challenges

    CREATE TABLE expected (
		  hacker_id		int				NOT NULL,
		  name			varchar(25)	    NULL,
		  cnt			int				NULL
    );

	INSERT INTO expected (hacker_id, name, cnt) SELECT 	5120,'Julia',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	18425,'Anna',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	20023,'Brian',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	33625,'Jason',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	41805,'Benjamin',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	52462,'Nicholas',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	64036,'Craig',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	69471,'Michelle',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	77173,'Mildred',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	94278,'Dennis',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	96009,'Russell',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	96716,'Emily',50	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	72866,'Eugene',42	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	37068,'Patrick',41	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	12766,'Jacqueline',40	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	86280,'Beverly',37	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	19835,'Joyce',36	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	38316,'Walter',35	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	29483,'Jeffrey',34	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	23428,'Arthur',33	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	95437,'George',32	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	46963,'Barbara',31	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	87524,'Norma',30	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	84085,'Johnny',29	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	39582,'Maria',28	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	65843,'Thomas',27	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	5443,'Paul',26	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	52965,'Bobby',25	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	77105,'Diana',24	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	33787,'Susan',23	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	45855,'Clarence',22	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	33177,'Jane',21	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	7302,'Victor',20	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	54461,'Janet',19	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	42277,'Sara',18	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	99388,'Mary',16	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	31426,'Carlos',15	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	95010,'Victor',14	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	27071,'Gerald',10	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	90267,'Edward',9	
	INSERT INTO expected (hacker_id, name, cnt) SELECT 	72609,'Bobby',8	


    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_07challenges]';