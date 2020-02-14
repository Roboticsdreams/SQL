/*
Higher Than 75 Marks

Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Input Format
COLUMN			TYPE
ID				Integer
NAME			String
MARKS			Integer

The STUDENTS table is described as follows:  
The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
Sample Input

ID		Name		Marks
1		Ashley		81
2		Samantha	75
4		Julia		76
3		Belvet		84

Sample Output

Ashley
Julia
Belvet
Explanation

Only Ashley, Julia, and Belvet have Marks > 75. If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.


/* Create a table called STUDENTS */
CREATE TABLE STUDENTS(
ID 		NUMBER, 
NAME 	VARCHAR2(21),
MARKS 	NUMBER);

/*select 'insert into students values (' ||id ||','''||name||''','||marks||');' from students;*/

/* Create few records in this table */
insert into students values (19,'Samantha',87); 
insert into students values (21,'Julia',96); 
insert into students values (11,'Britney',95); 
insert into students values (32,'Kristeen',100); 
insert into students values (12,'Dyana',55); 
insert into students values (13,'Jenny',66); 
insert into students values (14,'Christene',88); 
insert into students values (15,'Meera',24); 
insert into students values (16,'Priya',76); 
insert into students values (17,'Priyanka',77); 
insert into students values (18,'Paige',74); 
insert into students values (19,'Jane',64); 
insert into students values (21,'Belvet',78); 
insert into students values (31,'Scarlet',80); 
insert into students values (41,'Salma',81); 
insert into students values (51,'Amanda',34); 
insert into students values (61,'Heraldo',94); 
insert into students values (71,'Stuart',99); 
insert into students values (81,'Aamina',77); 
insert into students values (76,'Amina',89); 
insert into students values (91,'Vivek',84); 
insert into students values (17,'Evil',79); 
insert into students values (16,'Devil',76); 
insert into students values (34,'Fanny',75); 
insert into students values (38,'Danny',75);
COMMIT;

select name from students where marks>75 order by substr(name,-3,3);