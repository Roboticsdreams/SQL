/*
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest),
 and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum 
 number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

 Input Format

The following tables hold contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
+-----------+---------+
|  Column   |  Type   |
+-----------+---------+
| hacker_id | Integer |
| name      | String  |
+-----------+---------+

Submissions: The submission_date is the date of the submission, submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, and score is the score of the submission. 
+-----------------+---------+
|     Column      |  Type   |
+-----------------+---------+
| submission_date | Date    |
| submission_id   | Integer |
| hacker_id       | Integer |
| score           | Integer |
+-----------------+---------+

Sample Input

For the following sample input, assume that the end date of the contest was March 06, 2016.


Hackers Table: 
+-----------+----------+
| hacker_id |   name   |
+-----------+----------+
|     15758 | Rose     |
|     20703 | Angela   |
|     36396 | Frank    |
|     38289 | Patrick  |
|     44065 | Lisa     |
|     53473 | Kimberly |
|     62529 | Bonnie   |
|     79722 | Michael  |
+-----------+----------+

 Submissions Table: 
 +-----------------+---------------+-----------+-------+
| submission_date | submission_id | hacker_id | score |
+-----------------+---------------+-----------+-------+
| 2016-03-01      |          8494 |     20703 |     0 |
| 2016-03-01      |         22403 |     53473 |    15 |
| 2016-03-01      |         23965 |     79722 |    60 |
| 2016-03-01      |         30173 |     36396 |    70 |
| 2016-03-02      |         34928 |     20703 |     0 |
| 2016-03-02      |         38740 |     15758 |    60 |
| 2016-03-02      |         42769 |     79722 |    25 |
| 2016-03-02      |         44364 |     79722 |    60 |
| 2016-03-03      |         45440 |     20703 |     0 |
| 2016-03-03      |         49050 |     36396 |    70 |
| 2016-03-03      |         50273 |     79722 |     5 |
| 2016-03-04      |         50344 |     20703 |     0 |
| 2016-03-04      |         51360 |     44065 |    90 |
| 2016-03-04      |         54404 |     53473 |    65 |
| 2016-03-04      |         61533 |     79722 |    45 |
| 2016-03-05      |         72852 |     20703 |     0 |
| 2016-03-05      |         74546 |     38289 |     0 |
| 2016-03-05      |         76487 |     62529 |     0 |
| 2016-03-05      |         82439 |     36396 |    10 |
| 2016-03-05      |         90006 |     36396 |    40 |
| 2016-03-06      |         90404 |     20703 |     0 |
+-----------------+---------------+-----------+-------+

Sample Output

2016-03-01 4 20703 Angela
2016-03-02 2 79722 Michael
2016-03-03 2 20703 Angela
2016-03-04 2 20703 Angela
2016-03-05 1 36396 Frank
2016-03-06 1 20703 Angela
Explanation

On March 01, 2016 hackers 20703, 36396, 53473 and 79722 made submissions. There are 4 unique hackers who made at least one submission each day. As each hacker made one submission, 20703 is considered to be the hacker who made maximum number of submissions on this day. The name of the hacker is Angela.

On March 02, 2016 hackers 15758, 20703 and 79722 made submissions. Now 20703 and 79722 were the only ones to submit every day, so there are 2 unique hackers who made at least one submission each day. 79722 made 2 submissions, and name of the hacker is Michael.

On March 03, 2016 hackers 20703, 36396 and 79722 made submissions. Now 20703 and 79722 were the only ones, so there are 2 unique hackers who made at least one submission each day. As each hacker made one submission so 20703 is considered to be the hacker who made maximum number of submissions on this day. The name of the hacker is Angela.

On March 04, 2016 hackers 20703, 44065, 53473 and 79722 made submissions. Now 20703 and 79722 only submitted each day, so there are 2 unique hackers who made at least one submission each day. As each hacker made one submission so 20703 is considered to be the hacker who made maximum number of submissions on this day. The name of the hacker is Angela.

On March 05, 2016 hackers 20703, 36396, 38289 and 62529 made submissions. Now 20703 only submitted each day, so there is only 1 unique hacker who made at least one submission each day. 36396 made 2 submissions and name of the hacker is Frank.

On March 06, 2016 only 20703 made submission, so there is only 1 unique hacker who made at least one submission each day. 20703 made 1 submission and name of the hacker is Angela.

*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE advancedjoin.proc_05learningsql AS
with Sub1 as (
    select s1.submission_date, s1.hacker_id,
    count (distinct s1.submission_id) as date_submissions,
    1 + datediff(day, 'March 1, 2016', s1.submission_date) as contest_day,
    count (distinct s2.submission_date) as submission_days
    from advancedjoin.SUBMISSIONS s1 join advancedjoin.SUBMISSIONS s2
        on s1.hacker_id = s2.hacker_id and s1.submission_date >= s2.submission_date
    group by s1.submission_date, s1.hacker_id
),
Sub2 as (
    select submission_date, hacker_id, date_submissions
    from Sub1 where submission_days = contest_day
),
Sub3a as (
    select submission_date, count(hacker_id) as hackers
    from Sub2 group by submission_date
),
Sub3b as (
    select submission_date, max(date_submissions) as max_submissions
    from Sub1 group by submission_date
),
Sub4 as (
    select s1.submission_date, s3.hackers,
        (select top 1 s2.hacker_id from Sub1 s2
         where s1.submission_date = s2.submission_date and s1.max_submissions = s2.date_submissions
         order by s2.hacker_id) as hacker_id
    from Sub3b s1
    join Sub3a s3 on s1.submission_date = s3.submission_date
)
select s.*, h.name from Sub4 s join advancedjoin.hackers h on s.hacker_id = h.hacker_id order by submission_date;
GO

CREATE or ALTER PROCEDURE AdvancedJoinTestClass.test_05learningsql
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	      SUBMISSION_DATE				date,
		  HACKERS						int,
		  HACKER_ID						int,
		  NAME							varchar(30)
    );

    INSERT INTO actual (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) exec advancedjoin.proc_05learningsql

    CREATE TABLE expected (
	      SUBMISSION_DATE				date,
		  HACKERS						int,
		  HACKER_ID						int,
		  NAME							varchar(30)
    );
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-01', 112,81314, 'Denise'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-02', 59, 39091, 'Ruby'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-03', 51, 18105, 'Roy'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-04', 49, 533,   'Patrick'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-05', 49, 7891,  'Stephanie'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-06', 49, 84307, 'Evelyn'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-07', 35, 80682, 'Deborah'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-08', 35, 10985, 'Timothy'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-09', 35, 31221, 'Susan'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-10', 35, 43192, 'Bobby'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-11', 35, 3178,  'Melissa'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-12', 35, 54967, 'Kenneth'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-13', 35, 30061, 'Julia'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-14', 35, 32353, 'Rose'
	INSERT INTO expected (SUBMISSION_DATE, HACKERS, HACKER_ID, NAME) SELECT '2016-03-15', 35, 27789, 'Helen'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedJoinTestClass.[test_05learningsql]';

--exec tSQLt.RunAll