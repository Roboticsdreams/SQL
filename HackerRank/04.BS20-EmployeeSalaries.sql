/*
Employee Salaries

Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

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

use hackerrank;

GO

raiserror('Create procedure for Basicselect.Proc_20EmployeeSalaries...',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_20employeesalaries AS
select 
	name
from
	basicselect.EMPLOYEE
where
	salary > 2000 and 
	months < 10
order by 
	name;
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_20employeesalaries  AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   NAME    varchar(21)
    );

    INSERT INTO actual (NAME) exec basicselect.proc_20employeesalaries

    CREATE TABLE expected (
	   NAME     varchar(21)
    );

	INSERT INTO expected (NAME) select 'Amy'
	INSERT INTO expected (NAME) select 'Benjamin'
	INSERT INTO expected (NAME) select 'Brandon'
	INSERT INTO expected (NAME) select 'Christina'
	INSERT INTO expected (NAME) select 'Christine'
	INSERT INTO expected (NAME) select 'Diana'
	INSERT INTO expected (NAME) select 'Donna'
	INSERT INTO expected (NAME) select 'Emily'
	INSERT INTO expected (NAME) select 'Evelyn'
	INSERT INTO expected (NAME) select 'Jennifer'
	INSERT INTO expected (NAME) select 'Jesse'
	INSERT INTO expected (NAME) select 'Jonathan'
	INSERT INTO expected (NAME) select 'Joseph'
	INSERT INTO expected (NAME) select 'Julia'
	INSERT INTO expected (NAME) select 'Kevin'
	INSERT INTO expected (NAME) select 'Lisa'
	INSERT INTO expected (NAME) select 'Louise'
	INSERT INTO expected (NAME) select 'Michelle'
	INSERT INTO expected (NAME) select 'Nancy'
	INSERT INTO expected (NAME) select 'Pamela'
	INSERT INTO expected (NAME) select 'Patrick'
	INSERT INTO expected (NAME) select 'Paul'
	INSERT INTO expected (NAME) select 'Paula'
	INSERT INTO expected (NAME) select 'Rose'
	INSERT INTO expected (NAME) select 'Roy'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_20employeesalaries]';