/*
Binary Tree Nodes

You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

+---------+---------+
| COLUMN  |  TYPE   |
+---------+---------+
| N       | Integer |
| P       | Integer |
+---------+---------+

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

Sample Input

+---+------+
| N |  P   |
+---+------+
| 1 | 2    |
| 3 | 2    |
| 6 | 8    |
| 9 | 8    |
| 2 | 5    |
| 8 | 5    |
| 5 | null |
+---+------+

Sample Output

1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf

Explanation

The Binary Tree below illustrates the sample:
		
						1
		
				2
						3
		
		5		
						6
		
				8
				
						9
*/

use hackerrank;

GO

raiserror('Now at the create procedure 2.4 Binary Tree Nodes....',0,1)

GO

CREATE or ALTER PROCEDURE advancedselect.proc_04binarytreenodes AS
SELECT 
	BST.N, 
	CASE
		WHEN BST.P IS NULL THEN 'Root' 
		WHEN Parents.P IS NULL THEN 'Leaf'
		ELSE 'Inner' END 
	as RESULT
FROM 
	advancedselect.BST
LEFT JOIN (
	SELECT 
		DISTINCT P 
	FROM 
		advancedselect.BST 
) Parents on Parents.P = BST.N
ORDER BY BST.N;
GO

CREATE or ALTER PROCEDURE AdvancedSelectTestClass.test_04binarytreenodes
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		  N				int				  NOT NULL,
	      RESULT		varchar(7)        NOT NULL
    );

    INSERT INTO actual (N, RESULT) exec advancedselect.proc_04binarytreenodes

    CREATE TABLE expected (
		  N				int				  NOT NULL,
	      RESULT		varchar(7)        NOT NULL
    );

	INSERT INTO expected (N, RESULT) SELECT 1,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 2,'Inner'
	INSERT INTO expected (N, RESULT) SELECT 3,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 4,'Inner'
	INSERT INTO expected (N, RESULT) SELECT 5,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 6,'Inner'
	INSERT INTO expected (N, RESULT) SELECT 7,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 8,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 9,'Inner'
	INSERT INTO expected (N, RESULT) SELECT 10,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 11,'Inner'
	INSERT INTO expected (N, RESULT) SELECT 12,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 13,'Inner'
	INSERT INTO expected (N, RESULT) SELECT 14,'Leaf'
	INSERT INTO expected (N, RESULT) SELECT 15,'Root'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedSelectTestClass.[test_04binarytreenodes]';

