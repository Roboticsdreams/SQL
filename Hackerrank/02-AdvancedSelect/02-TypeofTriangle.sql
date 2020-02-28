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
COLUMN		TYPE
A			Integer
B			Integer
C			Integer

Each row in the table denotes the lengths of each of a triangle's three sides.

Sample Input

	A		B		C
	20		20 		23
	20		20		20
	20		21		22
	13		14		30

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

/* Create a table called TRIANGLES */
DROP TABLE TRIANGLES\\

CREATE TABLE TRIANGLES(
A	NUMBER,
B	NUMBER,
C	NUMBER)\\

/*select 'insert into TRIANGLES values ('||a ||','||b||','||c||')\\' from TRIANGLES;*/

/* Create few records in this table */
insert into TRIANGLES values ( 10,10,10)\\ 
insert into TRIANGLES values ( 11,11,11)\\ 
insert into TRIANGLES values ( 30,32,30)\\ 
insert into TRIANGLES values ( 40,40,40)\\ 
insert into TRIANGLES values ( 20,20,21)\\ 
insert into TRIANGLES values ( 21,21,21)\\ 
insert into TRIANGLES values ( 20,22,21)\\ 
insert into TRIANGLES values ( 20,20,40)\\ 
insert into TRIANGLES values ( 20,22,21)\\ 
insert into TRIANGLES values ( 30,32,41)\\ 
insert into TRIANGLES values ( 50,22,51)\\ 
insert into TRIANGLES values ( 20,12,61)\\ 
insert into TRIANGLES values ( 20,22,50)\\ 
insert into TRIANGLES values ( 50,52,51)\\ 
insert into TRIANGLES values ( 80,80,80)\\ 

select
CASE 
    when (((a+b) <= c) or ((b+c) <= a) or ((c+a) <= b))  then 'Not A Triangle'
    when ((a=b) and (b=c)) then 'Equilateral'
    when ((a=b) or (b=c) or (c=a)) then 'Isosceles'
    else 'Scalene'
end as result
from TRIANGLES\\
