You are given a table, Functions, containing two columns: X and Y.

+--------+----------+
| Column |   Type   |
+--------+----------+
| X      | Interger |
| Y      | Interger |
+--------+----------+

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

Sample Input

+----+----+
| X  | Y  |
+----+----+
| 20 | 20 |
| 20 | 20 |
| 20 | 21 |
| 23 | 22 |
| 22 | 23 |
| 21 | 20 |
+----+----+

Sample Output

20 20
20 21
22 23

WITH ExtenddedFunction (ID, X, Y)
AS
(
SELECT ROW_NUMBER() OVER (ORDER BY X ASC) AS ROWID, X, Y
FROM Functions
)

SELECT F1.X, F1.Y
FROM ExtenddedFunction F1
INNER JOIN ExtenddedFunction F2
ON F1.X = F2.Y
AND F2.X = F1.Y
WHERE F1.ID < F2.ID
ORDER BY F1.X ASC


+-----+-----+
|  X  |  Y  |
+-----+-----+
|   1 |   1 |
|   2 |   2 |
|   2 |  24 |
|   3 |   3 |
|   4 |  22 |
|   4 |   4 |
|   5 |   5 |
|   5 |  21 |
|   6 |  20 |
|   6 |   6 |
|   7 |   7 |
|   7 |  19 |
|   8 |   8 |
|   8 |  18 |
|   9 |  17 |
|   9 |   9 |
|  10 |  10 |
|  11 |  15 |
|  11 |  11 |
|  12 |  12 |
|  13 |  13 |
|  13 |  13 |
|  14 |  12 |
|  14 |  14 |
|  15 |  11 |
|  15 |  15 |
|  16 |  10 |
|  16 |  16 |
|  17 |   9 |
|  17 |  17 |
|  18 |   8 |
|  18 |  18 |
|  19 |  19 |
|  20 |   6 |
|  20 |  20 |
|  21 |   5 |
|  21 |  21 |
|  22 |  22 |
|  22 |   4 |
|  23 |  23 |
|  23 |   3 |
|  24 |   2 |
|  24 |  24 |
|  25 |   1 |
|  25 |  25 |
|  26 |  26 |
|  27 |  27 |
|  28 |  28 |
|  29 |  29 |
|  30 |  30 |
|  31 |  31 |
|  32 |  32 |
|  33 |  33 |
|  34 |  34 |
|  35 |  35 |
|  36 |  36 |
|  37 |  37 |
|  38 |  38 |
|  39 |  39 |
|  40 |  40 |
|  41 |  41 |
|  42 |  42 |
|  43 |  43 |
|  44 |  44 |
|  45 |  45 |
|  46 |  46 |
|  47 |  47 |
|  48 |  48 |
|  49 |  49 |
|  50 |  50 |
|  51 |  51 |
|  52 |  52 |
|  53 |  53 |
|  54 |  54 |
|  55 |  55 |
|  56 |  56 |
|  58 |  58 |
|  59 |  59 |
|  60 |  60 |
|  61 |  61 |
|  62 |  62 |
|  63 |  63 |
|  64 |  64 |
|  65 |  65 |
|  66 |  66 |
|  67 |  67 |
|  68 |  68 |
|  69 |  69 |
|  71 |  71 |
|  72 |  72 |
|  73 |  73 |
|  74 |  74 |
|  75 |  75 |
|  76 |  76 |
|  77 |  77 |
|  78 |  78 |
|  79 |  79 |
|  80 |  80 |
|  81 |  81 |
|  83 |  83 |
|  84 |  84 |
|  85 |  85 |
|  86 |  86 |
|  87 |  87 |
|  88 |  88 |
|  89 |  89 |
|  90 |  90 |
|  91 |  91 |
|  92 |  92 |
|  93 |  93 |
|  94 |  94 |
|  95 |  95 |
|  96 |  96 |
|  97 |  97 |
|  98 |  98 |
|  99 |  99 |
| 100 | 100 |
+-----+-----+

2 24
4 22
5 21
6 20
8 18
9 17
11 15
13 13