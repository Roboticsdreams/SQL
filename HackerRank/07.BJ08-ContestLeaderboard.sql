/*
Contest Leaderboard

You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 
+---------------+---------+
|    Column     |  Type   |
+---------------+---------+
| hacker_id     | Integer |
| name          | String  |
+---------------+---------+

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge for which the submission belongs to, and score is the score of the submission.

+---------------+----------+
|    Column     |   Type   |
+---------------+----------+
| submission_id | Integer  |
| hacker_id     | Integer  |
| challenge_id  | Integer  |
| score         | Integer  |
+---------------+----------+

Sample Input

Hackers Table: 
+-----------+----------+
| hacker_id |   name   |
+-----------+----------+
|      4071 | Rose     |
|      4806 | Angela   |
|     26071 | Frank    |
|     49438 | Patrick  |
|     74842 | Lisa     |
|     80305 | Kimberly |
|     84072 | Bonnie   |
|     87868 | Michael  |
|     92118 | Todd     |
|     95895 | Joe      |
+-----------+----------+

Submissions Table :

+---------------+-----------+--------------+-------+
| submission_id | hacker_id | challenge_id | score |
+---------------+-----------+--------------+-------+
|         67194 |     74842 |        63132 |    76 |
|         64479 |     74842 |        19797 |    98 |
|         40742 |     26071 |        49593 |    20 |
|         17513 |      4806 |        49593 |    32 |
|         69846 |     80305 |        19797 |    19 |
|         41002 |     26071 |        89343 |    36 |
|         52826 |     49438 |        49593 |     9 |
|         31093 |     26071 |        19797 |     2 |
|         81614 |     84072 |        49593 |   100 |
|         44829 |     26071 |        89343 |    17 |
|         75147 |     80305 |        49593 |    48 |
|         14115 |      4806 |        49593 |    76 |
|          6943 |      4071 |        19797 |    95 |
|         12855 |      4806 |        25917 |    13 |
|         73343 |     80305 |        49593 |    42 |
|         84264 |     84072 |        63132 |     0 |
|          9951 |      4071 |        49593 |    43 |
|         53795 |     74842 |        19797 |     5 |
|         26363 |     26071 |        19797 |    29 |
|         10063 |      4071 |        49593 |    96 |
+---------------+-----------+--------------+-------+

Sample Output
+-----------+-----------+-------+
| hacker_id |   name    | score |
+-----------+-----------+-------+
|     4071  | Rose      |   191 |
|    74842  | Lisa      |   174 |
|    84072  | Bonnie    |   100 |
|     4806  | Angela    |    89 |
|    26071  | Frank     |    85 |
|    80305  | Kimberly  |    67 |
|    49438  | Patrick   |    43 |
+-----------+-----------+-------+

Explanation

Hacker 4071 submitted solutions for challenges 19797 and 49593, so the total score = 95 + max(43,96) = 191

Hacker 74842 submitted solutions for challenges 19797 and 63132, so the total score = max(98,5) + 76 = 174

Hacker 84072 submitted solutions for challenges 49593 and 63132, so the total score = 100 + 0 = 100.

The total scores for hackers 4806, 26071, 80305, and 49438 can be similarly calculated.
*/

use hackerrank;

GO

raiserror('Now at basicjoin.proc_08contestleaderboard creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_08contestleaderboard AS
select
    h.hacker_id,
    h.name,
    sum(s.score) as score
from
    basicjoin.CL_HACKERS h
    inner join
    (
        select
            hacker_id,
            challenge_id,
            max(score) as score
        from
            basicjoin.CL_SUBMISSIONS s
        group by 
            hacker_id,
            challenge_id
    ) as s
        on h.hacker_id = s.hacker_id
group by
    h.hacker_id,
    h.name
having
    sum(s.score) <> 0
order by
    sum(s.score) desc,
    h.hacker_id;
GO

raiserror('Now at BasicJoinTestClass.test_08contestleaderboard creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_08contestleaderboard
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  hacker_id		int				NOT NULL,
		  name			varchar(25)	    NULL,
		  score			int				NULL,
    );

    INSERT INTO actual (hacker_id, name, score) exec basicjoin.proc_08contestleaderboard

    CREATE TABLE expected (
		  hacker_id		int				NOT NULL,
		  name			varchar(25)	    NULL,
		  score			int				NULL
    );

	INSERT INTO expected (hacker_id, name, score) SELECT 76971,'Ashley',760
	INSERT INTO expected (hacker_id, name, score) SELECT 84200,'Susan',710
	INSERT INTO expected (hacker_id, name, score) SELECT 76615,'Ryan',700
	INSERT INTO expected (hacker_id, name, score) SELECT 82382,'Sara',640
	INSERT INTO expected (hacker_id, name, score) SELECT 79034,'Marilyn',580
	INSERT INTO expected (hacker_id, name, score) SELECT 78552,'Harry',570
	INSERT INTO expected (hacker_id, name, score) SELECT 74064,'Helen',540
	INSERT INTO expected (hacker_id, name, score) SELECT 78688,'Sean',540
	INSERT INTO expected (hacker_id, name, score) SELECT 83832,'Jason',540
	INSERT INTO expected (hacker_id, name, score) SELECT 72796,'Jose',510
	INSERT INTO expected (hacker_id, name, score) SELECT 76216,'Carlos',510
	INSERT INTO expected (hacker_id, name, score) SELECT 90304,'Lillian',500
	INSERT INTO expected (hacker_id, name, score) SELECT 88507,'Patrick',490
	INSERT INTO expected (hacker_id, name, score) SELECT 72505,'Keith',480
	INSERT INTO expected (hacker_id, name, score) SELECT 88018,'Dennis',480
	INSERT INTO expected (hacker_id, name, score) SELECT 78918,'Julia',470
	INSERT INTO expected (hacker_id, name, score) SELECT 85319,'Shawn',470
	INSERT INTO expected (hacker_id, name, score) SELECT 71357,'Bobby',460
	INSERT INTO expected (hacker_id, name, score) SELECT 72047,'Elizabeth',460
	INSERT INTO expected (hacker_id, name, score) SELECT 74147,'Jason',460
	INSERT INTO expected (hacker_id, name, score) SELECT 80587,'Ruth',460
	INSERT INTO expected (hacker_id, name, score) SELECT 89286,'Jennifer',460
	INSERT INTO expected (hacker_id, name, score) SELECT 75626,'Gerald',450
	INSERT INTO expected (hacker_id, name, score) SELECT 85788,'Julia',440
	INSERT INTO expected (hacker_id, name, score) SELECT 90588,'Charles',440
	INSERT INTO expected (hacker_id, name, score) SELECT 87978,'Melissa',410
	INSERT INTO expected (hacker_id, name, score) SELECT 78547,'Julia',400
	INSERT INTO expected (hacker_id, name, score) SELECT 82861,'Denise',400
	INSERT INTO expected (hacker_id, name, score) SELECT 92906,'Philip',400
	INSERT INTO expected (hacker_id, name, score) SELECT 94035,'Doris',400
	INSERT INTO expected (hacker_id, name, score) SELECT 85042,'Irene',380
	INSERT INTO expected (hacker_id, name, score) SELECT 79315,'Susan',370
	INSERT INTO expected (hacker_id, name, score) SELECT 79254,'Cheryl',340
	INSERT INTO expected (hacker_id, name, score) SELECT 81859,'Jane',290
	INSERT INTO expected (hacker_id, name, score) SELECT 93258,'Jimmy',290
	INSERT INTO expected (hacker_id, name, score) SELECT 87948,'Linda',280
	INSERT INTO expected (hacker_id, name, score) SELECT 84196,'Rose',270
	INSERT INTO expected (hacker_id, name, score) SELECT 85266,'Jonathan',250
	INSERT INTO expected (hacker_id, name, score) SELECT 73214,'Ann',230
	INSERT INTO expected (hacker_id, name, score) SELECT 3683,'Robert',212
	INSERT INTO expected (hacker_id, name, score) SELECT 80554,'Judith',210
	INSERT INTO expected (hacker_id, name, score) SELECT 55642,'Elizabeth',203
	INSERT INTO expected (hacker_id, name, score) SELECT 6999,'Linda',201
	INSERT INTO expected (hacker_id, name, score) SELECT 35308,'Andrew',187
	INSERT INTO expected (hacker_id, name, score) SELECT 38308,'Charles',187
	INSERT INTO expected (hacker_id, name, score) SELECT 45122,'Patricia',176
	INSERT INTO expected (hacker_id, name, score) SELECT 2380,'Todd',175
	INSERT INTO expected (hacker_id, name, score) SELECT 42279,'Andrew',175
	INSERT INTO expected (hacker_id, name, score) SELECT 25310,'Martin',169
	INSERT INTO expected (hacker_id, name, score) SELECT 25580,'Paul',169
	INSERT INTO expected (hacker_id, name, score) SELECT 12200,'Ralph',168
	INSERT INTO expected (hacker_id, name, score) SELECT 4881,'Maria',164
	INSERT INTO expected (hacker_id, name, score) SELECT 10582,'Paul',164
	INSERT INTO expected (hacker_id, name, score) SELECT 48534,'Bobby',164
	INSERT INTO expected (hacker_id, name, score) SELECT 15940,'Christina',163
	INSERT INTO expected (hacker_id, name, score) SELECT 66274,'Chris',152
	INSERT INTO expected (hacker_id, name, score) SELECT 33393,'Jonathan',151
	INSERT INTO expected (hacker_id, name, score) SELECT 44305,'Jesse',147
	INSERT INTO expected (hacker_id, name, score) SELECT 68133,'Janet',144
	INSERT INTO expected (hacker_id, name, score) SELECT 30917,'Brandon',141
	INSERT INTO expected (hacker_id, name, score) SELECT 42122,'Jean',136
	INSERT INTO expected (hacker_id, name, score) SELECT 59495,'Stephen',133
	INSERT INTO expected (hacker_id, name, score) SELECT 70246,'Kelly',133
	INSERT INTO expected (hacker_id, name, score) SELECT 49116,'Wayne',131
	INSERT INTO expected (hacker_id, name, score) SELECT 47456,'Aaron',127
	INSERT INTO expected (hacker_id, name, score) SELECT 55456,'Thomas',127
	INSERT INTO expected (hacker_id, name, score) SELECT 66530,'Jennifer',122
	INSERT INTO expected (hacker_id, name, score) SELECT 14015,'Michelle',121
	INSERT INTO expected (hacker_id, name, score) SELECT 23032,'Anthony',121
	INSERT INTO expected (hacker_id, name, score) SELECT 1869,'Michael',120
	INSERT INTO expected (hacker_id, name, score) SELECT 12362,'Gloria',120
	INSERT INTO expected (hacker_id, name, score) SELECT 39671,'Alan',120
	INSERT INTO expected (hacker_id, name, score) SELECT 1700,'Lisa',115
	INSERT INTO expected (hacker_id, name, score) SELECT 20843,'John',115
	INSERT INTO expected (hacker_id, name, score) SELECT 64693,'Sandra',113
	INSERT INTO expected (hacker_id, name, score) SELECT 42964,'Diana',111
	INSERT INTO expected (hacker_id, name, score) SELECT 8352,'Marilyn',110
	INSERT INTO expected (hacker_id, name, score) SELECT 48165,'Dorothy',108
	INSERT INTO expected (hacker_id, name, score) SELECT 597,'Angela',107
	INSERT INTO expected (hacker_id, name, score) SELECT 7850,'Paula',107
	INSERT INTO expected (hacker_id, name, score) SELECT 32880,'Dorothy',102
	INSERT INTO expected (hacker_id, name, score) SELECT 31803,'Emily',100
	INSERT INTO expected (hacker_id, name, score) SELECT 9109,'Julia',98
	INSERT INTO expected (hacker_id, name, score) SELECT 14446,'Stephanie',98
	INSERT INTO expected (hacker_id, name, score) SELECT 34429,'Norma',98
	INSERT INTO expected (hacker_id, name, score) SELECT 50325,'Andrew',98
	INSERT INTO expected (hacker_id, name, score) SELECT 2751,'Joe',97
	INSERT INTO expected (hacker_id, name, score) SELECT 19271,'Marilyn',97
	INSERT INTO expected (hacker_id, name, score) SELECT 46027,'Lillian',97
	INSERT INTO expected (hacker_id, name, score) SELECT 59991,'Alan',97
	INSERT INTO expected (hacker_id, name, score) SELECT 64880,'Helen',97
	INSERT INTO expected (hacker_id, name, score) SELECT 65694,'Paul',97
	INSERT INTO expected (hacker_id, name, score) SELECT 17265,'Brandon',96
	INSERT INTO expected (hacker_id, name, score) SELECT 49050,'Clarence',95
	INSERT INTO expected (hacker_id, name, score) SELECT 54234,'Cynthia',95
	INSERT INTO expected (hacker_id, name, score) SELECT 26489,'Antonio',94
	INSERT INTO expected (hacker_id, name, score) SELECT 34553,'Nancy',93
	INSERT INTO expected (hacker_id, name, score) SELECT 48754,'Jeremy',93
	INSERT INTO expected (hacker_id, name, score) SELECT 49653,'Carolyn',93
	INSERT INTO expected (hacker_id, name, score) SELECT 12754,'David',91
	INSERT INTO expected (hacker_id, name, score) SELECT 18428,'Lawrence',91
	INSERT INTO expected (hacker_id, name, score) SELECT 48304,'Christopher',88
	INSERT INTO expected (hacker_id, name, score) SELECT 65153,'Larry',88
	INSERT INTO expected (hacker_id, name, score) SELECT 49727,'Margaret',87
	INSERT INTO expected (hacker_id, name, score) SELECT 41656,'Robin',86
	INSERT INTO expected (hacker_id, name, score) SELECT 63648,'Paul',86
	INSERT INTO expected (hacker_id, name, score) SELECT 26988,'Diana',85
	INSERT INTO expected (hacker_id, name, score) SELECT 51558,'Albert',83
	INSERT INTO expected (hacker_id, name, score) SELECT 2938,'Earl',82
	INSERT INTO expected (hacker_id, name, score) SELECT 11315,'James',81
	INSERT INTO expected (hacker_id, name, score) SELECT 28855,'Debra',81
	INSERT INTO expected (hacker_id, name, score) SELECT 39731,'Tammy',81
	INSERT INTO expected (hacker_id, name, score) SELECT 88494,'Jeremy',80
	INSERT INTO expected (hacker_id, name, score) SELECT 56716,'Justin',79
	INSERT INTO expected (hacker_id, name, score) SELECT 8526,'Jennifer',76
	INSERT INTO expected (hacker_id, name, score) SELECT 63706,'Gerald',75
	INSERT INTO expected (hacker_id, name, score) SELECT 486,'Rose',74
	INSERT INTO expected (hacker_id, name, score) SELECT 28503,'Phillip',74
	INSERT INTO expected (hacker_id, name, score) SELECT 3845,'Amy',73
	INSERT INTO expected (hacker_id, name, score) SELECT 61687,'Norma',73
	INSERT INTO expected (hacker_id, name, score) SELECT 52878,'Arthur',72
	INSERT INTO expected (hacker_id, name, score) SELECT 69832,'Charles',71
	INSERT INTO expected (hacker_id, name, score) SELECT 44539,'Joyce',70
	INSERT INTO expected (hacker_id, name, score) SELECT 12968,'Joyce',69
	INSERT INTO expected (hacker_id, name, score) SELECT 27705,'Dorothy',69
	INSERT INTO expected (hacker_id, name, score) SELECT 36555,'Benjamin',69
	INSERT INTO expected (hacker_id, name, score) SELECT 7725,'Carol',67
	INSERT INTO expected (hacker_id, name, score) SELECT 48588,'Carol',67
	INSERT INTO expected (hacker_id, name, score) SELECT 40617,'Anna',66
	INSERT INTO expected (hacker_id, name, score) SELECT 66461,'Steven',66
	INSERT INTO expected (hacker_id, name, score) SELECT 12671,'Victor',64
	INSERT INTO expected (hacker_id, name, score) SELECT 48556,'Gerald',64
	INSERT INTO expected (hacker_id, name, score) SELECT 31300,'Ann',63
	INSERT INTO expected (hacker_id, name, score) SELECT 57314,'Albert',61
	INSERT INTO expected (hacker_id, name, score) SELECT 7680,'Melissa',60
	INSERT INTO expected (hacker_id, name, score) SELECT 14579,'Gerald',60
	INSERT INTO expected (hacker_id, name, score) SELECT 33538,'Dorothy',60
	INSERT INTO expected (hacker_id, name, score) SELECT 42591,'Roy',59
	INSERT INTO expected (hacker_id, name, score) SELECT 1755,'Bonnie',58
	INSERT INTO expected (hacker_id, name, score) SELECT 45237,'Gregory',58
	INSERT INTO expected (hacker_id, name, score) SELECT 65689,'Alan',57
	INSERT INTO expected (hacker_id, name, score) SELECT 19635,'Lori',56
	INSERT INTO expected (hacker_id, name, score) SELECT 964,'Patrick',55
	INSERT INTO expected (hacker_id, name, score) SELECT 8670,'Harry',55
	INSERT INTO expected (hacker_id, name, score) SELECT 23773,'Paula',55
	INSERT INTO expected (hacker_id, name, score) SELECT 27281,'John',55
	INSERT INTO expected (hacker_id, name, score) SELECT 21323,'Timothy',54
	INSERT INTO expected (hacker_id, name, score) SELECT 45908,'Christine',54
	INSERT INTO expected (hacker_id, name, score) SELECT 61481,'Joshua',54
	INSERT INTO expected (hacker_id, name, score) SELECT 66539,'Bonnie',53
	INSERT INTO expected (hacker_id, name, score) SELECT 12089,'Robin',52
	INSERT INTO expected (hacker_id, name, score) SELECT 28155,'Evelyn',51
	INSERT INTO expected (hacker_id, name, score) SELECT 66566,'Shirley',51
	INSERT INTO expected (hacker_id, name, score) SELECT 52382,'Judy',50
	INSERT INTO expected (hacker_id, name, score) SELECT 54737,'Jerry',47
	INSERT INTO expected (hacker_id, name, score) SELECT 21417,'Christine',46
	INSERT INTO expected (hacker_id, name, score) SELECT 63492,'Melissa',46
	INSERT INTO expected (hacker_id, name, score) SELECT 67347,'Jeffrey',46
	INSERT INTO expected (hacker_id, name, score) SELECT 13279,'Donna',45
	INSERT INTO expected (hacker_id, name, score) SELECT 20328,'Matthew',45
	INSERT INTO expected (hacker_id, name, score) SELECT 24185,'Kimberly',45
	INSERT INTO expected (hacker_id, name, score) SELECT 36517,'Keith',45
	INSERT INTO expected (hacker_id, name, score) SELECT 41148,'James',42
	INSERT INTO expected (hacker_id, name, score) SELECT 69289,'Albert',42
	INSERT INTO expected (hacker_id, name, score) SELECT 4404,'Pamela',41
	INSERT INTO expected (hacker_id, name, score) SELECT 48411,'Bobby',39
	INSERT INTO expected (hacker_id, name, score) SELECT 5787,'Joe',38
	INSERT INTO expected (hacker_id, name, score) SELECT 28619,'Evelyn',36
	INSERT INTO expected (hacker_id, name, score) SELECT 64099,'Ronald',35
	INSERT INTO expected (hacker_id, name, score) SELECT 20360,'Jesse',34
	INSERT INTO expected (hacker_id, name, score) SELECT 58583,'James',34
	INSERT INTO expected (hacker_id, name, score) SELECT 1746,'Kimberly',32
	INSERT INTO expected (hacker_id, name, score) SELECT 775,'Frank',31
	INSERT INTO expected (hacker_id, name, score) SELECT 26831,'Jacqueline',31
	INSERT INTO expected (hacker_id, name, score) SELECT 9044,'David',30
	INSERT INTO expected (hacker_id, name, score) SELECT 62538,'Mildred',29
	INSERT INTO expected (hacker_id, name, score) SELECT 9113,'Kevin',28
	INSERT INTO expected (hacker_id, name, score) SELECT 17381,'Elizabeth',26
	INSERT INTO expected (hacker_id, name, score) SELECT 30731,'Willie',22
	INSERT INTO expected (hacker_id, name, score) SELECT 18320,'Joseph',18
	INSERT INTO expected (hacker_id, name, score) SELECT 45831,'Brian',18
	INSERT INTO expected (hacker_id, name, score) SELECT 14891,'Walter',17

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

--exec tSQLt.Run 'BasicJoinTestClass.[test_08contestleaderboard]';