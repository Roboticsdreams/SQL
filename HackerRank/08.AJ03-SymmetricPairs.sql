/*
You are given a table, Functions, containing two columns: X and Y.

+--------+----------+
| Column |   Type   |
+--------+----------+
| X      | Interger |
| Y      | Interger |
+--------+----------+

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ? Y1.

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
*/
use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE advancedjoin.proc_03symmetricpairs AS
WITH ExtenddedFunction (ID, X, Y)
AS
(
SELECT ROW_NUMBER() OVER (ORDER BY X ASC) AS ROWID, X, Y
FROM advancedjoin.FUNCTIONS
)
SELECT F1.X, F1.Y
FROM ExtenddedFunction F1
INNER JOIN ExtenddedFunction F2
ON F1.X = F2.Y
AND F2.X = F1.Y
WHERE F1.ID < F2.ID
ORDER BY F1.X ASC
GO

CREATE or ALTER PROCEDURE AdvancedJoinTestClass.test_03symmetricpairs
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	      X		int        NOT NULL,
		  Y		int        NOT NULL,
    );

    INSERT INTO actual (X,Y) exec advancedjoin.proc_03symmetricpairs

    CREATE TABLE expected (
	      X		int        NOT NULL,
		  Y		int        NOT NULL,
    );

	INSERT INTO expected (X,Y) SELECT 2 ,24;
	INSERT INTO expected (X,Y) SELECT 4 ,22;
	INSERT INTO expected (X,Y) SELECT 5 ,21;
	INSERT INTO expected (X,Y) SELECT 6 ,20;
	INSERT INTO expected (X,Y) SELECT 8 ,18;
	INSERT INTO expected (X,Y) SELECT 9 ,17;
	INSERT INTO expected (X,Y) SELECT 11,15;
	INSERT INTO expected (X,Y) SELECT 13,13;

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedJoinTestClass.[test_03symmetricpairs]';

