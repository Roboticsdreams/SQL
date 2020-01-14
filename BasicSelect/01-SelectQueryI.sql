/*
Revising the Select Query I

Query all the columns for all American cities in CITY with populations larger than 100000. The Country Code for America is USA.

Input Format:

The CITY table is described as follows:

FILEDS			TYPE
ID				NUMBER
NAME			VARCHAR2(17)
COUNRTYCODE		VARCHAR2(3)
DISTRICT		VARCHAR2(20)
POPULATION		NUMBER

*/

BEGIN TRANSACTION;

/* Create a table called CITY */
CREATE TABLE CITY(ID NUMBER, NAME VARCHAR2(17), COUNRTYCODE	VARCHAR2(3),DISTRICT VARCHAR2(20),POPULATION NUMBER);

/* Create few records in this table */
INSERT INTO CITY VALUES(6,'Rotterdam','NLD','Zuid-Holland',593321); 
INSERT INTO CITY VALUES(3878,'Scottsdale','USA','Arizona',202705);
INSERT INTO CITY VALUES(3965,'Corona','USA','California',124966);
INSERT INTO CITY VALUES(3973,'Concord','USA','California',121780);
INSERT INTO CITY VALUES(3977,'Cedar Rapids','USA','Iowa',120758);
INSERT INTO CITY VALUES(3982,'Coral Springs','USA','Florida',117549);
INSERT INTO CITY VALUES(4054,'Fairfield','USA','California',92256);
INSERT INTO CITY VALUES(4058,'Boulder','USA','Colorado',91238);
INSERT INTO CITY VALUES(4061,'Fall River','USA','Massachusetts',90555);
COMMIT;

/* Display all the records from the table */
SELECT * FROM CITY WHERE POPULATION > 100000 and COUNRTYCODE = 'USA';