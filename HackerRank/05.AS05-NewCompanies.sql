/*
New Companies

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

Founder -> Lead Manager -> Senior Manager -> Manager -> Employee

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric.
For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

Input Format

The following tables contain company data:

Company: The company_code is the code of the company and founder is the founder of the company. 

+--------------+--------+
|    COLUMN    |  TYPE  |
+--------------+--------+
| company_code | String |
| founder      | String |
+--------------+--------+

Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company. 

+-------------------+--------+
|      COLUMN       |  TYPE  |
+-------------------+--------+
| lead_manager_code | String |
| company_code      | String |
+-------------------+--------+
	
Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

+----------------------+--------+
|        COLUMN        |  TYPE  |
+----------------------+--------+
| senior_manager_code  | String |
| lead_manager_code    | String |
| company_code         | String |
+----------------------+--------+
	
Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

+----------------------+--------+
|        COLUMN        |  TYPE  |
+----------------------+--------+
| manager_code         | String |
| senior_manager_code  | String |
| lead_manager_code    | String |
| company_code         | String |
+----------------------+--------+

Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

+----------------------+--------+
|        COLUMN        |  TYPE  |
+----------------------+--------+
| employee_code        | String |
| manager_code         | String |
| senior_manager_code  | String |
| lead_manager_code    | String |
| company_code         | String |
+----------------------+--------+

Sample Input

Company Table:
+---------------+----------+
| company_code  | founder  |
+---------------+----------+
| C1            | Monika   |
| C2            | Samantha |
+---------------+----------+

Lead_Manager Table:  
+-------------------+--------------+
| lead_manager_code | company_code |
+-------------------+--------------+
| LM1               | C1           |
| LM2               | C2           |
+-------------------+--------------+

Senior_Manager Table:  
+----------------------+--------------------+--------------+
| senior_manager_code  | lead_manager_code  | company_code |
+----------------------+--------------------+--------------+
| SM1                  | LM1                | C1           |
| SM2                  | LM1                | C1           |
| SM3                  | LM2                | C2           |
+----------------------+--------------------+--------------+
	
Manager Table:  
+---------------+----------------------+--------------------+--------------+
| manager_code  | senior_manager_code  | lead_manager_code  | company_code |
+---------------+----------------------+--------------------+--------------+
| M1            | SM1                  | LM1                | C1           |
| M2            | SM3                  | LM2                | C2           |
| M3            | SM3                  | LM2                | C2           |
+---------------+----------------------+--------------------+--------------+
	
Employee Table: 
+----------------+---------------+----------------------+--------------------+--------------+
| employee_code  | manager_code  | senior_manager_code  | lead_manager_code  | company_code |
+----------------+---------------+----------------------+--------------------+--------------+
| E1             | M1            | SM1                  | LM1                | C1           |
| E2             | M1            | SM1                  | LM1                | C1           |
| E3             | M2            | SM3                  | LM2                | C2           |
| E4             | M3            | SM3                  | LM2                | C2           |
+----------------+---------------+----------------------+--------------------+--------------+

Sample Output

+----+----------+---+---+---+---+
| C1 |  Monika  | 1 | 2 | 1 | 2 |
| C2 | Samantha | 1 | 1 | 2 | 2 |
+----+----------+---+---+---+---+

Explanation

In company C1, the only lead manager is LM1. 
There are two senior managers, SM1 and SM2, under LM1. 
There is one manager, M1, under senior manager SM1. 
There are two employees, E1 and E2, under manager M1.

In company C2, the only lead manager is LM2. 
There is one senior manager, SM3, under LM2. 
There are two managers, M2 and M3, under senior manager SM3. 
There is one employee, E3, under manager M2, and another employee, E4, under manager, M3.
*/

use hackerrank;

GO

raiserror('Now at the create procedure 2.5 New Companies....',0,1)

GO

CREATE or ALTER PROCEDURE advancedselect.proc_05newcompaines AS
SELECT 
	c.company_code as company_code,
	c.founder as founder,
    COUNT(DISTINCT l.lead_manager_code) as LM_COUNT, 
	COUNT(DISTINCT s.senior_manager_code) as SM_COUNT,
	COUNT(DISTINCT m.manager_code) as MG_COUNT,
	COUNT(DISTINCT e.employee_code) as EMP_COUNT
FROM 
	advancedselect.COMPANY c, 
	advancedselect.LEAD_MANAGER l, 
	advancedselect.SENIOR_MANAGER s, 
	advancedselect.MANAGER m, 
	advancedselect.EMPLOYEE e
WHERE c.company_code = l.company_code AND 
      l.lead_manager_code = s.lead_manager_code AND
      s.senior_manager_code = m.senior_manager_code AND
      m.manager_code = e.manager_code
GROUP BY 
	c.company_code, 
	c.founder 
ORDER BY 
	c.company_code;
GO

CREATE or ALTER PROCEDURE AdvancedSelectTestClass.test_05newcompaines
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
		company_code		varchar(25) 	NOT NULL,
		founder 			varchar(25)		NOT NULL,
		LM_count			int				NULL,
		SM_count			int				NULL,
		MG_count			int				NULL,
		EMP_count			int				NULL
    );

    INSERT INTO actual (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) exec advancedselect.proc_05newcompaines

    CREATE TABLE expected (
		company_code		varchar(25) 	NOT NULL,
		founder 			varchar(25)		NOT NULL,
		LM_count			int				NULL,
		SM_count			int				NULL,
		MG_count			int				NULL,
		EMP_count			int				NULL
    );

	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C1','Angela',1,2,5,13
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C10','Earl',1,1,2,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C100','Aaron',1,2,4,10
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C11','Robert',1,1,1,1
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C12','Amy',1,2,6,14
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C13','Pamela',1,2,5,14
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C14','Maria',1,1,3,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C15','Joe',1,1,2,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C16','Linda',1,1,3,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C17','Melissa',1,2,3,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C18','Carol',1,2,5,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C19','Paula',1,2,4,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C2','Frank',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C20','Marilyn',1,1,2,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C21','Jennifer',1,1,3,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C22','Harry',1,1,3,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C23','David',1,1,1,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C24','Julia',1,1,2,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C25','Kevin',1,1,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C26','Paul',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C27','James',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C28','Kelly',1,2,5,9
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C29','Robin',1,2,4,9
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C3','Patrick',1,2,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C30','Ralph',1,1,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C31','Gloria',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C32','Victor',1,2,4,8
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C33','David',1,2,5,12
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C34','Joyce',1,2,6,10
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C35','Donna',1,2,6,12
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C36','Michelle',1,2,5,11
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C37','Stephanie',1,1,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C38','Gerald',1,2,4,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C39','Walter',1,1,3,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C4','Lisa',1,1,1,1
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C40','Christina',1,1,3,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C41','Brandon',1,2,3,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C42','Elizabeth',1,2,4,8
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C43','Joseph',1,2,4,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C44','Lawrence',1,1,3,4
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C45','Marilyn',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C46','Lori',1,2,3,9
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C47','Matthew',1,2,3,4
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C48','Jesse',1,1,3,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C49','John',1,1,3,8
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C5','Kimberly',1,2,3,9
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C50','Martha',1,1,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C51','Timothy',1,2,5,12
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C52','Christine',1,1,2,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C53','Anthony',1,1,1,1
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C54','Paula',1,2,4,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C55','Kimberly',1,2,2,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C56','Louise',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C57','Martin',1,1,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C58','Paul',1,2,4,8
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C59','Antonio',1,1,2,4
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C6','Bonnie',1,1,2,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C60','Jacqueline',1,1,1,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C61','Diana',1,1,1,1
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C62','John',1,2,5,11
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C63','Dorothy',1,2,5,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C64','Evelyn',1,1,1,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C65','Phillip',1,2,4,8
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C66','Evelyn',1,2,4,11
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C67','Debra',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C68','David',1,2,5,9
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C69','Willie',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C7','Michael',1,1,1,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C70','Brandon',1,2,4,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C71','Ann',1,2,5,10
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C72','Emily',1,2,3,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C73','Dorothy',1,1,1,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C74','Jonathan',1,2,4,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C75','Dorothy',1,1,2,4
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C76','Marilyn',1,2,5,12
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C77','Norma',1,2,5,10
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C78','Nancy',1,2,3,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C79','Andrew',1,1,2,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C8','Todd',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C80','Keith',1,1,1,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C81','Benjamin',1,1,3,9
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C82','Charles',1,1,2,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C83','Alan',1,2,3,4
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C84','Tammy',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C85','Anna',1,2,4,8
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C86','James',1,1,3,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C87','Robin',1,2,3,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C88','Jean',1,1,2,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C89','Andrew',1,2,4,7
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C9','Joe',1,1,3,6
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C90','Roy',1,1,2,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C91','Diana',1,2,2,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C92','Christina',1,1,1,3
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C93','Jesse',1,1,2,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C94','Joyce',1,2,5,13
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C95','Patricia',1,1,3,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C96','Gregory',1,1,2,2
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C97','Brian',1,1,1,1
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C98','Christine',1,1,2,5
	INSERT INTO expected (COMPANY_CODE, FOUNDER, LM_COUNT, SM_COUNT, MG_COUNT, EMP_COUNT) SELECT 'C99','Lillian',1,1,2,6

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AdvancedSelectTestClass.[test_05newcompaines]';

