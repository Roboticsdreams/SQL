/*
Ollivander's Inventory

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

Input Format

The following tables contain data on the wands in Ollivander's inventory:

Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).

+---------------+---------+
|    Column     |  Type   |
+---------------+---------+
| id            | Integer |
| code          | Integer |
| coins_needed  | Integer |
| power         | Integer |
+---------------+---------+

Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs, (code1, age1) and (code2, age2), then code1 != code2 and age1 != age2.

+----------+---------+
|  Column  |  Type   |
+----------+---------+
| code     | Integer |
| age      | Integer |
| is_evil  | Integer |
+----------+---------+

Sample Input

Wands Table: 
+-----+-------+--------------+-------+
| id  | code  | coins_needed | power |
+-----+-------+--------------+-------+
|   1 |     4 |         3688 |     8 |
|   2 |     3 |         9365 |     3 |
|   3 |     3 |         7187 |    10 |
|   4 |     3 |          734 |     8 |
|   5 |     1 |         6020 |     2 |
|   6 |     2 |         6773 |     7 |
|   7 |     3 |         9873 |     9 |
|   8 |     3 |         7721 |     7 |
|   9 |     1 |         1647 |    10 |
|  10 |     4 |          504 |     5 |
|  11 |     2 |         7587 |     5 |
|  12 |     5 |         9897 |    10 |
|  13 |     3 |         4651 |     8 |
|  14 |     2 |         5408 |     1 |
|  15 |     2 |         6018 |     7 |
|  16 |     4 |         7710 |     5 |
|  17 |     2 |         8798 |     7 |
|  18 |     2 |         3312 |     3 |
|  19 |     4 |         7651 |     6 |
|  20 |     5 |         5689 |     3 |
+-----+-------+--------------+-------+

 Wands_Property Table: 
+-------+------+---------+
| code  | age  | is_evil |
+-------+------+---------+
|     1 |   45 |       0 |
|     2 |   40 |       0 |
|     3 |    4 |       1 |
|     4 |   20 |       0 |
|     5 |   17 |       0 |
+-------+------+---------+

Sample Output

9 45 1647 10
12 17 9897 10
1 20 3688 8
15 40 6018 7
19 20 7651 6
11 40 7587 5
10 20 504 5
18 40 3312 3
20 17 5689 3
5 45 6020 2
14 40 5408 1


Explanation

+-----+------+--------------+-------+
| id  | age  | coins_needed | power |
+-----+------+--------------+-------+
|   5 |   45 |         6020 |     2 |
|   9 |   45 |         1647 |    10 |
+-----+------+--------------+-------+

The data for wands of age 45 (code 1): 

The minimum number of galleons needed for wand(age = 45, power = 2) = 6020
The minimum number of galleons needed for wand(age = 45, power = 10) = 1647

+-----+------+--------------+-------+
| id  | age  | coins_needed | power |
+-----+------+--------------+-------+
| 14  |   40 |         5408 |     1 |
|  18 |   40 |         3312 |     3 |
|  11 |   40 |         7587 |     5 |
|  15 |   40 |         6018 |     7 |
|  17 |   40 |         8798 |     7 |
|   6 |   40 |         6773 |     7 |
+-----+------+--------------+-------+

The data for wands of age 40 (code 2): 

The minimum number of galleons needed for wand(age = 40, power = 1) = 5408
The minimum number of galleons needed for wand(age = 40, power = 3) = 3312
The minimum number of galleons needed for wand(age = 40, power = 5) = 7587
The minimum number of galleons needed for wand(age = 40, power = 7) = 6018

+-----+------+--------------+-------+
| id  | age  | coins_needed | power |
+-----+------+--------------+-------+
|  10 |   20 |          504 |     5 |
|  16 |   20 |         7710 |     5 |
|  19 |   20 |         7651 |     6 |
|   1 |   20 |         3688 |     8 |
+-----+------+--------------+-------+

The data for wands of age 20 (code 4): 

The minimum number of galleons needed for wand(age = 20, power = 5) = 504
The minimum number of galleons needed for wand(age = 20, power = 6) = 7651
The minimum number of galleons needed for wand(age = 20, power = 8) = 3688

+-----+------+--------------+-------+
| id  | age  | coins_needed | power |
+-----+------+--------------+-------+
|  20 |   17 |         5689 |     3 |
|  12 |   17 |         9897 |    10 |
+-----+------+--------------+-------+

The data for wands of age 17 (code 5): 

The minimum number of galleons needed for wand(age = 17, power = 3) = 5689
The minimum number of galleons needed for wand(age = 17, power = 10) = 9897
*/

use hackerrank;

GO

raiserror('Now at basicjoin.proc_06ollivadersinventory creation ....',0,1)

GO

CREATE or ALTER PROCEDURE basicjoin.proc_06ollivadersinventory AS
;WITH MN AS
(
    SELECT
        DISTINCT
        w.code,
        powers,
        age,
        min(coins_needed) AS cn
    FROM
        basicjoin.WANDS AS w
    INNER JOIN
        basicjoin.WANDS_PROPERTY AS p
    ON
        w.code = p.code AND
        p.is_evil = 0
    GROUP BY
        w.code,
        powers,
        age
)
SELECT
    w.id,
    m.age,
    m.cn coins,
    m.powers
FROM
    basicjoin.WANDS AS w
INNER JOIN
    MN AS m
ON
    w.coins_needed = m.cn AND
    w.powers = m.powers AND
    w.code = m.code
ORDER BY
    m.powers DESC,
    m.age DESC;
GO

raiserror('Now at BasicJoinTestClass.test_06ollivadersinventory creation ....',0,1)

GO

CREATE or ALTER PROCEDURE BasicJoinTestClass.test_06ollivadersinventory
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  id		int		NOT NULL,
		  age		int	    NULL,
		  coins		int		NULL,
		  powers	int		NULL
    );

    INSERT INTO actual (id, age, coins, powers) exec basicjoin.proc_06ollivadersinventory

    CREATE TABLE expected (
		  id		int		NOT NULL,
		  age		int	    NULL,
		  coins		int		NULL,
		  powers	int		NULL
    );

	INSERT INTO expected (id, age, coins, powers) SELECT 1038,496,4789,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1130,494,9439,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1315,492,4126,10
	INSERT INTO expected (id, age, coins, powers) SELECT 9,491,7345,10
	INSERT INTO expected (id, age, coins, powers) SELECT 858,483,4352,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1164,481,9831,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1288,464,4952,10
	INSERT INTO expected (id, age, coins, powers) SELECT 861,462,8302,10
	INSERT INTO expected (id, age, coins, powers) SELECT 412,455,5625,10
	INSERT INTO expected (id, age, coins, powers) SELECT 996,451,8884,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1608,446,8351,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1376,443,1735,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1330,430,5182,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1633,425,2206,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1197,419,3468,10
	INSERT INTO expected (id, age, coins, powers) SELECT 441,416,2508,10
	INSERT INTO expected (id, age, coins, powers) SELECT 424,413,997,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1298,397,3810,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1125,395,2299,10
	INSERT INTO expected (id, age, coins, powers) SELECT 333,393,926,10
	INSERT INTO expected (id, age, coins, powers) SELECT 363,388,4477,10
	INSERT INTO expected (id, age, coins, powers) SELECT 785,380,1712,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1578,376,9886,10
	INSERT INTO expected (id, age, coins, powers) SELECT 455,375,2759,10
	INSERT INTO expected (id, age, coins, powers) SELECT 238,374,2016,10
	INSERT INTO expected (id, age, coins, powers) SELECT 421,367,4392,10
	INSERT INTO expected (id, age, coins, powers) SELECT 346,349,1909,10
	INSERT INTO expected (id, age, coins, powers) SELECT 874,348,7212,10
	INSERT INTO expected (id, age, coins, powers) SELECT 483,344,8855,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1485,340,741,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1583,339,3867,10
	INSERT INTO expected (id, age, coins, powers) SELECT 983,337,851,10
	INSERT INTO expected (id, age, coins, powers) SELECT 185,335,618,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1325,318,520,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1938,311,2726,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1121,310,6498,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1773,308,3489,10
	INSERT INTO expected (id, age, coins, powers) SELECT 999,301,7322,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1456,286,6221,10
	INSERT INTO expected (id, age, coins, powers) SELECT 405,284,1187,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1903,283,5954,10
	INSERT INTO expected (id, age, coins, powers) SELECT 114,279,7915,10
	INSERT INTO expected (id, age, coins, powers) SELECT 525,278,3247,10
	INSERT INTO expected (id, age, coins, powers) SELECT 707,275,8110,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1040,271,4993,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1655,264,2027,10
	INSERT INTO expected (id, age, coins, powers) SELECT 266,263,2106,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1520,259,2533,10
	INSERT INTO expected (id, age, coins, powers) SELECT 426,255,9950,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1214,254,3927,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1161,240,4875,10
	INSERT INTO expected (id, age, coins, powers) SELECT 470,235,1794,10
	INSERT INTO expected (id, age, coins, powers) SELECT 383,229,918,10
	INSERT INTO expected (id, age, coins, powers) SELECT 708,222,941,10
	INSERT INTO expected (id, age, coins, powers) SELECT 564,219,4073,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1709,211,6749,10
	INSERT INTO expected (id, age, coins, powers) SELECT 988,209,1775,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1846,208,529,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1854,206,4798,10
	INSERT INTO expected (id, age, coins, powers) SELECT 668,205,1985,10
	INSERT INTO expected (id, age, coins, powers) SELECT 720,199,601,10
	INSERT INTO expected (id, age, coins, powers) SELECT 579,189,2951,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1369,181,6762,10
	INSERT INTO expected (id, age, coins, powers) SELECT 608,177,7538,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1723,176,619,10
	INSERT INTO expected (id, age, coins, powers) SELECT 447,172,4329,10
	INSERT INTO expected (id, age, coins, powers) SELECT 993,171,2922,10
	INSERT INTO expected (id, age, coins, powers) SELECT 365,168,4144,10
	INSERT INTO expected (id, age, coins, powers) SELECT 466,158,5958,10
	INSERT INTO expected (id, age, coins, powers) SELECT 1434,494,683,9
	INSERT INTO expected (id, age, coins, powers) SELECT 519,487,6652,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1184,483,7376,9
	INSERT INTO expected (id, age, coins, powers) SELECT 582,481,615,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1556,466,6648,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1430,464,9556,9
	INSERT INTO expected (id, age, coins, powers) SELECT 834,455,557,9
	INSERT INTO expected (id, age, coins, powers) SELECT 644,446,5487,9
	INSERT INTO expected (id, age, coins, powers) SELECT 260,438,5182,9
	INSERT INTO expected (id, age, coins, powers) SELECT 189,434,5486,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1687,430,1188,9
	INSERT INTO expected (id, age, coins, powers) SELECT 458,416,9740,9
	INSERT INTO expected (id, age, coins, powers) SELECT 494,414,5869,9
	INSERT INTO expected (id, age, coins, powers) SELECT 367,413,8763,9
	INSERT INTO expected (id, age, coins, powers) SELECT 451,398,1581,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1500,395,7326,9
	INSERT INTO expected (id, age, coins, powers) SELECT 277,389,2097,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1472,386,4466,9
	INSERT INTO expected (id, age, coins, powers) SELECT 373,381,8547,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1032,380,917,9
	INSERT INTO expected (id, age, coins, powers) SELECT 896,376,4113,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1626,375,9862,9
	INSERT INTO expected (id, age, coins, powers) SELECT 607,374,3734,9
	INSERT INTO expected (id, age, coins, powers) SELECT 926,367,792,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1347,364,6443,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1031,353,6876,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1869,349,2140,9
	INSERT INTO expected (id, age, coins, powers) SELECT 101,348,3200,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1323,345,868,9
	INSERT INTO expected (id, age, coins, powers) SELECT 919,340,643,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1570,337,9490,9
	INSERT INTO expected (id, age, coins, powers) SELECT 679,335,2992,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1183,310,1738,9
	INSERT INTO expected (id, age, coins, powers) SELECT 647,308,3172,9
	INSERT INTO expected (id, age, coins, powers) SELECT 472,306,2022,9
	INSERT INTO expected (id, age, coins, powers) SELECT 965,297,4329,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1098,292,5141,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1300,290,4041,9
	INSERT INTO expected (id, age, coins, powers) SELECT 719,279,5192,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1327,278,715,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1872,275,6149,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1753,271,4826,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1810,264,2868,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1116,263,5321,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1781,255,7991,9
	INSERT INTO expected (id, age, coins, powers) SELECT 110,254,5558,9
	INSERT INTO expected (id, age, coins, powers) SELECT 839,249,3362,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1555,247,739,9
	INSERT INTO expected (id, age, coins, powers) SELECT 461,243,6003,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1720,240,9556,9
	INSERT INTO expected (id, age, coins, powers) SELECT 520,233,2584,9
	INSERT INTO expected (id, age, coins, powers) SELECT 882,229,3085,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1772,219,1780,9
	INSERT INTO expected (id, age, coins, powers) SELECT 416,211,7726,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1400,209,1568,9
	INSERT INTO expected (id, age, coins, powers) SELECT 54,208,1507,9
	INSERT INTO expected (id, age, coins, powers) SELECT 111,205,7125,9
	INSERT INTO expected (id, age, coins, powers) SELECT 452,202,2760,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1035,199,703,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1114,178,8085,9
	INSERT INTO expected (id, age, coins, powers) SELECT 162,176,4929,9
	INSERT INTO expected (id, age, coins, powers) SELECT 201,168,4174,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1649,164,8391,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1177,158,5001,9
	INSERT INTO expected (id, age, coins, powers) SELECT 1852,496,1645,8
	INSERT INTO expected (id, age, coins, powers) SELECT 246,494,828,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1231,491,4540,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1383,487,1881,8
	INSERT INTO expected (id, age, coins, powers) SELECT 209,481,543,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1196,466,7501,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1345,464,4883,8
	INSERT INTO expected (id, age, coins, powers) SELECT 975,451,3790,8
	INSERT INTO expected (id, age, coins, powers) SELECT 966,446,7264,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1621,443,9833,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1653,432,5529,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1247,430,1850,8
	INSERT INTO expected (id, age, coins, powers) SELECT 491,419,842,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1368,416,1031,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1811,414,4931,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1282,413,5423,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1589,398,522,8
	INSERT INTO expected (id, age, coins, powers) SELECT 689,397,7834,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1719,395,6039,8
	INSERT INTO expected (id, age, coins, powers) SELECT 894,393,1745,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1058,389,3607,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1498,388,7509,8
	INSERT INTO expected (id, age, coins, powers) SELECT 35,386,1867,8
	INSERT INTO expected (id, age, coins, powers) SELECT 991,382,1542,8
	INSERT INTO expected (id, age, coins, powers) SELECT 264,381,4813,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1669,380,623,8
	INSERT INTO expected (id, age, coins, powers) SELECT 995,376,954,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1885,375,3919,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1453,374,6469,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1129,367,1066,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1477,361,9542,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1076,353,3811,8
	INSERT INTO expected (id, age, coins, powers) SELECT 468,349,3038,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1022,348,6984,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1270,345,5833,8
	INSERT INTO expected (id, age, coins, powers) SELECT 569,344,2476,8
	INSERT INTO expected (id, age, coins, powers) SELECT 987,343,6764,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1754,339,6855,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1829,335,1070,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1117,311,856,8
	INSERT INTO expected (id, age, coins, powers) SELECT 415,310,526,8
	INSERT INTO expected (id, age, coins, powers) SELECT 826,308,845,8
	INSERT INTO expected (id, age, coins, powers) SELECT 817,306,9243,8
	INSERT INTO expected (id, age, coins, powers) SELECT 202,301,2302,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1796,297,4564,8
	INSERT INTO expected (id, age, coins, powers) SELECT 549,292,4835,8
	INSERT INTO expected (id, age, coins, powers) SELECT 420,290,1197,8
	INSERT INTO expected (id, age, coins, powers) SELECT 605,286,5054,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1338,284,7372,8
	INSERT INTO expected (id, age, coins, powers) SELECT 803,283,4465,8
	INSERT INTO expected (id, age, coins, powers) SELECT 587,279,3628,8
	INSERT INTO expected (id, age, coins, powers) SELECT 155,275,2753,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1537,271,9418,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1015,264,1696,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1008,263,7567,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1402,259,607,8
	INSERT INTO expected (id, age, coins, powers) SELECT 288,254,6100,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1420,247,7116,8
	INSERT INTO expected (id, age, coins, powers) SELECT 436,243,745,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1340,240,846,8
	INSERT INTO expected (id, age, coins, powers) SELECT 384,235,1736,8
	INSERT INTO expected (id, age, coins, powers) SELECT 872,229,824,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1273,211,9890,8
	INSERT INTO expected (id, age, coins, powers) SELECT 471,209,704,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1471,208,3534,8
	INSERT INTO expected (id, age, coins, powers) SELECT 776,206,7913,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1457,205,4010,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1449,202,2450,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1213,199,2826,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1567,189,4655,8
	INSERT INTO expected (id, age, coins, powers) SELECT 963,178,5633,8
	INSERT INTO expected (id, age, coins, powers) SELECT 1025,177,1024,8
	INSERT INTO expected (id, age, coins, powers) SELECT 71,172,2245,8
	INSERT INTO expected (id, age, coins, powers) SELECT 81,496,6908,7
	INSERT INTO expected (id, age, coins, powers) SELECT 985,494,2401,7
	INSERT INTO expected (id, age, coins, powers) SELECT 808,491,2129,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1651,487,1973,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1232,483,1281,7
	INSERT INTO expected (id, age, coins, powers) SELECT 398,481,1990,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1190,466,8050,7
	INSERT INTO expected (id, age, coins, powers) SELECT 235,464,4357,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1397,455,3546,7
	INSERT INTO expected (id, age, coins, powers) SELECT 118,451,6046,7
	INSERT INTO expected (id, age, coins, powers) SELECT 705,450,6692,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1828,446,6322,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1798,443,738,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1862,438,1473,7
	INSERT INTO expected (id, age, coins, powers) SELECT 827,434,6585,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1795,425,7474,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1851,416,3716,7
	INSERT INTO expected (id, age, coins, powers) SELECT 696,414,2546,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1289,413,931,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1375,395,890,7
	INSERT INTO expected (id, age, coins, powers) SELECT 492,389,7926,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1052,388,667,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1648,382,1719,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1744,381,6740,7
	INSERT INTO expected (id, age, coins, powers) SELECT 651,376,586,7
	INSERT INTO expected (id, age, coins, powers) SELECT 850,375,7312,7
	INSERT INTO expected (id, age, coins, powers) SELECT 267,374,745,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1191,367,3425,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1091,361,3969,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1812,349,6582,7
	INSERT INTO expected (id, age, coins, powers) SELECT 523,348,7208,7
	INSERT INTO expected (id, age, coins, powers) SELECT 804,345,5730,7
	INSERT INTO expected (id, age, coins, powers) SELECT 542,344,717,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1971,343,2529,7
	INSERT INTO expected (id, age, coins, powers) SELECT 667,340,2996,7
	INSERT INTO expected (id, age, coins, powers) SELECT 46,337,764,7
	INSERT INTO expected (id, age, coins, powers) SELECT 387,335,7171,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1859,329,1634,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1392,320,8898,7
	INSERT INTO expected (id, age, coins, powers) SELECT 351,318,856,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1667,311,3537,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1242,306,5838,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1192,301,909,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1972,297,644,7
	INSERT INTO expected (id, age, coins, powers) SELECT 311,292,6740,7
	INSERT INTO expected (id, age, coins, powers) SELECT 63,290,7761,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1496,286,699,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1794,284,7729,7
	INSERT INTO expected (id, age, coins, powers) SELECT 875,283,4077,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1479,279,4474,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1881,275,7430,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1442,272,2285,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1747,271,849,7
	INSERT INTO expected (id, age, coins, powers) SELECT 842,264,2847,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1312,263,5432,7
	INSERT INTO expected (id, age, coins, powers) SELECT 278,259,9600,7
	INSERT INTO expected (id, age, coins, powers) SELECT 225,254,8004,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1175,247,9064,7
	INSERT INTO expected (id, age, coins, powers) SELECT 915,243,2728,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1357,240,624,7
	INSERT INTO expected (id, age, coins, powers) SELECT 835,233,600,7
	INSERT INTO expected (id, age, coins, powers) SELECT 140,222,1076,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1271,219,3105,7
	INSERT INTO expected (id, age, coins, powers) SELECT 546,211,2060,7
	INSERT INTO expected (id, age, coins, powers) SELECT 751,209,1463,7
	INSERT INTO expected (id, age, coins, powers) SELECT 444,208,6119,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1084,206,2417,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1533,205,2578,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1636,202,4176,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1877,189,2481,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1274,178,4168,7
	INSERT INTO expected (id, age, coins, powers) SELECT 42,177,5708,7
	INSERT INTO expected (id, age, coins, powers) SELECT 319,172,8013,7
	INSERT INTO expected (id, age, coins, powers) SELECT 122,168,2180,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1067,164,5529,7
	INSERT INTO expected (id, age, coins, powers) SELECT 1432,492,4897,6
	INSERT INTO expected (id, age, coins, powers) SELECT 321,491,1382,6
	INSERT INTO expected (id, age, coins, powers) SELECT 574,487,7369,6
	INSERT INTO expected (id, age, coins, powers) SELECT 275,481,9573,6
	INSERT INTO expected (id, age, coins, powers) SELECT 670,466,9009,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1552,464,641,6
	INSERT INTO expected (id, age, coins, powers) SELECT 656,455,4052,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1391,451,3905,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1396,446,5802,6
	INSERT INTO expected (id, age, coins, powers) SELECT 41,443,3049,6
	INSERT INTO expected (id, age, coins, powers) SELECT 198,438,4913,6
	INSERT INTO expected (id, age, coins, powers) SELECT 986,434,6882,6
	INSERT INTO expected (id, age, coins, powers) SELECT 897,432,2101,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1166,425,8055,6
	INSERT INTO expected (id, age, coins, powers) SELECT 801,419,3959,6
	INSERT INTO expected (id, age, coins, powers) SELECT 435,416,1898,6
	INSERT INTO expected (id, age, coins, powers) SELECT 806,413,6208,6
	INSERT INTO expected (id, age, coins, powers) SELECT 750,395,2417,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1450,393,2094,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1598,389,4406,6
	INSERT INTO expected (id, age, coins, powers) SELECT 938,388,1768,6
	INSERT INTO expected (id, age, coins, powers) SELECT 640,382,1074,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1385,381,5667,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1803,380,3467,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1317,376,2932,6
	INSERT INTO expected (id, age, coins, powers) SELECT 338,375,712,6
	INSERT INTO expected (id, age, coins, powers) SELECT 790,367,1373,6
	INSERT INTO expected (id, age, coins, powers) SELECT 717,361,750,6
	INSERT INTO expected (id, age, coins, powers) SELECT 811,353,2009,6
	INSERT INTO expected (id, age, coins, powers) SELECT 193,349,5459,6
	INSERT INTO expected (id, age, coins, powers) SELECT 179,345,1928,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1996,344,7822,6
	INSERT INTO expected (id, age, coins, powers) SELECT 339,343,822,6
	INSERT INTO expected (id, age, coins, powers) SELECT 330,339,9559,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1688,337,4112,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1524,335,4263,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1943,320,1897,6
	INSERT INTO expected (id, age, coins, powers) SELECT 23,318,4654,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1123,311,2233,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1932,301,3754,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1673,297,1414,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1986,290,841,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1299,286,5589,6
	INSERT INTO expected (id, age, coins, powers) SELECT 554,284,2123,6
	INSERT INTO expected (id, age, coins, powers) SELECT 641,279,8632,6
	INSERT INTO expected (id, age, coins, powers) SELECT 516,278,1906,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1816,275,1397,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1588,272,7772,6
	INSERT INTO expected (id, age, coins, powers) SELECT 196,271,1124,6
	INSERT INTO expected (id, age, coins, powers) SELECT 960,264,6577,6
	INSERT INTO expected (id, age, coins, powers) SELECT 866,263,5486,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1961,259,709,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1328,255,6197,6
	INSERT INTO expected (id, age, coins, powers) SELECT 824,254,3571,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1855,249,6568,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1665,247,939,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1286,243,1300,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1087,240,2500,6
	INSERT INTO expected (id, age, coins, powers) SELECT 173,235,7189,6
	INSERT INTO expected (id, age, coins, powers) SELECT 950,233,1691,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1193,222,759,6
	INSERT INTO expected (id, age, coins, powers) SELECT 324,219,6659,6
	INSERT INTO expected (id, age, coins, powers) SELECT 166,211,2782,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1573,209,754,6
	INSERT INTO expected (id, age, coins, powers) SELECT 139,208,5422,6
	INSERT INTO expected (id, age, coins, powers) SELECT 476,205,6650,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1543,199,4172,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1727,189,947,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1475,181,4079,6
	INSERT INTO expected (id, age, coins, powers) SELECT 78,177,8086,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1349,176,9851,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1609,172,727,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1920,171,1364,6
	INSERT INTO expected (id, age, coins, powers) SELECT 954,168,9659,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1152,164,8938,6
	INSERT INTO expected (id, age, coins, powers) SELECT 1264,496,2740,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1683,494,7069,5
	INSERT INTO expected (id, age, coins, powers) SELECT 971,491,6273,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1702,487,2329,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1267,483,3934,5
	INSERT INTO expected (id, age, coins, powers) SELECT 617,481,1923,5
	INSERT INTO expected (id, age, coins, powers) SELECT 228,464,5901,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1629,462,989,5
	INSERT INTO expected (id, age, coins, powers) SELECT 953,451,7238,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1958,450,956,5
	INSERT INTO expected (id, age, coins, powers) SELECT 474,446,7886,5
	INSERT INTO expected (id, age, coins, powers) SELECT 539,443,2788,5
	INSERT INTO expected (id, age, coins, powers) SELECT 285,432,6321,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1331,430,5279,5
	INSERT INTO expected (id, age, coins, powers) SELECT 849,419,5455,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1717,416,2100,5
	INSERT INTO expected (id, age, coins, powers) SELECT 830,414,2435,5
	INSERT INTO expected (id, age, coins, powers) SELECT 90,397,4654,5
	INSERT INTO expected (id, age, coins, powers) SELECT 413,395,3163,5
	INSERT INTO expected (id, age, coins, powers) SELECT 234,389,2366,5
	INSERT INTO expected (id, age, coins, powers) SELECT 602,388,651,5
	INSERT INTO expected (id, age, coins, powers) SELECT 614,386,2492,5
	INSERT INTO expected (id, age, coins, powers) SELECT 396,382,4920,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1738,380,3143,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1579,376,2003,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1564,375,5959,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1953,374,3513,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1884,367,3603,5
	INSERT INTO expected (id, age, coins, powers) SELECT 810,364,2248,5
	INSERT INTO expected (id, age, coins, powers) SELECT 217,353,8993,5
	INSERT INTO expected (id, age, coins, powers) SELECT 759,349,4318,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1308,345,2277,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1974,344,7243,5
	INSERT INTO expected (id, age, coins, powers) SELECT 199,343,3197,5
	INSERT INTO expected (id, age, coins, powers) SELECT 669,340,8348,5
	INSERT INTO expected (id, age, coins, powers) SELECT 489,339,754,5
	INSERT INTO expected (id, age, coins, powers) SELECT 557,335,576,5
	INSERT INTO expected (id, age, coins, powers) SELECT 283,320,5822,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1001,311,935,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1306,310,9938,5
	INSERT INTO expected (id, age, coins, powers) SELECT 428,306,709,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1127,297,1075,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1063,292,3556,5
	INSERT INTO expected (id, age, coins, powers) SELECT 979,290,9883,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1461,286,890,5
	INSERT INTO expected (id, age, coins, powers) SELECT 927,284,1917,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1844,283,5319,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1439,279,1426,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1436,278,1783,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1956,275,2093,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1499,272,4096,5
	INSERT INTO expected (id, age, coins, powers) SELECT 869,271,1239,5
	INSERT INTO expected (id, age, coins, powers) SELECT 581,263,3584,5
	INSERT INTO expected (id, age, coins, powers) SELECT 807,259,862,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1044,255,5161,5
	INSERT INTO expected (id, age, coins, powers) SELECT 409,247,7957,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1519,240,1408,5
	INSERT INTO expected (id, age, coins, powers) SELECT 873,235,7585,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1693,222,2884,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1809,219,2479,5
	INSERT INTO expected (id, age, coins, powers) SELECT 14,211,870,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1150,209,2551,5
	INSERT INTO expected (id, age, coins, powers) SELECT 381,208,5526,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1352,202,785,5
	INSERT INTO expected (id, age, coins, powers) SELECT 583,199,520,5
	INSERT INTO expected (id, age, coins, powers) SELECT 163,189,4345,5
	INSERT INTO expected (id, age, coins, powers) SELECT 823,181,4505,5
	INSERT INTO expected (id, age, coins, powers) SELECT 102,178,725,5
	INSERT INTO expected (id, age, coins, powers) SELECT 908,176,7103,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1635,172,3121,5
	INSERT INTO expected (id, age, coins, powers) SELECT 1491,496,6408,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1960,494,2152,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1492,492,1439,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1124,491,1163,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1799,487,5102,4
	INSERT INTO expected (id, age, coins, powers) SELECT 604,483,2551,4
	INSERT INTO expected (id, age, coins, powers) SELECT 538,466,1715,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1814,462,2464,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1901,455,2316,4
	INSERT INTO expected (id, age, coins, powers) SELECT 464,451,1153,4
	INSERT INTO expected (id, age, coins, powers) SELECT 765,450,3095,4
	INSERT INTO expected (id, age, coins, powers) SELECT 628,446,2454,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1793,438,9329,4
	INSERT INTO expected (id, age, coins, powers) SELECT 203,434,8444,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1030,432,3212,4
	INSERT INTO expected (id, age, coins, powers) SELECT 815,430,8380,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1521,425,9660,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1220,419,6002,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1924,416,892,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1071,414,655,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1657,413,5497,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1907,398,9538,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1043,397,7486,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1238,395,7148,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1592,389,1227,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1427,388,2436,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1377,386,8068,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1584,376,3198,4
	INSERT INTO expected (id, age, coins, powers) SELECT 625,375,4112,4
	INSERT INTO expected (id, age, coins, powers) SELECT 124,367,4521,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1736,361,6090,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1336,349,2230,4
	INSERT INTO expected (id, age, coins, powers) SELECT 832,344,9319,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1490,340,3713,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1742,339,8869,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1548,337,5171,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1904,335,5876,4
	INSERT INTO expected (id, age, coins, powers) SELECT 947,329,3567,4
	INSERT INTO expected (id, age, coins, powers) SELECT 535,320,4739,4
	INSERT INTO expected (id, age, coins, powers) SELECT 291,311,3457,4
	INSERT INTO expected (id, age, coins, powers) SELECT 742,310,3732,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1440,308,4240,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1176,306,1724,4
	INSERT INTO expected (id, age, coins, powers) SELECT 271,297,8239,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1448,286,905,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1403,284,1465,4
	INSERT INTO expected (id, age, coins, powers) SELECT 934,283,3719,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1999,279,630,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1301,271,3343,4
	INSERT INTO expected (id, age, coins, powers) SELECT 561,264,2349,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1880,263,8489,4
	INSERT INTO expected (id, age, coins, powers) SELECT 56,255,1509,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1378,254,5895,4
	INSERT INTO expected (id, age, coins, powers) SELECT 280,249,9458,4
	INSERT INTO expected (id, age, coins, powers) SELECT 585,247,8631,4
	INSERT INTO expected (id, age, coins, powers) SELECT 227,243,1543,4
	INSERT INTO expected (id, age, coins, powers) SELECT 694,240,808,4
	INSERT INTO expected (id, age, coins, powers) SELECT 779,235,682,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1002,233,899,4
	INSERT INTO expected (id, age, coins, powers) SELECT 917,222,9112,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1561,219,2680,4
	INSERT INTO expected (id, age, coins, powers) SELECT 972,211,9359,4
	INSERT INTO expected (id, age, coins, powers) SELECT 439,209,5237,4
	INSERT INTO expected (id, age, coins, powers) SELECT 250,206,4639,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1755,205,1184,4
	INSERT INTO expected (id, age, coins, powers) SELECT 727,202,2402,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1179,199,1746,4
	INSERT INTO expected (id, age, coins, powers) SELECT 431,189,2119,4
	INSERT INTO expected (id, age, coins, powers) SELECT 187,181,5943,4
	INSERT INTO expected (id, age, coins, powers) SELECT 207,178,4125,4
	INSERT INTO expected (id, age, coins, powers) SELECT 107,177,1742,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1549,176,687,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1666,172,3544,4
	INSERT INTO expected (id, age, coins, powers) SELECT 978,168,5212,4
	INSERT INTO expected (id, age, coins, powers) SELECT 25,164,6500,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1443,158,4398,4
	INSERT INTO expected (id, age, coins, powers) SELECT 1198,496,9766,3
	INSERT INTO expected (id, age, coins, powers) SELECT 853,492,2818,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1407,483,1501,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1033,455,8711,3
	INSERT INTO expected (id, age, coins, powers) SELECT 772,451,709,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1023,450,3662,3
	INSERT INTO expected (id, age, coins, powers) SELECT 152,446,602,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1942,443,1564,3
	INSERT INTO expected (id, age, coins, powers) SELECT 793,438,2601,3
	INSERT INTO expected (id, age, coins, powers) SELECT 215,434,901,3
	INSERT INTO expected (id, age, coins, powers) SELECT 548,432,3690,3
	INSERT INTO expected (id, age, coins, powers) SELECT 584,425,6585,3
	INSERT INTO expected (id, age, coins, powers) SELECT 540,419,952,3
	INSERT INTO expected (id, age, coins, powers) SELECT 943,416,5448,3
	INSERT INTO expected (id, age, coins, powers) SELECT 784,414,1052,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1199,413,1073,3
	INSERT INTO expected (id, age, coins, powers) SELECT 302,398,531,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1509,397,1655,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1045,395,1030,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1899,393,5222,3
	INSERT INTO expected (id, age, coins, powers) SELECT 272,389,1635,3
	INSERT INTO expected (id, age, coins, powers) SELECT 103,388,1418,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1593,382,7807,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1421,376,5667,3
	INSERT INTO expected (id, age, coins, powers) SELECT 653,375,6260,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1766,374,6576,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1011,367,1083,3
	INSERT INTO expected (id, age, coins, powers) SELECT 313,364,8846,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1714,361,7322,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1791,353,2532,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1912,349,626,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1825,348,5368,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1741,345,7560,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1788,343,9402,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1574,339,4333,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1671,337,556,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1419,335,643,3
	INSERT INTO expected (id, age, coins, powers) SELECT 73,320,2495,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1756,311,6841,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1200,310,4029,3
	INSERT INTO expected (id, age, coins, powers) SELECT 836,308,6654,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1842,306,522,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1381,297,1629,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1804,292,7110,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1305,290,4862,3
	INSERT INTO expected (id, age, coins, powers) SELECT 296,286,6021,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1718,284,2168,3
	INSERT INTO expected (id, age, coins, powers) SELECT 748,283,8332,3
	INSERT INTO expected (id, age, coins, powers) SELECT 589,278,3044,3
	INSERT INTO expected (id, age, coins, powers) SELECT 601,275,1510,3
	INSERT INTO expected (id, age, coins, powers) SELECT 710,264,2555,3
	INSERT INTO expected (id, age, coins, powers) SELECT 123,249,5931,3
	INSERT INTO expected (id, age, coins, powers) SELECT 191,247,4178,3
	INSERT INTO expected (id, age, coins, powers) SELECT 465,243,1424,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1155,240,4584,3
	INSERT INTO expected (id, age, coins, powers) SELECT 693,235,2811,3
	INSERT INTO expected (id, age, coins, powers) SELECT 159,233,1899,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1965,219,611,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1065,211,7160,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1611,208,7653,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1470,206,6215,3
	INSERT INTO expected (id, age, coins, powers) SELECT 388,199,7887,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1478,189,2612,3
	INSERT INTO expected (id, age, coins, powers) SELECT 709,181,4942,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1596,178,601,3
	INSERT INTO expected (id, age, coins, powers) SELECT 37,177,2519,3
	INSERT INTO expected (id, age, coins, powers) SELECT 147,176,2255,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1018,172,3240,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1837,171,5669,3
	INSERT INTO expected (id, age, coins, powers) SELECT 91,164,2680,3
	INSERT INTO expected (id, age, coins, powers) SELECT 1293,496,2059,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1728,494,7392,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1309,492,2782,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1354,491,733,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1366,487,801,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1236,483,556,2
	INSERT INTO expected (id, age, coins, powers) SELECT 676,481,2324,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1778,466,1306,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1646,464,6785,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1848,455,4746,2
	INSERT INTO expected (id, age, coins, powers) SELECT 390,451,602,2
	INSERT INTO expected (id, age, coins, powers) SELECT 192,450,9708,2
	INSERT INTO expected (id, age, coins, powers) SELECT 487,446,1722,2
	INSERT INTO expected (id, age, coins, powers) SELECT 38,443,2750,2
	INSERT INTO expected (id, age, coins, powers) SELECT 551,438,3185,2
	INSERT INTO expected (id, age, coins, powers) SELECT 994,430,7359,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1860,425,2856,2
	INSERT INTO expected (id, age, coins, powers) SELECT 596,416,2266,2
	INSERT INTO expected (id, age, coins, powers) SELECT 167,414,3144,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1284,413,4648,2
	INSERT INTO expected (id, age, coins, powers) SELECT 70,398,9359,2
	INSERT INTO expected (id, age, coins, powers) SELECT 716,397,3277,2
	INSERT INTO expected (id, age, coins, powers) SELECT 729,395,2208,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1249,393,4436,2
	INSERT INTO expected (id, age, coins, powers) SELECT 683,389,6896,2
	INSERT INTO expected (id, age, coins, powers) SELECT 133,388,614,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1790,386,4949,2
	INSERT INTO expected (id, age, coins, powers) SELECT 334,382,3236,2
	INSERT INTO expected (id, age, coins, powers) SELECT 371,381,3436,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1957,380,9673,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1388,376,2199,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1014,375,1555,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1964,374,4722,2
	INSERT INTO expected (id, age, coins, powers) SELECT 15,364,1099,2
	INSERT INTO expected (id, age, coins, powers) SELECT 871,361,3509,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1235,353,2522,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1167,349,5906,2
	INSERT INTO expected (id, age, coins, powers) SELECT 571,348,8962,2
	INSERT INTO expected (id, age, coins, powers) SELECT 712,345,7448,2
	INSERT INTO expected (id, age, coins, powers) SELECT 798,344,3185,2
	INSERT INTO expected (id, age, coins, powers) SELECT 299,343,1255,2
	INSERT INTO expected (id, age, coins, powers) SELECT 270,340,2284,2
	INSERT INTO expected (id, age, coins, powers) SELECT 86,339,3064,2
	INSERT INTO expected (id, age, coins, powers) SELECT 904,335,7241,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1156,329,1208,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1143,320,552,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1398,318,3190,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1677,310,2090,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1411,308,5896,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1182,306,1989,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1743,301,4361,2
	INSERT INTO expected (id, age, coins, powers) SELECT 145,292,4695,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1437,290,2834,2
	INSERT INTO expected (id, age, coins, powers) SELECT 654,286,3764,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1332,283,5081,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1412,279,3741,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1775,278,5121,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1508,275,2397,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1746,272,9908,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1291,271,751,2
	INSERT INTO expected (id, age, coins, powers) SELECT 558,264,698,2
	INSERT INTO expected (id, age, coins, powers) SELECT 459,263,4933,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1658,254,2847,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1845,243,1596,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1591,240,4684,2
	INSERT INTO expected (id, age, coins, powers) SELECT 310,235,6601,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1713,229,1796,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1550,222,2599,2
	INSERT INTO expected (id, age, coins, powers) SELECT 629,219,1956,2
	INSERT INTO expected (id, age, coins, powers) SELECT 867,209,8585,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1546,205,8204,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1978,202,9255,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1871,181,2168,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1075,178,7422,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1230,172,1288,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1413,168,8918,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1930,164,3480,2
	INSERT INTO expected (id, age, coins, powers) SELECT 1188,496,6229,1
	INSERT INTO expected (id, age, coins, powers) SELECT 738,491,2123,1
	INSERT INTO expected (id, age, coins, powers) SELECT 753,487,5687,1
	INSERT INTO expected (id, age, coins, powers) SELECT 900,483,622,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1913,466,4554,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1064,464,3029,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1454,462,9158,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1544,455,8099,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1131,451,4326,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1361,446,1097,1
	INSERT INTO expected (id, age, coins, powers) SELECT 146,443,5967,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1252,438,7545,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1817,434,1263,1
	INSERT INTO expected (id, age, coins, powers) SELECT 648,432,4981,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1364,425,1718,1
	INSERT INTO expected (id, age, coins, powers) SELECT 632,419,526,1
	INSERT INTO expected (id, age, coins, powers) SELECT 450,414,4686,1
	INSERT INTO expected (id, age, coins, powers) SELECT 715,413,2917,1
	INSERT INTO expected (id, age, coins, powers) SELECT 10,398,1771,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1624,395,1080,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1310,393,1467,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1387,388,9023,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1012,386,2369,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1073,381,5021,1
	INSERT INTO expected (id, age, coins, powers) SELECT 802,380,8936,1
	INSERT INTO expected (id, age, coins, powers) SELECT 249,376,3937,1
	INSERT INTO expected (id, age, coins, powers) SELECT 659,375,923,1
	INSERT INTO expected (id, age, coins, powers) SELECT 104,374,1523,1
	INSERT INTO expected (id, age, coins, powers) SELECT 685,364,2708,1
	INSERT INTO expected (id, age, coins, powers) SELECT 622,361,2928,1
	INSERT INTO expected (id, age, coins, powers) SELECT 887,353,1456,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1446,349,2724,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1260,344,7345,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1189,343,653,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1962,337,555,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1684,335,5414,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1818,329,3352,1
	INSERT INTO expected (id, age, coins, powers) SELECT 556,320,2299,1
	INSERT INTO expected (id, age, coins, powers) SELECT 112,318,819,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1201,311,1945,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1612,310,2438,1
	INSERT INTO expected (id, age, coins, powers) SELECT 89,308,899,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1416,301,2701,1
	INSERT INTO expected (id, age, coins, powers) SELECT 936,297,557,1
	INSERT INTO expected (id, age, coins, powers) SELECT 508,292,9241,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1586,290,2221,1
	INSERT INTO expected (id, age, coins, powers) SELECT 642,286,799,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1458,283,5771,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1258,279,6892,1
	INSERT INTO expected (id, age, coins, powers) SELECT 341,278,7105,1
	INSERT INTO expected (id, age, coins, powers) SELECT 172,275,2550,1
	INSERT INTO expected (id, age, coins, powers) SELECT 639,272,4995,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1256,271,9518,1
	INSERT INTO expected (id, age, coins, powers) SELECT 691,264,5833,1
	INSERT INTO expected (id, age, coins, powers) SELECT 541,259,1738,1
	INSERT INTO expected (id, age, coins, powers) SELECT 176,255,8916,1
	INSERT INTO expected (id, age, coins, powers) SELECT 153,254,3961,1
	INSERT INTO expected (id, age, coins, powers) SELECT 998,249,1832,1
	INSERT INTO expected (id, age, coins, powers) SELECT 244,247,3286,1
	INSERT INTO expected (id, age, coins, powers) SELECT 220,240,9067,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1708,233,774,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1542,222,7773,1
	INSERT INTO expected (id, age, coins, powers) SELECT 521,211,9825,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1970,209,4788,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1399,208,1037,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1126,206,7659,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1640,205,978,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1343,202,6053,1
	INSERT INTO expected (id, age, coins, powers) SELECT 290,199,2579,1
	INSERT INTO expected (id, age, coins, powers) SELECT 597,189,868,1
	INSERT INTO expected (id, age, coins, powers) SELECT 457,177,6612,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1945,176,653,1
	INSERT INTO expected (id, age, coins, powers) SELECT 1157,172,7476,1
	INSERT INTO expected (id, age, coins, powers) SELECT 517,168,604,1
	INSERT INTO expected (id, age, coins, powers) SELECT 775,158,1684,1


    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END

GO

---exec tSQLt.Run 'BasicJoinTestClass.[test_06ollivadersinventory]';