/*
Weather Observation Station 11

Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows

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

CREATE or ALTER PROCEDURE basicselect.proc_16wos11 AS
select 
	distinct(city)
from
	basicselect.STATION
where
	upper(left(city, 1)) not in ('A','E','I','O','U') or 
	upper(right(city,1)) not in ('A','E','I','O','U');
GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_16wos11 AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   CITY           varchar(21)
    );

    INSERT INTO actual (CITY) exec basicselect.proc_16wos11

    CREATE TABLE expected (
	   CITY           varchar(21)
    );
	INSERT INTO expected (CITY) select 'Addison'
	INSERT INTO expected (CITY) select 'Agency'
	INSERT INTO expected (CITY) select 'Alanson'
	INSERT INTO expected (CITY) select 'Albany'
	INSERT INTO expected (CITY) select 'Albion'
	INSERT INTO expected (CITY) select 'Algonac'
	INSERT INTO expected (CITY) select 'Allerton'
	INSERT INTO expected (CITY) select 'Alton'
	INSERT INTO expected (CITY) select 'Andover'
	INSERT INTO expected (CITY) select 'Anthony'
	INSERT INTO expected (CITY) select 'Arlington'
	INSERT INTO expected (CITY) select 'Arrowsmith'
	INSERT INTO expected (CITY) select 'Athens'
	INSERT INTO expected (CITY) select 'Auburn'
	INSERT INTO expected (CITY) select 'Baileyville'
	INSERT INTO expected (CITY) select 'Bainbridge'
	INSERT INTO expected (CITY) select 'Baker'
	INSERT INTO expected (CITY) select 'Baldwin'
	INSERT INTO expected (CITY) select 'Barrigada'
	INSERT INTO expected (CITY) select 'Bass Harbor'
	INSERT INTO expected (CITY) select 'Baton Rouge'
	INSERT INTO expected (CITY) select 'Bayville'
	INSERT INTO expected (CITY) select 'Beaufort'
	INSERT INTO expected (CITY) select 'Beaver Island'
	INSERT INTO expected (CITY) select 'Bellevue'
	INSERT INTO expected (CITY) select 'Benedict'
	INSERT INTO expected (CITY) select 'Bennington'
	INSERT INTO expected (CITY) select 'Bentonville'
	INSERT INTO expected (CITY) select 'Berryton'
	INSERT INTO expected (CITY) select 'Bertha'
	INSERT INTO expected (CITY) select 'Beverly'
	INSERT INTO expected (CITY) select 'Biggsville'
	INSERT INTO expected (CITY) select 'Bison'
	INSERT INTO expected (CITY) select 'Blue River'
	INSERT INTO expected (CITY) select 'Bono'
	INSERT INTO expected (CITY) select 'Bowdon Junction'
	INSERT INTO expected (CITY) select 'Bowdon'
	INSERT INTO expected (CITY) select 'Bridgeport'
	INSERT INTO expected (CITY) select 'Bridgton'
	INSERT INTO expected (CITY) select 'Brighton'
	INSERT INTO expected (CITY) select 'Brilliant'
	INSERT INTO expected (CITY) select 'Bristol'
	INSERT INTO expected (CITY) select 'Brownsdale'
	INSERT INTO expected (CITY) select 'Brownstown'
	INSERT INTO expected (CITY) select 'Buffalo Creek'
	INSERT INTO expected (CITY) select 'Bullhead City'
	INSERT INTO expected (CITY) select 'Busby'
	INSERT INTO expected (CITY) select 'Byron'
	INSERT INTO expected (CITY) select 'Cahone'
	INSERT INTO expected (CITY) select 'Calhoun'
	INSERT INTO expected (CITY) select 'Calpine'
	INSERT INTO expected (CITY) select 'Cannonsburg'
	INSERT INTO expected (CITY) select 'Canton'
	INSERT INTO expected (CITY) select 'Cape Girardeau'
	INSERT INTO expected (CITY) select 'Carlock'
	INSERT INTO expected (CITY) select 'Carlos'
	INSERT INTO expected (CITY) select 'Carver'
	INSERT INTO expected (CITY) select 'Cascade'
	INSERT INTO expected (CITY) select 'Casco'
	INSERT INTO expected (CITY) select 'Caseville'
	INSERT INTO expected (CITY) select 'Centertown'
	INSERT INTO expected (CITY) select 'Channing'
	INSERT INTO expected (CITY) select 'Chelsea'
	INSERT INTO expected (CITY) select 'Cherry'
	INSERT INTO expected (CITY) select 'Chester'
	INSERT INTO expected (CITY) select 'Cheswold'
	INSERT INTO expected (CITY) select 'Chignik Lagoon'
	INSERT INTO expected (CITY) select 'Childs'
	INSERT INTO expected (CITY) select 'Chilhowee'
	INSERT INTO expected (CITY) select 'Chokio'
	INSERT INTO expected (CITY) select 'Church Creek'
	INSERT INTO expected (CITY) select 'Clancy'
	INSERT INTO expected (CITY) select 'Clarkdale'
	INSERT INTO expected (CITY) select 'Clarkston'
	INSERT INTO expected (CITY) select 'Clifton'
	INSERT INTO expected (CITY) select 'Climax'
	INSERT INTO expected (CITY) select 'Clio'
	INSERT INTO expected (CITY) select 'Clipper Mills'
	INSERT INTO expected (CITY) select 'Clopton'
	INSERT INTO expected (CITY) select 'Clovis'
	INSERT INTO expected (CITY) select 'Clutier'
	INSERT INTO expected (CITY) select 'Coalgood'
	INSERT INTO expected (CITY) select 'Coaling'
	INSERT INTO expected (CITY) select 'Cobalt'
	INSERT INTO expected (CITY) select 'Coldwater'
	INSERT INTO expected (CITY) select 'Columbus'
	INSERT INTO expected (CITY) select 'Compton'
	INSERT INTO expected (CITY) select 'Corcoran'
	INSERT INTO expected (CITY) select 'Corriganville'
	INSERT INTO expected (CITY) select 'Cowgill'
	INSERT INTO expected (CITY) select 'Crane Lake'
	INSERT INTO expected (CITY) select 'Cranks'
	INSERT INTO expected (CITY) select 'Crescent City'
	INSERT INTO expected (CITY) select 'Cromwell'
	INSERT INTO expected (CITY) select 'Crouseville'
	INSERT INTO expected (CITY) select 'Cuba'
	INSERT INTO expected (CITY) select 'Culdesac'
	INSERT INTO expected (CITY) select 'Curdsville'
	INSERT INTO expected (CITY) select 'Dale'
	INSERT INTO expected (CITY) select 'Daleville'
	INSERT INTO expected (CITY) select 'De Tour Village'
	INSERT INTO expected (CITY) select 'Decatur'
	INSERT INTO expected (CITY) select 'Deep River'
	INSERT INTO expected (CITY) select 'Deerfield'
	INSERT INTO expected (CITY) select 'Del Mar'
	INSERT INTO expected (CITY) select 'Delano'
	INSERT INTO expected (CITY) select 'Delavan'
	INSERT INTO expected (CITY) select 'Delray Beach'
	INSERT INTO expected (CITY) select 'Delta'
	INSERT INTO expected (CITY) select 'Dent'
	INSERT INTO expected (CITY) select 'Dixie'
	INSERT INTO expected (CITY) select 'Dorrance'
	INSERT INTO expected (CITY) select 'Dryden'
	INSERT INTO expected (CITY) select 'Ducor'
	INSERT INTO expected (CITY) select 'Dumont'
	INSERT INTO expected (CITY) select 'Dundee'
	INSERT INTO expected (CITY) select 'Dupo'
	INSERT INTO expected (CITY) select 'East Haddam'
	INSERT INTO expected (CITY) select 'Edgewater'
	INSERT INTO expected (CITY) select 'Effingham'
	INSERT INTO expected (CITY) select 'Elkton'
	INSERT INTO expected (CITY) select 'Emmett'
	INSERT INTO expected (CITY) select 'Equality'
	INSERT INTO expected (CITY) select 'Eros'
	INSERT INTO expected (CITY) select 'Esmond'
	INSERT INTO expected (CITY) select 'Eureka Springs'
	INSERT INTO expected (CITY) select 'Eustis'
	INSERT INTO expected (CITY) select 'Everton'
	INSERT INTO expected (CITY) select 'Fairview'
	INSERT INTO expected (CITY) select 'Farmington'
	INSERT INTO expected (CITY) select 'Firebrick'
	INSERT INTO expected (CITY) select 'Five Points'
	INSERT INTO expected (CITY) select 'Flowood'
	INSERT INTO expected (CITY) select 'Forest Lakes'
	INSERT INTO expected (CITY) select 'Forest'
	INSERT INTO expected (CITY) select 'Fort Atkinson'
	INSERT INTO expected (CITY) select 'Fort Lupton'
	INSERT INTO expected (CITY) select 'Fort Meade'
	INSERT INTO expected (CITY) select 'Frankfort Heights'
	INSERT INTO expected (CITY) select 'Franklin'
	INSERT INTO expected (CITY) select 'Fredericksburg'
	INSERT INTO expected (CITY) select 'Fredericktown'
	INSERT INTO expected (CITY) select 'Freeport'
	INSERT INTO expected (CITY) select 'Fremont'
	INSERT INTO expected (CITY) select 'Fulton'
	INSERT INTO expected (CITY) select 'Gales Ferry'
	INSERT INTO expected (CITY) select 'Garden City'
	INSERT INTO expected (CITY) select 'Garland'
	INSERT INTO expected (CITY) select 'Gatewood'
	INSERT INTO expected (CITY) select 'Glen Carbon'
	INSERT INTO expected (CITY) select 'Glencoe'
	INSERT INTO expected (CITY) select 'Goodman'
	INSERT INTO expected (CITY) select 'Gorham'
	INSERT INTO expected (CITY) select 'Gowrie'
	INSERT INTO expected (CITY) select 'Graettinger'
	INSERT INTO expected (CITY) select 'Grand Terrace'
	INSERT INTO expected (CITY) select 'Grandville'
	INSERT INTO expected (CITY) select 'Granger'
	INSERT INTO expected (CITY) select 'Grapevine'
	INSERT INTO expected (CITY) select 'Grayslake'
	INSERT INTO expected (CITY) select 'Greens Fork'
	INSERT INTO expected (CITY) select 'Greenview'
	INSERT INTO expected (CITY) select 'Greenville'
	INSERT INTO expected (CITY) select 'Greenway'
	INSERT INTO expected (CITY) select 'Gretna'
	INSERT INTO expected (CITY) select 'Gridley'
	INSERT INTO expected (CITY) select 'Griffin'
	INSERT INTO expected (CITY) select 'Grimes'
	INSERT INTO expected (CITY) select 'Grosse Pointe'
	INSERT INTO expected (CITY) select 'Groveoak'
	INSERT INTO expected (CITY) select 'Gustine'
	INSERT INTO expected (CITY) select 'Hackleburg'
	INSERT INTO expected (CITY) select 'Hagatna'
	INSERT INTO expected (CITY) select 'Hampden'
	INSERT INTO expected (CITY) select 'Hanna City'
	INSERT INTO expected (CITY) select 'Hanscom Afb'
	INSERT INTO expected (CITY) select 'Harbor Springs'
	INSERT INTO expected (CITY) select 'Harmony'
	INSERT INTO expected (CITY) select 'Hartland'
	INSERT INTO expected (CITY) select 'Haubstadt'
	INSERT INTO expected (CITY) select 'Haverhill'
	INSERT INTO expected (CITY) select 'Hawarden'
	INSERT INTO expected (CITY) select 'Hayesville'
	INSERT INTO expected (CITY) select 'Hayfork'
	INSERT INTO expected (CITY) select 'Hayneville'
	INSERT INTO expected (CITY) select 'Hazlehurst'
	INSERT INTO expected (CITY) select 'Healdsburg'
	INSERT INTO expected (CITY) select 'Henderson'
	INSERT INTO expected (CITY) select 'Hesperia'
	INSERT INTO expected (CITY) select 'Heyburn'
	INSERT INTO expected (CITY) select 'Highwood'
	INSERT INTO expected (CITY) select 'Hills'
	INSERT INTO expected (CITY) select 'Hillside'
	INSERT INTO expected (CITY) select 'Hoffman Estates'
	INSERT INTO expected (CITY) select 'Holbrook'
	INSERT INTO expected (CITY) select 'Honolulu'
	INSERT INTO expected (CITY) select 'Hope'
	INSERT INTO expected (CITY) select 'Hopkinsville'
	INSERT INTO expected (CITY) select 'Hoskinston'
	INSERT INTO expected (CITY) select 'Hotchkiss'
	INSERT INTO expected (CITY) select 'Howard Lake'
	INSERT INTO expected (CITY) select 'Humeston'
	INSERT INTO expected (CITY) select 'Hyde Park'
	INSERT INTO expected (CITY) select 'Irvington'
	INSERT INTO expected (CITY) select 'Jack'
	INSERT INTO expected (CITY) select 'Jackson'
	INSERT INTO expected (CITY) select 'Jemison'
	INSERT INTO expected (CITY) select 'Jerome'
	INSERT INTO expected (CITY) select 'Jolon'
	INSERT INTO expected (CITY) select 'Jordan'
	INSERT INTO expected (CITY) select 'Julian'
	INSERT INTO expected (CITY) select 'Kanorado'
	INSERT INTO expected (CITY) select 'Kell'
	INSERT INTO expected (CITY) select 'Kenner'
	INSERT INTO expected (CITY) select 'Kensett'
	INSERT INTO expected (CITY) select 'Keyes'
	INSERT INTO expected (CITY) select 'Kingsland'
	INSERT INTO expected (CITY) select 'Kirk'
	INSERT INTO expected (CITY) select 'Kirkland'
	INSERT INTO expected (CITY) select 'Kirksville'
	INSERT INTO expected (CITY) select 'Kismet'
	INSERT INTO expected (CITY) select 'Kissee Mills'
	INSERT INTO expected (CITY) select 'Knob Lick'
	INSERT INTO expected (CITY) select 'Knobel'
	INSERT INTO expected (CITY) select 'Koleen'
	INSERT INTO expected (CITY) select 'Lakeville'
	INSERT INTO expected (CITY) select 'Lakota'
	INSERT INTO expected (CITY) select 'Lapeer'
	INSERT INTO expected (CITY) select 'Larkspur'
	INSERT INTO expected (CITY) select 'Leakesville'
	INSERT INTO expected (CITY) select 'Leavenworth'
	INSERT INTO expected (CITY) select 'Ledyard'
	INSERT INTO expected (CITY) select 'Lee Center'
	INSERT INTO expected (CITY) select 'Lee'
	INSERT INTO expected (CITY) select 'Lena'
	INSERT INTO expected (CITY) select 'Libertytown'
	INSERT INTO expected (CITY) select 'Linden'
	INSERT INTO expected (CITY) select 'Lindsay'
	INSERT INTO expected (CITY) select 'Linthicum Heights'
	INSERT INTO expected (CITY) select 'Lismore'
	INSERT INTO expected (CITY) select 'Little Rock'
	INSERT INTO expected (CITY) select 'Loma Mar'
	INSERT INTO expected (CITY) select 'Losantville'
	INSERT INTO expected (CITY) select 'Lottie'
	INSERT INTO expected (CITY) select 'Lucerne Valley'
	INSERT INTO expected (CITY) select 'Ludington'
	INSERT INTO expected (CITY) select 'Ludlow'
	INSERT INTO expected (CITY) select 'Lupton'
	INSERT INTO expected (CITY) select 'Lydia'
	INSERT INTO expected (CITY) select 'Lynnville'
	INSERT INTO expected (CITY) select 'Macy'
	INSERT INTO expected (CITY) select 'Madden'
	INSERT INTO expected (CITY) select 'Madisonville'
	INSERT INTO expected (CITY) select 'Magnolia'
	INSERT INTO expected (CITY) select 'Manchester'
	INSERT INTO expected (CITY) select 'Many'
	INSERT INTO expected (CITY) select 'Marine On Saint Croix'
	INSERT INTO expected (CITY) select 'Marion Junction'
	INSERT INTO expected (CITY) select 'Marysville'
	INSERT INTO expected (CITY) select 'Mascotte'
	INSERT INTO expected (CITY) select 'Mc Henry'
	INSERT INTO expected (CITY) select 'Mcbrides'
	INSERT INTO expected (CITY) select 'Mccomb'
	INSERT INTO expected (CITY) select 'Mechanic Falls'
	INSERT INTO expected (CITY) select 'Melber'
	INSERT INTO expected (CITY) select 'Mesick'
	INSERT INTO expected (CITY) select 'Mid Florida'
	INSERT INTO expected (CITY) select 'Middleboro'
	INSERT INTO expected (CITY) select 'Midpines'
	INSERT INTO expected (CITY) select 'Milledgeville'
	INSERT INTO expected (CITY) select 'Millville'
	INSERT INTO expected (CITY) select 'Mineral Point'
	INSERT INTO expected (CITY) select 'Monona'
	INSERT INTO expected (CITY) select 'Monroe'
	INSERT INTO expected (CITY) select 'Montgomery City'
	INSERT INTO expected (CITY) select 'Montreal'
	INSERT INTO expected (CITY) select 'Montrose'
	INSERT INTO expected (CITY) select 'Monument'
	INSERT INTO expected (CITY) select 'Morenci'
	INSERT INTO expected (CITY) select 'Mosca'
	INSERT INTO expected (CITY) select 'Mullan'
	INSERT INTO expected (CITY) select 'Napoleon'
	INSERT INTO expected (CITY) select 'Negreet'
	INSERT INTO expected (CITY) select 'Neon'
	INSERT INTO expected (CITY) select 'Netawaka'
	INSERT INTO expected (CITY) select 'New Century'
	INSERT INTO expected (CITY) select 'New Liberty'
	INSERT INTO expected (CITY) select 'New Ross'
	INSERT INTO expected (CITY) select 'Newark'
	INSERT INTO expected (CITY) select 'Newbury'
	INSERT INTO expected (CITY) select 'Newton Center'
	INSERT INTO expected (CITY) select 'Norphlet'
	INSERT INTO expected (CITY) select 'Norris City'
	INSERT INTO expected (CITY) select 'Norris'
	INSERT INTO expected (CITY) select 'North Berwick'
	INSERT INTO expected (CITY) select 'North Branford'
	INSERT INTO expected (CITY) select 'North Middletown'
	INSERT INTO expected (CITY) select 'North Monmouth'
	INSERT INTO expected (CITY) select 'Northfield'
	INSERT INTO expected (CITY) select 'Norvell'
	INSERT INTO expected (CITY) select 'Norway'
	INSERT INTO expected (CITY) select 'Norwood'
	INSERT INTO expected (CITY) select 'Notasulga'
	INSERT INTO expected (CITY) select 'Novinger'
	INSERT INTO expected (CITY) select 'Nubieber'
	INSERT INTO expected (CITY) select 'Oakfield'
	INSERT INTO expected (CITY) select 'Odin'
	INSERT INTO expected (CITY) select 'Olmitz'
	INSERT INTO expected (CITY) select 'Onaway'
	INSERT INTO expected (CITY) select 'Orange City'
	INSERT INTO expected (CITY) select 'Orange Park'
	INSERT INTO expected (CITY) select 'Osage City'
	INSERT INTO expected (CITY) select 'Ottertail'
	INSERT INTO expected (CITY) select 'Palatka'
	INSERT INTO expected (CITY) select 'Palm Desert'
	INSERT INTO expected (CITY) select 'Panther Burn'
	INSERT INTO expected (CITY) select 'Paron'
	INSERT INTO expected (CITY) select 'Patriot'
	INSERT INTO expected (CITY) select 'Pattonsburg'
	INSERT INTO expected (CITY) select 'Pawnee'
	INSERT INTO expected (CITY) select 'Payson'
	INSERT INTO expected (CITY) select 'Peabody'
	INSERT INTO expected (CITY) select 'Peachtree City'
	INSERT INTO expected (CITY) select 'Peaks Island'
	INSERT INTO expected (CITY) select 'Pelahatchie'
	INSERT INTO expected (CITY) select 'Pengilly'
	INSERT INTO expected (CITY) select 'Pfeifer'
	INSERT INTO expected (CITY) select 'Pheba'
	INSERT INTO expected (CITY) select 'Philipsburg'
	INSERT INTO expected (CITY) select 'Pico Rivera'
	INSERT INTO expected (CITY) select 'Pierre Part'
	INSERT INTO expected (CITY) select 'Pine Bluff'
	INSERT INTO expected (CITY) select 'Pine City'
	INSERT INTO expected (CITY) select 'Pleasant Grove'
	INSERT INTO expected (CITY) select 'Pocahontas'
	INSERT INTO expected (CITY) select 'Pomona Park'
	INSERT INTO expected (CITY) select 'Pomona'
	INSERT INTO expected (CITY) select 'Pony'
	INSERT INTO expected (CITY) select 'Portland'
	INSERT INTO expected (CITY) select 'Prairie Du Rocher'
	INSERT INTO expected (CITY) select 'Prescott'
	INSERT INTO expected (CITY) select 'Prince Frederick'
	INSERT INTO expected (CITY) select 'Quinter'
	INSERT INTO expected (CITY) select 'Randall'
	INSERT INTO expected (CITY) select 'Rantoul'
	INSERT INTO expected (CITY) select 'Ravenden Springs'
	INSERT INTO expected (CITY) select 'Ravenna'
	INSERT INTO expected (CITY) select 'Raymondville'
	INSERT INTO expected (CITY) select 'Reasnor'
	INSERT INTO expected (CITY) select 'Reeds'
	INSERT INTO expected (CITY) select 'Reeves'
	INSERT INTO expected (CITY) select 'Regina'
	INSERT INTO expected (CITY) select 'Renville'
	INSERT INTO expected (CITY) select 'Republic'
	INSERT INTO expected (CITY) select 'Richland'
	INSERT INTO expected (CITY) select 'Richmond Hill'
	INSERT INTO expected (CITY) select 'Richmond'
	INSERT INTO expected (CITY) select 'Ridgway'
	INSERT INTO expected (CITY) select 'Rio Oso'
	INSERT INTO expected (CITY) select 'Rives Junction'
	INSERT INTO expected (CITY) select 'Robertsdale'
	INSERT INTO expected (CITY) select 'Rocheport'
	INSERT INTO expected (CITY) select 'Rockton'
	INSERT INTO expected (CITY) select 'Rogers'
	INSERT INTO expected (CITY) select 'Roselawn'
	INSERT INTO expected (CITY) select 'Rosie'
	INSERT INTO expected (CITY) select 'Round Pond'
	INSERT INTO expected (CITY) select 'Roy'
	INSERT INTO expected (CITY) select 'Rumsey'
	INSERT INTO expected (CITY) select 'Rydal'
	INSERT INTO expected (CITY) select 'Saint Elmo'
	INSERT INTO expected (CITY) select 'Saint Paul'
	INSERT INTO expected (CITY) select 'Saint Petersburg'
	INSERT INTO expected (CITY) select 'Salem'
	INSERT INTO expected (CITY) select 'Samantha'
	INSERT INTO expected (CITY) select 'San Simeon'
	INSERT INTO expected (CITY) select 'Sandborn'
	INSERT INTO expected (CITY) select 'Sanders'
	INSERT INTO expected (CITY) select 'Sandy Hook'
	INSERT INTO expected (CITY) select 'Schleswig'
	INSERT INTO expected (CITY) select 'Scotts Valley'
	INSERT INTO expected (CITY) select 'Seaton'
	INSERT INTO expected (CITY) select 'Sedgwick'
	INSERT INTO expected (CITY) select 'Seward'
	INSERT INTO expected (CITY) select 'Shasta'
	INSERT INTO expected (CITY) select 'Sherrill'
	INSERT INTO expected (CITY) select 'Shingletown'
	INSERT INTO expected (CITY) select 'Showell'
	INSERT INTO expected (CITY) select 'Shreveport'
	INSERT INTO expected (CITY) select 'Siler'
	INSERT INTO expected (CITY) select 'Siloam'
	INSERT INTO expected (CITY) select 'Sizerock'
	INSERT INTO expected (CITY) select 'Skanee'
	INSERT INTO expected (CITY) select 'Slidell'
	INSERT INTO expected (CITY) select 'Soldier'
	INSERT INTO expected (CITY) select 'South Britain'
	INSERT INTO expected (CITY) select 'South Carrollton'
	INSERT INTO expected (CITY) select 'South El Monte'
	INSERT INTO expected (CITY) select 'South Haven'
	INSERT INTO expected (CITY) select 'Southport'
	INSERT INTO expected (CITY) select 'Springerville'
	INSERT INTO expected (CITY) select 'Strasburg'
	INSERT INTO expected (CITY) select 'Strawn'
	INSERT INTO expected (CITY) select 'Sturdivant'
	INSERT INTO expected (CITY) select 'Sturgis'
	INSERT INTO expected (CITY) select 'Susanville'
	INSERT INTO expected (CITY) select 'Taft'
	INSERT INTO expected (CITY) select 'Talbert'
	INSERT INTO expected (CITY) select 'Tamms'
	INSERT INTO expected (CITY) select 'Tarzana'
	INSERT INTO expected (CITY) select 'Tefft'
	INSERT INTO expected (CITY) select 'Tennessee'
	INSERT INTO expected (CITY) select 'Tina'
	INSERT INTO expected (CITY) select 'Tipton'
	INSERT INTO expected (CITY) select 'Turner'
	INSERT INTO expected (CITY) select 'Turners Falls'
	INSERT INTO expected (CITY) select 'Tyler'
	INSERT INTO expected (CITY) select 'Udall'
	INSERT INTO expected (CITY) select 'Ukiah'
	INSERT INTO expected (CITY) select 'Union Star'
	INSERT INTO expected (CITY) select 'Veedersburg'
	INSERT INTO expected (CITY) select 'Verona'
	INSERT INTO expected (CITY) select 'Vulcan'
	INSERT INTO expected (CITY) select 'Waipahu'
	INSERT INTO expected (CITY) select 'Walnut'
	INSERT INTO expected (CITY) select 'Waresboro'
	INSERT INTO expected (CITY) select 'Watkins'
	INSERT INTO expected (CITY) select 'Weldon'
	INSERT INTO expected (CITY) select 'Weldona'
	INSERT INTO expected (CITY) select 'Wellington'
	INSERT INTO expected (CITY) select 'West Baden Springs'
	INSERT INTO expected (CITY) select 'West Grove'
	INSERT INTO expected (CITY) select 'West Hills'
	INSERT INTO expected (CITY) select 'West Hyannisport'
	INSERT INTO expected (CITY) select 'West Somerset'
	INSERT INTO expected (CITY) select 'Westphalia'
	INSERT INTO expected (CITY) select 'White Horse Beach'
	INSERT INTO expected (CITY) select 'Whitewater'
	INSERT INTO expected (CITY) select 'Wickliffe'
	INSERT INTO expected (CITY) select 'Wildie'
	INSERT INTO expected (CITY) select 'Williams'
	INSERT INTO expected (CITY) select 'Wilton'
	INSERT INTO expected (CITY) select 'Winchester'
	INSERT INTO expected (CITY) select 'Windom'
	INSERT INTO expected (CITY) select 'Winslow'
	INSERT INTO expected (CITY) select 'Winsted'
	INSERT INTO expected (CITY) select 'Winter Park'
	INSERT INTO expected (CITY) select 'Woodbury'
	INSERT INTO expected (CITY) select 'Woodsboro'
	INSERT INTO expected (CITY) select 'Woodstock Valley'
	INSERT INTO expected (CITY) select 'Yalaha'
	INSERT INTO expected (CITY) select 'Yazoo City'
	INSERT INTO expected (CITY) select 'Yellow Pine'
	INSERT INTO expected (CITY) select 'Yellville'
	INSERT INTO expected (CITY) select 'Yoder'
	INSERT INTO expected (CITY) select 'Yuma'
	INSERT INTO expected (CITY) select 'Zachary'
	INSERT INTO expected (CITY) select 'Zionsville'

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_16wos11]';