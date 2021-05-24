/*
Employee Names

Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Input Format

The Employee table containing employee data for a company is described as follows:

+-------------+---------+
|   COLUMN    |  TYPE   |
+-------------+---------+
| employee_id | Integer |
| name        | String  |
| months      | Integer |
| salary      | Integer |
+-------------+---------+

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Sample Input

+-------------+-----------+--------+---------+
| employee_id |   name    | months | salary  |
+-------------+-----------+--------+---------+
|      12228  | Rose      |    15  |   1968  |
|      33645  | Angela    |     1  |   3443  |
|      45692  | Frank     |    17  |   1608  |
|      56118  | Patrick   |     7  |    1345 |
|      59725  | Lisa      |    11  |   2330  |
|      74197  | Kimberly  |    16  |   4372  |
|      78454  | Bonnie    |     8  |   1771  |
|      83685  | Michael   |     8  |   2017  |
|      98807  | Todd      |     5  |    3396 |
|      99989  | Joe       |     9  |    3573 |
+-------------+-----------+--------+---------+

Sample Output

Angela
Bonnie
Frank
Joe
Kimberly
Lisa
Michael
Patrick
Rose
Todd
*/

use hackerrank;

GO

raiserror('Create procedure for Basicselect.Proc_19EmployeeNames...',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_19employeenames AS
select 
	name
from
	basicselect.EMPLOYEE
order by 
	name;
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_19employeenames  AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   NAME    varchar(21)
    );

    INSERT INTO actual (NAME) exec basicselect.proc_19employeenames

    CREATE TABLE expected (
	   NAME     varchar(21)
    );

	INSERT INTO expected (NAME) select 'Alan'
	INSERT INTO expected (NAME) select 'Amy'
	INSERT INTO expected (NAME) select 'Andrew'
	INSERT INTO expected (NAME) select 'Andrew'
	INSERT INTO expected (NAME) select 'Angela'
	INSERT INTO expected (NAME) select 'Ann'
	INSERT INTO expected (NAME) select 'Anna'
	INSERT INTO expected (NAME) select 'Anthony'
	INSERT INTO expected (NAME) select 'Antonio'
	INSERT INTO expected (NAME) select 'Benjamin'
	INSERT INTO expected (NAME) select 'Bonnie'
	INSERT INTO expected (NAME) select 'Brandon'
	INSERT INTO expected (NAME) select 'Brandon'
	INSERT INTO expected (NAME) select 'Brian'
	INSERT INTO expected (NAME) select 'Carol'
	INSERT INTO expected (NAME) select 'Charles'
	INSERT INTO expected (NAME) select 'Christina'
	INSERT INTO expected (NAME) select 'Christina'
	INSERT INTO expected (NAME) select 'Christine'
	INSERT INTO expected (NAME) select 'Christine'
	INSERT INTO expected (NAME) select 'David'
	INSERT INTO expected (NAME) select 'David'
	INSERT INTO expected (NAME) select 'David'
	INSERT INTO expected (NAME) select 'Debra'
	INSERT INTO expected (NAME) select 'Diana'
	INSERT INTO expected (NAME) select 'Diana'
	INSERT INTO expected (NAME) select 'Donna'
	INSERT INTO expected (NAME) select 'Dorothy'
	INSERT INTO expected (NAME) select 'Dorothy'
	INSERT INTO expected (NAME) select 'Dorothy'
	INSERT INTO expected (NAME) select 'Earl'
	INSERT INTO expected (NAME) select 'Elizabeth'
	INSERT INTO expected (NAME) select 'Emily'
	INSERT INTO expected (NAME) select 'Evelyn'
	INSERT INTO expected (NAME) select 'Evelyn'
	INSERT INTO expected (NAME) select 'Frank'
	INSERT INTO expected (NAME) select 'Gerald'
	INSERT INTO expected (NAME) select 'Gloria'
	INSERT INTO expected (NAME) select 'Gregory'
	INSERT INTO expected (NAME) select 'Harry'
	INSERT INTO expected (NAME) select 'Jacqueline'
	INSERT INTO expected (NAME) select 'James'
	INSERT INTO expected (NAME) select 'James'
	INSERT INTO expected (NAME) select 'Jean'
	INSERT INTO expected (NAME) select 'Jennifer'
	INSERT INTO expected (NAME) select 'Jesse'
	INSERT INTO expected (NAME) select 'Jesse'
	INSERT INTO expected (NAME) select 'Joe'
	INSERT INTO expected (NAME) select 'Joe'
	INSERT INTO expected (NAME) select 'John'
	INSERT INTO expected (NAME) select 'John'
	INSERT INTO expected (NAME) select 'Jonathan'
	INSERT INTO expected (NAME) select 'Joseph'
	INSERT INTO expected (NAME) select 'Joyce'
	INSERT INTO expected (NAME) select 'Joyce'
	INSERT INTO expected (NAME) select 'Julia'
	INSERT INTO expected (NAME) select 'Keith'
	INSERT INTO expected (NAME) select 'Kelly'
	INSERT INTO expected (NAME) select 'Kevin'
	INSERT INTO expected (NAME) select 'Kimberly'
	INSERT INTO expected (NAME) select 'Kimberly'
	INSERT INTO expected (NAME) select 'Lawrence'
	INSERT INTO expected (NAME) select 'Lillian'
	INSERT INTO expected (NAME) select 'Linda'
	INSERT INTO expected (NAME) select 'Lisa'
	INSERT INTO expected (NAME) select 'Lori'
	INSERT INTO expected (NAME) select 'Louise'
	INSERT INTO expected (NAME) select 'Maria'
	INSERT INTO expected (NAME) select 'Marilyn'
	INSERT INTO expected (NAME) select 'Marilyn'
	INSERT INTO expected (NAME) select 'Marilyn'
	INSERT INTO expected (NAME) select 'Martha'
	INSERT INTO expected (NAME) select 'Martin'
	INSERT INTO expected (NAME) select 'Matthew'
	INSERT INTO expected (NAME) select 'Melissa'
	INSERT INTO expected (NAME) select 'Michael'
	INSERT INTO expected (NAME) select 'Michelle'
	INSERT INTO expected (NAME) select 'Nancy'
	INSERT INTO expected (NAME) select 'Norma'
	INSERT INTO expected (NAME) select 'Pamela'
	INSERT INTO expected (NAME) select 'Patricia'
	INSERT INTO expected (NAME) select 'Patrick'
	INSERT INTO expected (NAME) select 'Paul'
	INSERT INTO expected (NAME) select 'Paul'
	INSERT INTO expected (NAME) select 'Paula'
	INSERT INTO expected (NAME) select 'Paula'
	INSERT INTO expected (NAME) select 'Phillip'
	INSERT INTO expected (NAME) select 'Ralph'
	INSERT INTO expected (NAME) select 'Robert'
	INSERT INTO expected (NAME) select 'Robin'
	INSERT INTO expected (NAME) select 'Robin'
	INSERT INTO expected (NAME) select 'Rose'
	INSERT INTO expected (NAME) select 'Roy'
	INSERT INTO expected (NAME) select 'Stephanie'
	INSERT INTO expected (NAME) select 'Tammy'
	INSERT INTO expected (NAME) select 'Timothy'
	INSERT INTO expected (NAME) select 'Todd'
	INSERT INTO expected (NAME) select 'Victor'
	INSERT INTO expected (NAME) select 'Walter'
	INSERT INTO expected (NAME) select 'Willie'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_19employeenames]';