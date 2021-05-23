/*
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.

Input Format

The following tables hold interview data:

Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name 
of the hacker. 
+------------+---------+
|   Column   |  Type   |
+------------+---------+
| contest_id | Integer |
| hacker_id  | Integer |
| name       | String  |
+------------+---------+

Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates. 
+------------+---------+
|   Column   |  Type   |
+------------+---------+
| college_id | Integer |
| contest_id | Integer |
+------------+---------+

Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates. 
+--------------+---------+
|    Column    |  Type   |
+--------------+---------+
| challenge_id | Integer |
| college_id   | Integer |
+--------------+---------+

View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates. 
+--------------------+---------+
|       Column       |  Type   |
+--------------------+---------+
| challenge_id       | Integer |
| total_views        | Integer |
| total_unique_views | Integer |
+--------------------+---------+

Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores. 
+----------------------------+---------+
|           Column           |  Type   |
+----------------------------+---------+
| challenge_id               | Integer |
| total_submissions          | Integer |
| total_accepted_submissions | Integer |
+----------------------------+---------+

Sample Input

Contests Table:
+------------+-----------+--------+
| contest_id | hacker_id |  name  |
+------------+-----------+--------+
|      66406 |     17973 | Rose   |
|      66556 |     79153 | Angela |
|      94828 |     80275 | Frank  |
+------------+-----------+--------+

Colleges Table:
+------------+------------+
| college_id | contest_id |
+------------+------------+
|      11219 |      66406 |
|      32473 |      66556 |
|      56685 |      94828 |
+------------+------------+

Challenges Table:
+--------------+------------+
| challenge_id | college_id |
+--------------+------------+
|        18765 |      11219 |
|        47127 |      11219 |
|        60292 |      32473 |
|        72974 |      56685 |
+--------------+------------+

View_Stats Table: 
+--------------+-------------+--------------------+
| challenge_id | total_views | total_unique_views |
+--------------+-------------+--------------------+
|        47127 |          26 |                 19 |
|        47127 |          15 |                 14 |
|        18765 |          43 |                 10 |
|        18765 |          72 |                 13 |
|        75516 |          35 |                 17 |
|        60292 |          11 |                 10 |
|        72974 |          41 |                 15 |
|        75516 |          75 |                 11 |
+--------------+-------------+--------------------+

Submission_Stats Table: 
+--------------+-------------------+----------------------------+
| challenge_id | total_submissions | total_accepted_submissions |
+--------------+-------------------+----------------------------+
|        75516 |                34 |                         12 |
|        47127 |                27 |                         10 |
|        47127 |                56 |                         18 |
|        75516 |                74 |                         12 |
|        75516 |                83 |                          8 |
|        72974 |                68 |                         24 |
|        72974 |                82 |                         14 |
|        47127 |                28 |                         11 |
+--------------+-------------------+----------------------------+

Sample Output

66406 17973 Rose 111 39 156 56
66556 79153 Angela 0 0 11 10
94828 80275 Frank 150 38 41 15
Explanation

The contest 66406 is used in the college 11219. In this college 11219, challenges 18765 and 47127 are asked, so from the view and submission stats:

Sum of total submissions = 27 + 56 + 28 = 111

Sum of total accepted submissions 10 + 18 + 11 = 39

Sum of total views = 43 + 72 + 26 + 15 = 156

Sum of total unique views = 10 + 13 + 19 + 14 = 56

Similarly, we can find the sums for contests 66556 and 94828.

*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE advancedjoin.proc_04interviews AS
SELECT CONTEST_ID, HACKER_ID, NAME, SUM(TOTAL_SUBMISSIONS) as TOTAL_SUBMISSIONS, SUM(TOTAL_ACCEPTED_SUBMISSIONS) as TOTAL_ACCEPTED_SUBMISSIONS, SUM(TOTAL_VIEWS) as TOTAL_VIEWS, SUM(TOTAL_UNIQUE_VIEWS) as TOTAL_UNIQUE_VIEWS
FROM (
SELECT CT.CONTEST_ID
    , CT.HACKER_ID, CT.NAME
    , ISNULL((SELECT SUM(SS.TOTAL_SUBMISSIONS) FROM advancedjoin.SUBMISSION_STATS SS WHERE SS.CHALLENGE_ID = CL.CHALLENGE_ID),0) AS TOTAL_SUBMISSIONS
    , ISNULL((SELECT SUM(SS.TOTAL_ACCEPTED_SUBMISSIONS) FROM advancedjoin.SUBMISSION_STATS SS WHERE SS.CHALLENGE_ID = CL.CHALLENGE_ID),0) AS TOTAL_ACCEPTED_SUBMISSIONS
    , ISNULL((SELECT SUM(SS.TOTAL_VIEWS) FROM advancedjoin.VIEW_STATS SS WHERE SS.CHALLENGE_ID = CL.CHALLENGE_ID),0) AS TOTAL_VIEWS
     , ISNULL((SELECT SUM(SS.TOTAL_UNIQUE_VIEWS) FROM advancedjoin.VIEW_STATS SS WHERE SS.CHALLENGE_ID = CL.CHALLENGE_ID),0) AS TOTAL_UNIQUE_VIEWS
FROM advancedjoin.CONTESTS CT
LEFT JOIN advancedjoin.COLLEGES CG ON CT.CONTEST_ID = CG.CONTEST_ID
LEFT JOIN advancedjoin.CHALLENGES CL ON CL.COLLEGE_ID = CG.COLLEGE_ID
) G 
GROUP BY CONTEST_ID, HACKER_ID, NAME
HAVING SUM(TOTAL_SUBMISSIONS)+ SUM(TOTAL_ACCEPTED_SUBMISSIONS)+ SUM(TOTAL_VIEWS)+ SUM(TOTAL_UNIQUE_VIEWS) > 0
ORDER BY CONTEST_ID;
GO

CREATE or ALTER PROCEDURE AdvancedJoinTestClass.test_04interviews
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	      CONTEST_ID					int,
		  HACKER_ID						int,
		  NAME							varchar(30),
		  TOTAL_SUBMISSIONS				int,
		  TOTAL_ACCEPTED_SUBMISSIONS	int,
		  TOTAL_VIEWS					int,
		  TOTAL_UNIQUE_VIEWS			int
    );

    INSERT INTO actual (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) exec advancedjoin.proc_04interviews

    CREATE TABLE expected (
	      CONTEST_ID					int,
		  HACKER_ID						int,
		  NAME							varchar(30),
		  TOTAL_SUBMISSIONS				int,
		  TOTAL_ACCEPTED_SUBMISSIONS	int,
		  TOTAL_VIEWS					int,
		  TOTAL_UNIQUE_VIEWS			int
    );

	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	845,579,'Rose',2301,658,1635,566;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	858,1053,'Angela',703,160,1002,384;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	883,1055,'Frank',1121,319,1217,338;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	1793,2655,'Patrick',1408,382,1216,412;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	2374,2765,'Lisa',2828,832,3368,904;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	2963,2845,'Kimberly',4274,1215,3603,1184;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	3584,2873,'Bonnie',0,0,3019,954;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4044,3067,'Michael',0,0,1722,528;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4249,3116,'Todd',0,0,1767,463;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4269,3256,'Joe',0,0,1766,530;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4483,3386,'Earl',0,0,1644,477;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4541,3608,'Robert',0,0,1694,504;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4601,3868,'Amy',0,0,1738,548;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4710,4255,'Pamela',0,0,2378,705;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	4982,5639,'Maria',0,0,2558,711;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	5913,5669,'Joe',0,0,3181,835;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	5994,5713,'Linda',0,0,3048,954;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	6939,6550,'Melissa',0,0,3574,1004;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	7266,6947,'Carol',0,0,3044,835;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	7280,7030,'Paula',0,0,886,259;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	7484,7033,'Marilyn',0,0,3663,1019;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	7734,7386,'Jennifer',0,0,3637,1099;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	7831,7787,'Harry',0,0,2933,1012;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	7862,8029,'David',0,0,1475,472;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	8812,8147,'Julia',0,0,819,266;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	8825,8438,'Kevin',0,0,2187,689;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	9136,8727,'Paul',0,0,3125,954;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	9613,8762,'James',0,0,3620,1046;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	10568,8802,'Kelly',0,0,2577,798;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	11100,8809,'Robin',0,0,1883,619;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	12742,9203,'Ralph',0,0,1344,383;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	12861,9644,'Gloria',0,0,2089,623;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	12865,10108,'Victor',0,0,1259,418;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	13503,10803,'David',0,0,584,167;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	13537,11390,'Joyce',0,0,1784,538;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	13612,12592,'Donna',0,0,1487,465;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	14502,12923,'Michelle',0,0,1830,545;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	14867,13017,'Stephanie',0,0,2291,574;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	15164,13256,'Gerald',0,0,2085,607;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	15804,13421,'Walter',0,0,1396,476;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	15891,13569,'Christina',0,0,2266,786;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	16063,14287,'Brandon',0,0,1621,521;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	16415,14311,'Elizabeth',0,0,3631,1071;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	18477,14440,'Joseph',0,0,1419,428;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	18855,16973,'Lawrence',0,0,3371,1011;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	19097,17123,'Marilyn',0,0,2554,750;
	INSERT INTO expected (CONTEST_ID, HACKER_ID, NAME, TOTAL_SUBMISSIONS, TOTAL_ACCEPTED_SUBMISSIONS, TOTAL_VIEWS, TOTAL_UNIQUE_VIEWS) SELECT 	19575,17562,'Lori',0,0,2627,760;

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedJoinTestClass.[test_04interviews]';