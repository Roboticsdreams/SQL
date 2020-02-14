/*
Employee Salaries

Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

Input Format

The Employee table containing employee data for a company is described as follows:

COLUMN			TYPE
employee_id		Integer
name			String
months			Integer
salary			Integer

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Sample Input

employee_id 	name 	months 	salary 
12228 			Rose	 15 	1968 
33645			Angela 	 1 		3443 
45692 			Frank 	 17 	1608 
56118			Patrick	 7 		1345
59725		 	Lisa 	 11 	2330 
74197 			Kimberly 16 	4372 
78454 			Bonnie 	 8 		1771 
83685 			Michael  8 		2017 
98807 			Todd	 5 		3396
99989			Joe		 9 		3573

Sample Output

Angela
Michael
Todd
Joe
Explanation

Angela has been an employee for 1 month and earns $3443 per month.

Michael has been an employee for 6 months and earns $2017 per month.

Todd has been an employee for 5 months and earns $3396 per month.

Joe has been an employee for 9 months and earns $3573 per month.

We order our output by ascending employee_id.
*/


/* Create a table called STUDENTS */
CREATE TABLE Employee(
ID 		NUMBER, 
NAME 	VARCHAR2(21),
MONTHS 	NUMBER,
SALARY 	NUMBER);

/*select 'insert into Employee values (' ||employee_id ||','''||name||''','||months||','||salary||');' from Employee;*/

/* Create few records in this table */
insert into Employee values (330,'Rose',5,2248); 
insert into Employee values (1233,'Angela',7,1296); 
insert into Employee values (1901,'Frank',10,2763); 
insert into Employee values (2035,'Patrick',1,4583); 
insert into Employee values (2405,'Lisa',7,4350); 
insert into Employee values (2974,'Kimberly',11,2874); 
insert into Employee values (3190,'Bonnie',11,3758); 
insert into Employee values (3506,'Michael',9,1936); 
insert into Employee values (3708,'Todd',22,4046); 
insert into Employee values (4428,'Joe',22,3802); 
insert into Employee values (5962,'Earl',11,2958); 
insert into Employee values (6060,'Robert',22,4128); 
insert into Employee values (6418,'Amy',2,4832); 
insert into Employee values (7466,'Pamela',1,4199); 
insert into Employee values (9102,'Maria',11,2958); 
insert into Employee values (11863,'Joe',18,1721); 
insert into Employee values (12004,'Linda',15,2306); 
insert into Employee values (12387,'Melissa',20,1854); 
insert into Employee values (13835,'Carol',20,4340); 
insert into Employee values (15151,'Paula',15,1526); 
insert into Employee values (15286,'Marilyn',10,3087); 
insert into Employee values (15675,'Jennifer',2,2336); 
insert into Employee values (16493,'Harry',14,4755); 
insert into Employee values (17858,'David',13,3658); 
insert into Employee values (19035,'Julia',4,2195); 
insert into Employee values (19172,'Kevin',1,2113); 
insert into Employee values (21638,'Paul',6,3120); 
insert into Employee values (22684,'James',14,1370); 
insert into Employee values (23621,'Kelly',7,1923); 
insert into Employee values (24011,'Robin',22,1880); 
insert into Employee values (24611,'Ralph',22,1495); 
insert into Employee values (25109,'Gloria',2,1979); 
insert into Employee values (25120,'Victor',20,1557); 
insert into Employee values (28247,'David',23,2212); 
insert into Employee values (30183,'Joyce',20,2748); 
insert into Employee values (30712,'Donna',8,2604); 
insert into Employee values (32502,'Michelle',1,2086); 
insert into Employee values (32654,'Stephanie',17,1444); 
insert into Employee values (33086,'Gerald',23,2206); 
insert into Employee values (33132,'Walter',11,4180); 
insert into Employee values (37008,'Christina',8,3100); 
insert into Employee values (38246,'Brandon',3,4339); 
insert into Employee values (38272,'Elizabeth',23,3967); 
insert into Employee values (38964,'Joseph',4,2194); 
insert into Employee values (39789,'Lawrence',9,1872); 
insert into Employee values (40797,'Marilyn',15,2112); 
insert into Employee values (41228,'Lori',13,4350); 
insert into Employee values (44436,'Matthew',15,4673); 
insert into Employee values (45285,'Jesse',1,3768); 
insert into Employee values (47458,'John',13,3104); 
insert into Employee values (47496,'Martha',15,4020); 
insert into Employee values (47920,'Timothy',10,1745); 
insert into Employee values (48129,'Christine',22,3738); 
insert into Employee values (50664,'Anthony',22,4912); 
insert into Employee values (51741,'Paula',1,2492); 
insert into Employee values (52923,'Kimberly',17,1955); 
insert into Employee values (55238,'Louise',1,2717); 
insert into Employee values (56775,'Martin',16,1385); 
insert into Employee values (57065,'Paul',23,3379); 
insert into Employee values (58343,'Antonio',21,3268); 
insert into Employee values (59256,'Jacqueline',14,3913); 
insert into Employee values (60119,'Diana',13,5149); 
insert into Employee values (61191,'John',5,1775); 
insert into Employee values (65288,'Dorothy',22,3792); 
insert into Employee values (65375,'Evelyn',6,4079); 
insert into Employee values (66442,'Phillip',9,1894); 
insert into Employee values (67137,'Evelyn',15,1311); 
insert into Employee values (68942,'Debra',20,3704); 
insert into Employee values (69085,'David',11,1845); 
insert into Employee values (69234,'Willie',12,5088); 
insert into Employee values (69475,'Brandon',19,2279); 
insert into Employee values (69787,'Ann',9,1311); 
insert into Employee values (70963,'Emily',8,5247); 
insert into Employee values (71569,'Dorothy',22,4088); 
insert into Employee values (72030,'Jonathan',4,5009); 
insert into Employee values (72370,'Dorothy',18,3174); 
insert into Employee values (72785,'Marilyn',1,1860); 
insert into Employee values (72974,'Norma',21,1558); 
insert into Employee values (74662,'Nancy',6,3223); 
insert into Employee values (76876,'Andrew',11,1746); 
insert into Employee values (77609,'Keith',2,1219); 
insert into Employee values (78101,'Benjamin',7,4414); 
insert into Employee values (79744,'Charles',11,1911); 
insert into Employee values (80475,'Alan',16,1853); 
insert into Employee values (80895,'Tammy',8,1591); 
insert into Employee values (81381,'Anna',16,1569); 
insert into Employee values (82828,'James',23,4398); 
insert into Employee values (85287,'Robin',23,2078); 
insert into Employee values (87170,'Jean',18,3895); 
insert into Employee values (87355,'Andrew',15,1446); 
insert into Employee values (89017,'Roy',8,3443); 
insert into Employee values (90507,'Diana',9,5101); 
insert into Employee values (90558,'Christina',23,3498); 
insert into Employee values (92908,'Jesse',13,4753); 
insert into Employee values (95322,'Joyce',18,1577); 
insert into Employee values (95983,'Patricia',23,1469); 
insert into Employee values (96963,'Gregory',16,5071); 
insert into Employee values (97178,'Brian',19,3144); 
insert into Employee values (98271,'Christine',3,3796); 
insert into Employee values (98491,'Lillian',3,1920); 

select name from employee where salary > 2000 and months < 10;