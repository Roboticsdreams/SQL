/*
Weather Observation Station 7

Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

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

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_12wos07 AS
select 
	distinct(city)
from 
	basicselect.STATION
where 
	upper(RIGHT(city,1)) in ('A','E','I','O','U');
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_12wos07 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   CITY           varchar(21)
    );

    INSERT INTO actual (CITY) exec basicselect.proc_12wos07

    CREATE TABLE expected (
	   CITY           varchar(21)
    );

	INSERT INTO expected (CITY) select 'Acme'
	INSERT INTO expected (CITY) select 'Aguanga'
	INSERT INTO expected (CITY) select 'Alba'
	INSERT INTO expected (CITY) select 'Aliso Viejo'
	INSERT INTO expected (CITY) select 'Alpine'
	INSERT INTO expected (CITY) select 'Amazonia'
	INSERT INTO expected (CITY) select 'Amo'
	INSERT INTO expected (CITY) select 'Andersonville'
	INSERT INTO expected (CITY) select 'Archie'
	INSERT INTO expected (CITY) select 'Arispe'
	INSERT INTO expected (CITY) select 'Arkadelphia'
	INSERT INTO expected (CITY) select 'Atlantic Mine'
	INSERT INTO expected (CITY) select 'Baileyville'
	INSERT INTO expected (CITY) select 'Bainbridge'
	INSERT INTO expected (CITY) select 'Barrigada'
	INSERT INTO expected (CITY) select 'Baton Rouge'
	INSERT INTO expected (CITY) select 'Bayville'
	INSERT INTO expected (CITY) select 'Bellevue'
	INSERT INTO expected (CITY) select 'Bentonville'
	INSERT INTO expected (CITY) select 'Bertha'
	INSERT INTO expected (CITY) select 'Biggsville'
	INSERT INTO expected (CITY) select 'Bono'
	INSERT INTO expected (CITY) select 'Brownsdale'
	INSERT INTO expected (CITY) select 'Cahone'
	INSERT INTO expected (CITY) select 'Calpine'
	INSERT INTO expected (CITY) select 'Cape Girardeau'
	INSERT INTO expected (CITY) select 'Cascade'
	INSERT INTO expected (CITY) select 'Casco'
	INSERT INTO expected (CITY) select 'Caseville'
	INSERT INTO expected (CITY) select 'Chelsea'
	INSERT INTO expected (CITY) select 'Chilhowee'
	INSERT INTO expected (CITY) select 'Chokio'
	INSERT INTO expected (CITY) select 'Clarkdale'
	INSERT INTO expected (CITY) select 'Clio'
	INSERT INTO expected (CITY) select 'Corriganville'
	INSERT INTO expected (CITY) select 'Crane Lake'
	INSERT INTO expected (CITY) select 'Crouseville'
	INSERT INTO expected (CITY) select 'Cuba'
	INSERT INTO expected (CITY) select 'Curdsville'
	INSERT INTO expected (CITY) select 'Dale'
	INSERT INTO expected (CITY) select 'Daleville'
	INSERT INTO expected (CITY) select 'De Tour Village'
	INSERT INTO expected (CITY) select 'Delano'
	INSERT INTO expected (CITY) select 'Delta'
	INSERT INTO expected (CITY) select 'Dixie'
	INSERT INTO expected (CITY) select 'Dorrance'
	INSERT INTO expected (CITY) select 'Dundee'
	INSERT INTO expected (CITY) select 'Dupo'
	INSERT INTO expected (CITY) select 'East China'
	INSERT INTO expected (CITY) select 'East Irvine'
	INSERT INTO expected (CITY) select 'Eastlake'
	INSERT INTO expected (CITY) select 'Eleele'
	INSERT INTO expected (CITY) select 'Elm Grove'
	INSERT INTO expected (CITY) select 'Eriline'
	INSERT INTO expected (CITY) select 'Ermine'
	INSERT INTO expected (CITY) select 'Eskridge'
	INSERT INTO expected (CITY) select 'Eufaula'
	INSERT INTO expected (CITY) select 'Fort Meade'
	INSERT INTO expected (CITY) select 'Glencoe'
	INSERT INTO expected (CITY) select 'Gowrie'
	INSERT INTO expected (CITY) select 'Grand Terrace'
	INSERT INTO expected (CITY) select 'Grandville'
	INSERT INTO expected (CITY) select 'Grapevine'
	INSERT INTO expected (CITY) select 'Grayslake'
	INSERT INTO expected (CITY) select 'Greenville'
	INSERT INTO expected (CITY) select 'Gretna'
	INSERT INTO expected (CITY) select 'Grosse Pointe'
	INSERT INTO expected (CITY) select 'Gustine'
	INSERT INTO expected (CITY) select 'Hagatna'
	INSERT INTO expected (CITY) select 'Hayesville'
	INSERT INTO expected (CITY) select 'Hayneville'
	INSERT INTO expected (CITY) select 'Hesperia'
	INSERT INTO expected (CITY) select 'Hillside'
	INSERT INTO expected (CITY) select 'Honolulu'
	INSERT INTO expected (CITY) select 'Hope'
	INSERT INTO expected (CITY) select 'Hopkinsville'
	INSERT INTO expected (CITY) select 'Howard Lake'
	INSERT INTO expected (CITY) select 'Jerome'
	INSERT INTO expected (CITY) select 'Kanorado'
	INSERT INTO expected (CITY) select 'Kirksville'
	INSERT INTO expected (CITY) select 'Lakeville'
	INSERT INTO expected (CITY) select 'Lakota'
	INSERT INTO expected (CITY) select 'Leakesville'
	INSERT INTO expected (CITY) select 'Lee'
	INSERT INTO expected (CITY) select 'Lena'
	INSERT INTO expected (CITY) select 'Lismore'
	INSERT INTO expected (CITY) select 'Losantville'
	INSERT INTO expected (CITY) select 'Lottie'
	INSERT INTO expected (CITY) select 'Lydia'
	INSERT INTO expected (CITY) select 'Lynnville'
	INSERT INTO expected (CITY) select 'Madisonville'
	INSERT INTO expected (CITY) select 'Magnolia'
	INSERT INTO expected (CITY) select 'Marysville'
	INSERT INTO expected (CITY) select 'Mascotte'
	INSERT INTO expected (CITY) select 'Mid Florida'
	INSERT INTO expected (CITY) select 'Middleboro'
	INSERT INTO expected (CITY) select 'Milledgeville'
	INSERT INTO expected (CITY) select 'Millville'
	INSERT INTO expected (CITY) select 'Monona'
	INSERT INTO expected (CITY) select 'Monroe'
	INSERT INTO expected (CITY) select 'Montrose'
	INSERT INTO expected (CITY) select 'Morenci'
	INSERT INTO expected (CITY) select 'Mosca'
	INSERT INTO expected (CITY) select 'Netawaka'
	INSERT INTO expected (CITY) select 'Notasulga'
	INSERT INTO expected (CITY) select 'Oconee'
	INSERT INTO expected (CITY) select 'Ojai'
	INSERT INTO expected (CITY) select 'Osborne'
	INSERT INTO expected (CITY) select 'Oshtemo'
	INSERT INTO expected (CITY) select 'Ozona'
	INSERT INTO expected (CITY) select 'Palatka'
	INSERT INTO expected (CITY) select 'Pawnee'
	INSERT INTO expected (CITY) select 'Pelahatchie'
	INSERT INTO expected (CITY) select 'Pheba'
	INSERT INTO expected (CITY) select 'Pico Rivera'
	INSERT INTO expected (CITY) select 'Pleasant Grove'
	INSERT INTO expected (CITY) select 'Pomona'
	INSERT INTO expected (CITY) select 'Ravenna'
	INSERT INTO expected (CITY) select 'Raymondville'
	INSERT INTO expected (CITY) select 'Regina'
	INSERT INTO expected (CITY) select 'Renville'
	INSERT INTO expected (CITY) select 'Rio Oso'
	INSERT INTO expected (CITY) select 'Robertsdale'
	INSERT INTO expected (CITY) select 'Rosie'
	INSERT INTO expected (CITY) select 'Saint Elmo'
	INSERT INTO expected (CITY) select 'Samantha'
	INSERT INTO expected (CITY) select 'Shasta'
	INSERT INTO expected (CITY) select 'Skanee'
	INSERT INTO expected (CITY) select 'South El Monte'
	INSERT INTO expected (CITY) select 'Springerville'
	INSERT INTO expected (CITY) select 'Susanville'
	INSERT INTO expected (CITY) select 'Tarzana'
	INSERT INTO expected (CITY) select 'Tennessee'
	INSERT INTO expected (CITY) select 'Tina'
	INSERT INTO expected (CITY) select 'Upperco'
	INSERT INTO expected (CITY) select 'Urbana'
	INSERT INTO expected (CITY) select 'Verona'
	INSERT INTO expected (CITY) select 'Waipahu'
	INSERT INTO expected (CITY) select 'Waresboro'
	INSERT INTO expected (CITY) select 'Weldona'
	INSERT INTO expected (CITY) select 'West Grove'
	INSERT INTO expected (CITY) select 'Westphalia'
	INSERT INTO expected (CITY) select 'Wickliffe'
	INSERT INTO expected (CITY) select 'Wildie'
	INSERT INTO expected (CITY) select 'Woodsboro'
	INSERT INTO expected (CITY) select 'Yalaha'
	INSERT INTO expected (CITY) select 'Yellow Pine'
	INSERT INTO expected (CITY) select 'Yellville'
	INSERT INTO expected (CITY) select 'Yuma'
	INSERT INTO expected (CITY) select 'Zionsville'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_12wos07]';