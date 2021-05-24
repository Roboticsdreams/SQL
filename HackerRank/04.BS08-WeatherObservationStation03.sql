/*
Weather Observation Station 3

Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.

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

CREATE or ALTER PROCEDURE basicselect.proc_08wos03 AS
select 
	DISTINCT CITY 
from 
	basicselect.STATION 
where 
	(ID % 2) = 0;
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_08wos03 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   CITY           varchar(21)
    );

    INSERT INTO actual (CITY) exec basicselect.proc_08wos03

    CREATE TABLE expected (
	   CITY           varchar(21)
    );
	INSERT INTO expected (CITY) select 'Aguanga'
	INSERT INTO expected (CITY) select 'Alba'
	INSERT INTO expected (CITY) select 'Albany'
	INSERT INTO expected (CITY) select 'Amo'
	INSERT INTO expected (CITY) select 'Andersonville'
	INSERT INTO expected (CITY) select 'Archie'
	INSERT INTO expected (CITY) select 'Athens'
	INSERT INTO expected (CITY) select 'Atlantic Mine'
	INSERT INTO expected (CITY) select 'Bainbridge'
	INSERT INTO expected (CITY) select 'Baker'
	INSERT INTO expected (CITY) select 'Bass Harbor'
	INSERT INTO expected (CITY) select 'Bayville'
	INSERT INTO expected (CITY) select 'Beaufort'
	INSERT INTO expected (CITY) select 'Bellevue'
	INSERT INTO expected (CITY) select 'Benedict'
	INSERT INTO expected (CITY) select 'Bennington'
	INSERT INTO expected (CITY) select 'Bentonville'
	INSERT INTO expected (CITY) select 'Biggsville'
	INSERT INTO expected (CITY) select 'Bison'
	INSERT INTO expected (CITY) select 'Bono'
	INSERT INTO expected (CITY) select 'Bowdon'
	INSERT INTO expected (CITY) select 'Bridgton'
	INSERT INTO expected (CITY) select 'Brownsdale'
	INSERT INTO expected (CITY) select 'Brownstown'
	INSERT INTO expected (CITY) select 'Bullhead City'
	INSERT INTO expected (CITY) select 'Busby'
	INSERT INTO expected (CITY) select 'Cahone'
	INSERT INTO expected (CITY) select 'Calhoun'
	INSERT INTO expected (CITY) select 'Cannonsburg'
	INSERT INTO expected (CITY) select 'Canton'
	INSERT INTO expected (CITY) select 'Carver'
	INSERT INTO expected (CITY) select 'Centertown'
	INSERT INTO expected (CITY) select 'Cherry'
	INSERT INTO expected (CITY) select 'Cheswold'
	INSERT INTO expected (CITY) select 'Chignik Lagoon'
	INSERT INTO expected (CITY) select 'Childs'
	INSERT INTO expected (CITY) select 'Chilhowee'
	INSERT INTO expected (CITY) select 'Chokio'
	INSERT INTO expected (CITY) select 'Church Creek'
	INSERT INTO expected (CITY) select 'Clancy'
	INSERT INTO expected (CITY) select 'Climax'
	INSERT INTO expected (CITY) select 'Clio'
	INSERT INTO expected (CITY) select 'Clovis'
	INSERT INTO expected (CITY) select 'Clutier'
	INSERT INTO expected (CITY) select 'Coaling'
	INSERT INTO expected (CITY) select 'Cobalt'
	INSERT INTO expected (CITY) select 'Compton'
	INSERT INTO expected (CITY) select 'Crane Lake'
	INSERT INTO expected (CITY) select 'Cromwell'
	INSERT INTO expected (CITY) select 'Crouseville'
	INSERT INTO expected (CITY) select 'Curdsville'
	INSERT INTO expected (CITY) select 'Daleville'
	INSERT INTO expected (CITY) select 'Decatur'
	INSERT INTO expected (CITY) select 'Deep River'
	INSERT INTO expected (CITY) select 'Delano'
	INSERT INTO expected (CITY) select 'Delray Beach'
	INSERT INTO expected (CITY) select 'Delta'
	INSERT INTO expected (CITY) select 'Dryden'
	INSERT INTO expected (CITY) select 'Dumont'
	INSERT INTO expected (CITY) select 'Dundee'
	INSERT INTO expected (CITY) select 'East Haddam'
	INSERT INTO expected (CITY) select 'East Irvine'
	INSERT INTO expected (CITY) select 'Eastlake'
	INSERT INTO expected (CITY) select 'Effingham'
	INSERT INTO expected (CITY) select 'Elkton'
	INSERT INTO expected (CITY) select 'Elm Grove'
	INSERT INTO expected (CITY) select 'Ermine'
	INSERT INTO expected (CITY) select 'Eros'
	INSERT INTO expected (CITY) select 'Eskridge'
	INSERT INTO expected (CITY) select 'Eufaula'
	INSERT INTO expected (CITY) select 'Eustis'
	INSERT INTO expected (CITY) select 'Everton'
	INSERT INTO expected (CITY) select 'Farmington'
	INSERT INTO expected (CITY) select 'Firebrick'
	INSERT INTO expected (CITY) select 'Five Points'
	INSERT INTO expected (CITY) select 'Forest'
	INSERT INTO expected (CITY) select 'Forest Lakes'
	INSERT INTO expected (CITY) select 'Fort Lupton'
	INSERT INTO expected (CITY) select 'Frankfort Heights'
	INSERT INTO expected (CITY) select 'Franklin'
	INSERT INTO expected (CITY) select 'Gales Ferry'
	INSERT INTO expected (CITY) select 'Garden City'
	INSERT INTO expected (CITY) select 'Garland'
	INSERT INTO expected (CITY) select 'Glen Carbon'
	INSERT INTO expected (CITY) select 'Glencoe'
	INSERT INTO expected (CITY) select 'Gorham'
	INSERT INTO expected (CITY) select 'Grand Terrace'
	INSERT INTO expected (CITY) select 'Grandville'
	INSERT INTO expected (CITY) select 'Grapevine'
	INSERT INTO expected (CITY) select 'Grayslake'
	INSERT INTO expected (CITY) select 'Greens Fork'
	INSERT INTO expected (CITY) select 'Greenview'
	INSERT INTO expected (CITY) select 'Greenway'
	INSERT INTO expected (CITY) select 'Grosse Pointe'
	INSERT INTO expected (CITY) select 'Gustine'
	INSERT INTO expected (CITY) select 'Hackleburg'
	INSERT INTO expected (CITY) select 'Hampden'
	INSERT INTO expected (CITY) select 'Hanscom Afb'
	INSERT INTO expected (CITY) select 'Harmony'
	INSERT INTO expected (CITY) select 'Haverhill'
	INSERT INTO expected (CITY) select 'Hayfork'
	INSERT INTO expected (CITY) select 'Hayneville'
	INSERT INTO expected (CITY) select 'Healdsburg'
	INSERT INTO expected (CITY) select 'Henderson'
	INSERT INTO expected (CITY) select 'Heyburn'
	INSERT INTO expected (CITY) select 'Holbrook'
	INSERT INTO expected (CITY) select 'Hope'
	INSERT INTO expected (CITY) select 'Howard Lake'
	INSERT INTO expected (CITY) select 'Jolon'
	INSERT INTO expected (CITY) select 'Julian'
	INSERT INTO expected (CITY) select 'Kanorado'
	INSERT INTO expected (CITY) select 'Kell'
	INSERT INTO expected (CITY) select 'Kenner'
	INSERT INTO expected (CITY) select 'Keyes'
	INSERT INTO expected (CITY) select 'Kirkland'
	INSERT INTO expected (CITY) select 'Kirksville'
	INSERT INTO expected (CITY) select 'Kismet'
	INSERT INTO expected (CITY) select 'Kissee Mills'
	INSERT INTO expected (CITY) select 'Knobel'
	INSERT INTO expected (CITY) select 'Larkspur'
	INSERT INTO expected (CITY) select 'Leakesville'
	INSERT INTO expected (CITY) select 'Leavenworth'
	INSERT INTO expected (CITY) select 'Ledyard'
	INSERT INTO expected (CITY) select 'Lee'
	INSERT INTO expected (CITY) select 'Lismore'
	INSERT INTO expected (CITY) select 'Little Rock'
	INSERT INTO expected (CITY) select 'Loma Mar'
	INSERT INTO expected (CITY) select 'Lottie'
	INSERT INTO expected (CITY) select 'Ludington'
	INSERT INTO expected (CITY) select 'Ludlow'
	INSERT INTO expected (CITY) select 'Lupton'
	INSERT INTO expected (CITY) select 'Lynnville'
	INSERT INTO expected (CITY) select 'Macy'
	INSERT INTO expected (CITY) select 'Magnolia'
	INSERT INTO expected (CITY) select 'Manchester'
	INSERT INTO expected (CITY) select 'Many'
	INSERT INTO expected (CITY) select 'Marine On Saint Croix'
	INSERT INTO expected (CITY) select 'Marion Junction'
	INSERT INTO expected (CITY) select 'Mc Henry'
	INSERT INTO expected (CITY) select 'Mcbrides'
	INSERT INTO expected (CITY) select 'Mccomb'
	INSERT INTO expected (CITY) select 'Melber'
	INSERT INTO expected (CITY) select 'Mesick'
	INSERT INTO expected (CITY) select 'Mid Florida'
	INSERT INTO expected (CITY) select 'Middleboro'
	INSERT INTO expected (CITY) select 'Millville'
	INSERT INTO expected (CITY) select 'Mineral Point'
	INSERT INTO expected (CITY) select 'Monroe'
	INSERT INTO expected (CITY) select 'Montgomery City'
	INSERT INTO expected (CITY) select 'Montrose'
	INSERT INTO expected (CITY) select 'Morenci'
	INSERT INTO expected (CITY) select 'Mosca'
	INSERT INTO expected (CITY) select 'Mullan'
	INSERT INTO expected (CITY) select 'Napoleon'
	INSERT INTO expected (CITY) select 'Neon'
	INSERT INTO expected (CITY) select 'New Ross'
	INSERT INTO expected (CITY) select 'Newton Center'
	INSERT INTO expected (CITY) select 'Norphlet'
	INSERT INTO expected (CITY) select 'Norris'
	INSERT INTO expected (CITY) select 'Norris City'
	INSERT INTO expected (CITY) select 'North Berwick'
	INSERT INTO expected (CITY) select 'North Monmouth'
	INSERT INTO expected (CITY) select 'Norvell'
	INSERT INTO expected (CITY) select 'Norwood'
	INSERT INTO expected (CITY) select 'Oakfield'
	INSERT INTO expected (CITY) select 'Oconee'
	INSERT INTO expected (CITY) select 'Onaway'
	INSERT INTO expected (CITY) select 'Orange City'
	INSERT INTO expected (CITY) select 'Orange Park'
	INSERT INTO expected (CITY) select 'Osage City'
	INSERT INTO expected (CITY) select 'Ottertail'
	INSERT INTO expected (CITY) select 'Ozona'
	INSERT INTO expected (CITY) select 'Palatka'
	INSERT INTO expected (CITY) select 'Palm Desert'
	INSERT INTO expected (CITY) select 'Paron'
	INSERT INTO expected (CITY) select 'Pattonsburg'
	INSERT INTO expected (CITY) select 'Peachtree City'
	INSERT INTO expected (CITY) select 'Pheba'
	INSERT INTO expected (CITY) select 'Philipsburg'
	INSERT INTO expected (CITY) select 'Pico Rivera'
	INSERT INTO expected (CITY) select 'Pine Bluff'
	INSERT INTO expected (CITY) select 'Pine City'
	INSERT INTO expected (CITY) select 'Pleasant Grove'
	INSERT INTO expected (CITY) select 'Pony'
	INSERT INTO expected (CITY) select 'Prairie Du Rocher'
	INSERT INTO expected (CITY) select 'Prince Frederick'
	INSERT INTO expected (CITY) select 'Randall'
	INSERT INTO expected (CITY) select 'Rantoul'
	INSERT INTO expected (CITY) select 'Ravenden Springs'
	INSERT INTO expected (CITY) select 'Raymondville'
	INSERT INTO expected (CITY) select 'Regina'
	INSERT INTO expected (CITY) select 'Richland'
	INSERT INTO expected (CITY) select 'Robertsdale'
	INSERT INTO expected (CITY) select 'Rocheport'
	INSERT INTO expected (CITY) select 'Rockton'
	INSERT INTO expected (CITY) select 'Rogers'
	INSERT INTO expected (CITY) select 'Round Pond'
	INSERT INTO expected (CITY) select 'Roy'
	INSERT INTO expected (CITY) select 'Rumsey'
	INSERT INTO expected (CITY) select 'Rydal'
	INSERT INTO expected (CITY) select 'Saint Paul'
	INSERT INTO expected (CITY) select 'Saint Petersburg'
	INSERT INTO expected (CITY) select 'Salem'
	INSERT INTO expected (CITY) select 'Schleswig'
	INSERT INTO expected (CITY) select 'Seward'
	INSERT INTO expected (CITY) select 'Sherrill'
	INSERT INTO expected (CITY) select 'Shingletown'
	INSERT INTO expected (CITY) select 'Shreveport'
	INSERT INTO expected (CITY) select 'Siler'
	INSERT INTO expected (CITY) select 'Sizerock'
	INSERT INTO expected (CITY) select 'Skanee'
	INSERT INTO expected (CITY) select 'South Britain'
	INSERT INTO expected (CITY) select 'South Haven'
	INSERT INTO expected (CITY) select 'Southport'
	INSERT INTO expected (CITY) select 'Strasburg'
	INSERT INTO expected (CITY) select 'Sturdivant'
	INSERT INTO expected (CITY) select 'Taft'
	INSERT INTO expected (CITY) select 'Tarzana'
	INSERT INTO expected (CITY) select 'Tipton'
	INSERT INTO expected (CITY) select 'Turners Falls'
	INSERT INTO expected (CITY) select 'Ukiah'
	INSERT INTO expected (CITY) select 'Vulcan'
	INSERT INTO expected (CITY) select 'Walnut'
	INSERT INTO expected (CITY) select 'Watkins'
	INSERT INTO expected (CITY) select 'West Baden Springs'
	INSERT INTO expected (CITY) select 'West Hills'
	INSERT INTO expected (CITY) select 'West Hyannisport'
	INSERT INTO expected (CITY) select 'White Horse Beach'
	INSERT INTO expected (CITY) select 'Wickliffe'
	INSERT INTO expected (CITY) select 'Winter Park'
	INSERT INTO expected (CITY) select 'Yalaha'
	INSERT INTO expected (CITY) select 'Yazoo City'
	INSERT INTO expected (CITY) select 'Yellow Pine'
	INSERT INTO expected (CITY) select 'Yuma'
	INSERT INTO expected (CITY) select 'Zachary'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_08wos03]';