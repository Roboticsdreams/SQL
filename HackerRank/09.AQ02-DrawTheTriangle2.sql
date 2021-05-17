/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).

*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE alternativequeries.proc_02drawtriangle2 AS
SELECT 
	REPLICATE('* ', ones.n + 10*tens.n) as STARS
FROM 
	(VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ones(n), 
	(VALUES(0),(1),(2),(3),(4),(5)) tens(n)
WHERE 
	ones.n + 10*tens.n BETWEEN 1 AND 20 
ORDER BY 
	ones.n + 10*tens.n;
GO

CREATE or ALTER PROCEDURE AlternativeQueriesTestClass.test_02drawtriangle2
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   STARS           varchar(40),
    );

    INSERT INTO actual (STARS) exec alternativequeries.proc_02drawtriangle2 ;

    CREATE TABLE expected (
	   STARS           varchar(40),
    );

	INSERT INTO expected (STARS) select '* ';
	INSERT INTO expected (STARS) select '* * ';
	INSERT INTO expected (STARS) select '* * * ';
	INSERT INTO expected (STARS) select '* * * * ';
	INSERT INTO expected (STARS) select '* * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * * * * * * ';
	INSERT INTO expected (STARS) select '* * * * * * * * * * * * * * * * * * * * ';

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'AlternativeQueriesTestClass.[test_02drawtriangle2]';

