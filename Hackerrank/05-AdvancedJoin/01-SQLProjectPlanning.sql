You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

+------------+---------+
|   Column   |  Type   |
+------------+---------+
| Task_ID    | Integer |
| Start_Date | Date    |
| End_Date   | Date    |
+------------+---------+


If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

Sample Input

+---------+------------+------------+
| Task_ID | Start_Date |  End_Date  |
+---------+------------+------------+
|       1 | 2015-10-01 | 2015-10-02 |
|       2 | 2015-10-02 | 2015-10-03 |
|       3 | 2015-10-03 | 2015-10-04 |
|       4 | 2015-10-13 | 2015-10-14 |
|       5 | 2015-10-14 | 2015-10-15 |
|       6 | 2015-10-28 | 2015-10-29 |
|       7 | 2015-10-30 | 2015-10-31 |
+---------+------------+------------+

Sample Output

2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04


Explanation

The example describes following four projects:

Project 1: Tasks 1, 2 and 3 are completed on consecutive days, so these are part of the project. Thus start date of project is 2015-10-01 and end date is 2015-10-04, so it took 3 days to complete the project.
Project 2: Tasks 4 and 5 are completed on consecutive days, so these are part of the project. Thus, the start date of project is 2015-10-13 and end date is 2015-10-15, so it took 2 days to complete the project.
Project 3: Only task 6 is part of the project. Thus, the start date of project is 2015-10-28 and end date is 2015-10-29, so it took 1 day to complete the project.
Project 4: Only task 7 is part of the project. Thus, the start date of project is 2015-10-30 and end date is 2015-10-31, so it took 1 day to complete the project.


WITH ProjectList AS 
(
	SELECT 
		ROW_NUMBER() OVER (ORDER BY Start_Date) 'Row',
		Start_Date
	FROM 
		Projects
	GROUP BY 
		Start_Date
)
SELECT MIN(Start_Date), DATEADD(DAY, 1, MAX(Start_Date))
FROM ProjectList 
GROUP BY 
	DATEDIFF(DAY, Row, Start_Date)
ORDER BY 
	DATEDIFF(DAY, MIN(Start_Date), MAX(Start_Date)), MIN(Start_Date)



+----------+------------+------------+
| Task_ID  | Start_Date |  End_Date  |
+----------+------------+------------+
|        1 | 2015-10-01 | 2015-10-02 |
|        2 | 2015-10-03 | 2015-10-04 |
|        3 | 2015-10-11 | 2015-10-12 |
|        4 | 2015-10-15 | 2015-10-16 |
|        5 | 2015-10-19 | 2015-10-20 |
|        6 | 2015-10-25 | 2015-10-26 |
|        7 | 2015-10-27 | 2015-10-28 |
|        8 | 2015-10-29 | 2015-10-30 |
|        9 | 2015-11-01 | 2015-11-02 |
|       10 | 2015-11-07 | 2015-11-08 |
|       11 | 2015-11-05 | 2015-11-06 |
|       12 | 2015-11-12 | 2015-11-13 |
|       13 | 2015-11-17 | 2015-11-18 |
|       14 | 2015-11-11 | 2015-11-12 |
|       15 | 2015-11-06 | 2015-11-07 |
|       16 | 2015-11-04 | 2015-11-05 |
|       17 | 2015-10-30 | 2015-10-31 |
|       18 | 2015-10-28 | 2015-10-29 |
|       19 | 2015-10-26 | 2015-10-27 |
|       20 | 2015-10-21 | 2015-10-22 |
|       21 | 2015-10-17 | 2015-10-18 |
|       22 | 2015-10-12 | 2015-10-13 |
|       23 | 2015-10-04 | 2015-10-05 |
|       24 | 2015-10-02 | 2015-10-03 |
+----------+------------+------------+


2015-10-15 2015-10-16
2015-10-17 2015-10-18
2015-10-19 2015-10-20
2015-10-21 2015-10-22
2015-11-01 2015-11-02
2015-11-17 2015-11-18
2015-10-11 2015-10-13
2015-11-11 2015-11-13
2015-10-01 2015-10-05
2015-11-04 2015-11-08
2015-10-25 2015-10-31