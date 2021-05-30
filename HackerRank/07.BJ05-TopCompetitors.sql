/*
Top Competitors

Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
+------------+---------+
|   Column   |  Type   |
+------------+---------+
| hacker_id  | Integer |
| name       | String  |
+------------+---------+

Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level.
+-----------------+---------+
|     Column      |  Type   |
+-----------------+---------+
| difficult_level | Integer |
| score           | Integer |
+-----------------+---------+

Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge. 
+-----------------+---------+
|     Column      |  Type   |
+-----------------+---------+
| challenge_id    | Integer |
| hacker_id       | Integer |
| difficult_level | Integer |
+-----------------+---------+

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission.
+---------------+---------+
|    Column     |  Type   |
+---------------+---------+
| submission_id | Integer |
| hacker_id     | Integer |
| challenge_id  | Integer |
| score         | Integer |
+---------------+---------+

Sample Input

Hackers Table:
+-----------+----------+
| hacker_id |   name   |
+-----------+----------+
|      5580 | Rose     |
|      8439 | Angela   |
|     27205 | Frank    |
|     52243 | Patrick  |
|     52348 | Lisa     |
|     57645 | Kimberly |
|     77726 | Bonnie   |
|     83082 | Michael  |
|     86870 | Todd     |
|     90411 | Joe      |
+-----------+----------+

Difficulty Table:
+-------------------+-------+
| difficulty_level  | score |
+-------------------+-------+
|                 1 |    20 |
|                 2 |    30 |
|                 3 |    40 |
|                 4 |    60 |
|                 5 |    80 |
|                 6 |   100 |
|                 7 |   120 |
+-------------------+-------+

Challenges Table:
+--------------+-----------+------------------+
| challenge_id | hacker_id | difficulty_level |
+--------------+-----------+------------------+
|         4810 |     77726 |                4 |
|        21089 |     27205 |                1 |
|        36566 |      5580 |                7 |
|        66730 |     52243 |                6 |
|        71055 |     52243 |                2 |
+--------------+-----------+------------------+

Submissions Table:
+----------------+-----------+--------------+-------+
| submission_id  | hacker_id | challenge_id | score |
+----------------+-----------+--------------+-------+
|          68628 |     77726 |        36566 |    30 |
|          65300 |     77726 |        21089 |    10 |
|          40326 |     52243 |        36566 |    77 |
|           8941 |     27205 |         4810 |     4 |
|          83554 |     77726 |        66730 |    30 |
|          43353 |     52243 |        66730 |     0 |
|          55385 |     52348 |        71055 |    20 |
|          39784 |     27205 |        71055 |    23 |
|          94613 |     86870 |        71055 |    30 |
|          45788 |     52348 |        36566 |     0 |
|          93058 |     86870 |        36566 |    30 |
|           7344 |      8439 |        66730 |    92 |
|           2721 |      8439 |         4810 |    36 |
|            523 |      5580 |        71055 |     4 |
|          49105 |     52348 |        66730 |     0 |
|          55877 |     57645 |        66730 |    80 |
|          38355 |     27205 |        66730 |    35 |
|           3924 |      8439 |        36566 |    80 |
|          97397 |     90411 |        66730 |   100 |
|          84162 |     83082 |         4810 |    40 |
|          97431 |     90411 |        71055 |    30 |
+----------------+-----------+--------------+-------+

Sample Output

90411 Joe

Explanation

Hacker 86870 got a score of 30 for challenge 71055 with a difficulty level of 2, so 86870 earned a full score for this challenge.

Hacker 90411 got a score of 30 for challenge 71055 with a difficulty level of 2, so 90411 earned a full score for this challenge.

Hacker 90411 got a score of 100 for challenge 66730 with a difficulty level of 6, so 90411 earned a full score for this challenge.

Only hacker 90411 managed to earn a full score for more than one challenge, so we print the their hacker_id and name as 2 space-separated values.
*/

use hackerrank;

GO

raiserror('Now at basicjoin.proc_05topcompetitors creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_05topcompetitors AS
SELECT
	h.hacker_id,
	h.name
FROM
	basicjoin.HACKERS h
	inner join
	(
		select
			s.hacker_id,
			count(*) as cnt
		from
			basicjoin.CHALLENGES c
			inner join basicjoin.DIFFICULTY d
				on c.difficult_level = d.difficult_level
			inner join basicjoin.SUBMISSIONS s
				on c.challenge_id = s.challenge_id
		where
			s.score = d.score
		group by s.hacker_id
		having count(*) > 1
	) as ch
		on h.hacker_id = ch.hacker_id
order by
	ch.cnt desc,
	h.hacker_id;
GO

raiserror('Now at BasicJoinTestClass.test_05topcompetitors creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_05topcompetitors
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  ID			int				NOT NULL,
		  NAME			varchar(44)     NULL
    );

    INSERT INTO actual (ID, NAME) exec basicjoin.proc_05topcompetitors

    CREATE TABLE expected (
		  ID			int				NOT NULL,
		  NAME			varchar(44)     NULL
    );

	INSERT INTO expected (ID, NAME) SELECT 27232,'Phillip'
	INSERT INTO expected (ID, NAME) SELECT 28614,'Willie'
	INSERT INTO expected (ID, NAME) SELECT 15719,'Christina'
	INSERT INTO expected (ID, NAME) SELECT 43892,'Roy'
	INSERT INTO expected (ID, NAME) SELECT 14246,'David'
	INSERT INTO expected (ID, NAME) SELECT 14372,'Michelle'
	INSERT INTO expected (ID, NAME) SELECT 18330,'Lawrence'
	INSERT INTO expected (ID, NAME) SELECT 26133,'Jacqueline'
	INSERT INTO expected (ID, NAME) SELECT 26253,'John'
	INSERT INTO expected (ID, NAME) SELECT 30128,'Brandon'
	INSERT INTO expected (ID, NAME) SELECT 35583,'Norma'
	INSERT INTO expected (ID, NAME) SELECT 13944,'Victor'
	INSERT INTO expected (ID, NAME) SELECT 17295,'Elizabeth'
	INSERT INTO expected (ID, NAME) SELECT 19076,'Matthew'
	INSERT INTO expected (ID, NAME) SELECT 26895,'Evelyn'
	INSERT INTO expected (ID, NAME) SELECT 32172,'Jonathan'
	INSERT INTO expected (ID, NAME) SELECT 41293,'Robin'
	INSERT INTO expected (ID, NAME) SELECT 45386,'Christina'
	INSERT INTO expected (ID, NAME) SELECT 45785,'Jesse'
	INSERT INTO expected (ID, NAME) SELECT 49652,'Christine'
	INSERT INTO expected (ID, NAME) SELECT 13391,'Robin'
	INSERT INTO expected (ID, NAME) SELECT 14366,'Donna'
	INSERT INTO expected (ID, NAME) SELECT 14777,'Gerald'
	INSERT INTO expected (ID, NAME) SELECT 16259,'Brandon'
	INSERT INTO expected (ID, NAME) SELECT 17762,'Joseph'
	INSERT INTO expected (ID, NAME) SELECT 28275,'Debra'
	INSERT INTO expected (ID, NAME) SELECT 36228,'Nancy'
	INSERT INTO expected (ID, NAME) SELECT 37704,'Keith'
	INSERT INTO expected (ID, NAME) SELECT 40226,'Anna'
	INSERT INTO expected (ID, NAME) SELECT 49307,'Brian'
	INSERT INTO expected (ID, NAME) SELECT 12539,'Paul'
	INSERT INTO expected (ID, NAME) SELECT 14363,'Joyce'
	INSERT INTO expected (ID, NAME) SELECT 14658,'Stephanie'
	INSERT INTO expected (ID, NAME) SELECT 19448,'Jesse'
	INSERT INTO expected (ID, NAME) SELECT 20504,'John'
	INSERT INTO expected (ID, NAME) SELECT 20534,'Martha'
	INSERT INTO expected (ID, NAME) SELECT 22196,'Anthony'
	INSERT INTO expected (ID, NAME) SELECT 23678,'Kimberly'
	INSERT INTO expected (ID, NAME) SELECT 28299,'David'
	INSERT INTO expected (ID, NAME) SELECT 30721,'Ann'
	INSERT INTO expected (ID, NAME) SELECT 32254,'Dorothy'
	INSERT INTO expected (ID, NAME) SELECT 46205,'Joyce'
	INSERT INTO expected (ID, NAME) SELECT 47641,'Patricia'
	INSERT INTO expected (ID, NAME) SELECT 13122,'James'
	INSERT INTO expected (ID, NAME) SELECT 13762,'Gloria'
	INSERT INTO expected (ID, NAME) SELECT 14863,'Walter'
	INSERT INTO expected (ID, NAME) SELECT 18690,'Marilyn'
	INSERT INTO expected (ID, NAME) SELECT 18983,'Lori'
	INSERT INTO expected (ID, NAME) SELECT 21212,'Timothy'
	INSERT INTO expected (ID, NAME) SELECT 25732,'Antonio'
	INSERT INTO expected (ID, NAME) SELECT 28250,'Evelyn'
	INSERT INTO expected (ID, NAME) SELECT 30755,'Emily'
	INSERT INTO expected (ID, NAME) SELECT 38852,'Benjamin'
	INSERT INTO expected (ID, NAME) SELECT 42052,'Andrew'
	INSERT INTO expected (ID, NAME) SELECT 44188,'Diana'
	INSERT INTO expected (ID, NAME) SELECT 48984,'Gregory'
	INSERT INTO expected (ID, NAME) SELECT 13380,'Kelly'
	INSERT INTO expected (ID, NAME) SELECT 13523,'Ralph'
	INSERT INTO expected (ID, NAME) SELECT 21463,'Christine'
	INSERT INTO expected (ID, NAME) SELECT 24663,'Louise'
	INSERT INTO expected (ID, NAME) SELECT 26243,'Diana'
	INSERT INTO expected (ID, NAME) SELECT 26289,'Dorothy'
	INSERT INTO expected (ID, NAME) SELECT 39277,'Charles'
	INSERT INTO expected (ID, NAME) SELECT 23278,'Paula'
	INSERT INTO expected (ID, NAME) SELECT 25184,'Martin'
	INSERT INTO expected (ID, NAME) SELECT 32121,'Dorothy'
	INSERT INTO expected (ID, NAME) SELECT 36322,'Andrew'
	INSERT INTO expected (ID, NAME) SELECT 39782,'Tammy'
	INSERT INTO expected (ID, NAME) SELECT 40257,'James'
	INSERT INTO expected (ID, NAME) SELECT 41319,'Jean'
	INSERT INTO expected (ID, NAME) SELECT 10857,'Kevin'
	INSERT INTO expected (ID, NAME) SELECT 25238,'Paul'
	INSERT INTO expected (ID, NAME) SELECT 34242,'Marilyn'
	INSERT INTO expected (ID, NAME) SELECT 39771,'Alan'
	INSERT INTO expected (ID, NAME) SELECT 49789,'Lillian'
	INSERT INTO expected (ID, NAME) SELECT 57947,'Justin'
	INSERT INTO expected (ID, NAME) SELECT 74413,'Harry'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_05topcompetitors]';