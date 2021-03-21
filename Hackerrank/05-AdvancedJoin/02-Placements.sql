You are given three tables: Students, Friends and Packages. Students contains two columns: ID and
Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains
two columns: ID and Salary (offered salary in $ thousands per month).

+--------+---------+
| Column |  Type   |
+--------+---------+
| ID     | Integer |
| Name   | String  |
+--------+---------+
Students

+-----------+---------+
|  Column   |  Type   |
+-----------+---------+
| ID        | Integer |
| Friend_ID | Integer |
+-----------+---------+
Friends

+--------+---------+
| Column |  Type   |
+--------+---------+
| ID     | Integer |
| Salary | Float   |
+--------+---------+
Packages

Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.

Sample Input

+----+----------+
| ID |   Name   |
+----+----------+
| 1  | Ashley   |
| 2  | Samantha |
| 3  | Julia    |
| 4  | Scarlet  |
+----+----------+
Students

+----+-----------+
| ID | Friend_ID |
+----+-----------+
| 1  |         2 |
| 1  |         3 |
| 3  |         4 |
| 4  |         1 |
+----+-----------+
Friends

+-----+--------+
| ID  | Salary |
+-----+--------+
|   1 | 15.20  |
|   2 | 10.06  |
|   3 | 11.55  |
|   4 | 12.12  |
+-----+--------+
Packages


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

SELECT Name FROM Students S
JOIN Friends F ON S.ID = F.ID
LEFT JOIN Packages P1 ON S.ID = P1.ID
LEFT JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P2.Salary > P1.Salary
ORDER BY P2.Salary;

+----+-----------+
| ID |   Name    |
+----+-----------+
|  1 | Samantha  |
|  2 | Julia     |
|  3 | Britney   |
|  4 | Kristeen  |
|  5 | Dyana     |
|  6 | Jenny     |
|  7 | Christene |
|  8 | Meera     |
|  9 | Priya     |
| 10 | Priyanka  |
| 11 | Paige     |
| 12 | Jane      |
| 13 | Belvet    |
| 14 | Scarlet   |
| 15 | Salma     |
| 16 | Amanda    |
| 17 | Maria     |
| 18 | Stuart    |
| 19 | Aamina    |
| 20 | Amina     |
+----+-----------+
Students


+----+-----------+
| ID | Friend_ID |
+----+-----------+
|  1 |        14 |
|  2 |        15 |
|  3 |        18 |
|  4 |        19 |
|  5 |        20 |
|  6 |         5 |
|  7 |         6 |
|  8 |         7 |
|  9 |         8 |
| 10 |         1 |
| 11 |         2 |
| 12 |         3 |
| 13 |         4 |
| 14 |         9 |
| 15 |        10 |
| 16 |        11 |
| 17 |        12 |
| 18 |        13 |
| 19 |        16 |
| 20 |        17 |
+----+-----------+
Friends

+----+-----------+
| ID |  Salary   |
+----+-----------+
|  1 | 15.5      |
|  2 | 15.6      |
|  3 | 16.700001 |
|  4 | 18.799999 |
|  5 | 31.5      |
|  6 | 45.0      |
|  7 | 47.0      |
|  8 | 46.0      |
|  9 | 39.0      |
| 10 | 11.1      |
| 11 | 12.1      |
| 12 | 13.1      |
| 13 | 14.1      |
| 14 | 15.1      |
| 15 | 17.1      |
| 16 | 21.1      |
| 17 | 31.1      |
| 18 | 13.15     |
| 19 | 33.330002 |
| 20 | 22.16     |
+----+-----------+
Packages


Stuart
Priyanka
Paige
Jane
Julia
Belvet
Amina
Kristeen
Scarlet
Priya
Meera