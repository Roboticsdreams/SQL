/*
Type of Triangle

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 

Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

Input Format

The TRIANGLES table is described as follows:
+--------+---------+
| COLUMN |  TYPE   |
+--------+---------+
| A      | Integer |
| B      | Integer |
| C      | Integer |
+--------+---------+

Each row in the table denotes the lengths of each of a triangle's three sides.

Sample Input

+----+-----+----+
| A  |  B  | C  |
+----+-----+----+
| 20 | 20  | 23 |
| 20 |  20 | 20 |
| 20 |  21 | 22 |
| 13 |  14 | 30 |
+----+-----+----+

Sample Output

Isosceles
Equilateral
Scalene
Not A Triangle

Explanation

Values in the tuple (20,20,23) form an Isosceles triangle, because A= B .
Values in the tuple (20,20,20) form an Equilateral triangle, because A = B = C. 
Values in the tuple (20,21,22) form a Scalene triangle, because A!= B != C.
Values in the tuple (13,14,30) cannot form a triangle because the combined value of sides A and B is not larger than that of side C.
*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE advancedselect.proc_01typeoftriangle AS
select
	CASE 
		when (((A+B) <= C) or ((B+C) <= A) or ((C+A) <= B))  then 'Not A Triangle'
		when ((A=B) and (B=C)) then 'Equilateral'
		when ((A=B) or (B=C) or (C=A)) then 'Isosceles'
		else 'Scalene'
	end
from advancedselect.TRIANGLES;
GO

CREATE or ALTER PROCEDURE AdvancedSelectTestClass.test_01typeoftriangle
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	      RESULT		varchar(25)        NOT NULL,
    );

    INSERT INTO actual (RESULT) exec advancedselect.proc_01typeoftriangle

    CREATE TABLE expected (
	      RESULT		varchar(25)        NOT NULL,
    );

	INSERT INTO expected (RESULT) SELECT 'Equilateral'
	INSERT INTO expected (RESULT) SELECT 'Equilateral'
	INSERT INTO expected (RESULT) SELECT 'Isosceles'
	INSERT INTO expected (RESULT) SELECT 'Equilateral'
	INSERT INTO expected (RESULT) SELECT 'Isosceles'
	INSERT INTO expected (RESULT) SELECT 'Equilateral'
	INSERT INTO expected (RESULT) SELECT 'Scalene'
	INSERT INTO expected (RESULT) SELECT 'Not A Triangle'
	INSERT INTO expected (RESULT) SELECT 'Scalene'
	INSERT INTO expected (RESULT) SELECT 'Scalene'
	INSERT INTO expected (RESULT) SELECT 'Scalene'
	INSERT INTO expected (RESULT) SELECT 'Not A Triangle'
	INSERT INTO expected (RESULT) SELECT 'Not A Triangle'
	INSERT INTO expected (RESULT) SELECT 'Scalene'
	INSERT INTO expected (RESULT) SELECT 'Equilateral'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedSelectTestClass.[test_01typeoftriangle]';

