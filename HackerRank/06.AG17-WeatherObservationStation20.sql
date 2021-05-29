/*
Weather Observation Station 20

A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

+--------+--------------+
| FILEDS |     TYPE     |
+--------+--------------+
| ID     | NUMBER       |
| CITY   | VARCHAR2(21) |
| STATE  | VARCHAR2(2)  |
| LAT_N  | NUMBER       |
| LONG_W | NUMBER       |
+--------+--------------+

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

use hackerrank;

GO

raiserror('Now at aggregation.proc_17wos20 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE aggregation.proc_17wos20 (@OutParams NUMERIC(20,4) OUT)
AS
SELECT 
	@OutParams = CAST( AVG(1.0 * LAT_N) AS NUMERIC(20,4))
FROM
	(
	   SELECT LAT_N, 
		  ra = ROW_NUMBER() OVER (ORDER BY LAT_N, id),
		  rd = ROW_NUMBER() OVER (ORDER BY LAT_N DESC, id DESC)
	   FROM aggregation.STATION
	) AS x
WHERE 
	ra BETWEEN rd - 1 AND rd + 1;
GO

raiserror('Now at AggregationTestClass.test_17wos20 creation ....',0,1)

GO

CREATE or ALTER PROCEDURE AggregationTestClass.test_17wos20
AS
BEGIN
    DECLARE @expected NUMERIC(20,4);
    DECLARE @actual NUMERIC(20,4);
	exec aggregation.proc_17wos20 @actual OUT
	SET @expected = 83.8913;

    EXEC tSQLt.assertEquals @expected, @actual;
END;

GO

--exec tSQLt.Run 'AggregationTestClass.[test_17wos20]';