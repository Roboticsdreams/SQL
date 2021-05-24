/*
Select All

Query all columns (attributes) for every row in the CITY table.

Input Format

The CITY table is described as follows:

+-------------+--------------+
|   FILEDS    |     TYPE     |
+-------------+--------------+
| ID          | NUMBER       |
| NAME        | VARCHAR2(17) |
| COUNRTYCODE | VARCHAR2(3)  |
| DISTRICT    | VARCHAR2(20) |
| POPULATION  | NUMBER       |
+-------------+--------------+

*/

use hackerrank;

GO

raiserror('Now at the create procedure section ....',0,1)

GO

CREATE or ALTER PROCEDURE basicselect.proc_03selectall AS
select 
	basicselect.CITY.id as ID, 
	basicselect.CITY.name as NAME,
	basicselect.CITY.countrycode as COUNTRYCODE,
	basicselect.CITY.district as DISTRICT,
	basicselect.CITY.population as POPULATION
from 
	basicselect.CITY
order by basicselect.CITY.id;

GO

CREATE or ALTER PROCEDURE BasicSelectTestClass.test_03selectall
AS
BEGIN
    IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
    IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

	CREATE TABLE actual (
	   ID         	  int        		NOT NULL,
	   NAME           varchar(17),
	   COUNTRYCODE	  varchar(3),
	   DISTRICT       varchar(20),
	   POPULATION     int,
    );

    INSERT INTO actual (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) exec basicselect.proc_03selectall;

    CREATE TABLE expected (
	   ID         	  int        		NOT NULL,
	   NAME           varchar(17),
	   COUNTRYCODE	  varchar(3),
	   DISTRICT       varchar(20),
	   POPULATION     int,
    );

	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 6,'Rotterdam','NLD','Zuid-Holland',593321
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 19,'Zaanstad','NLD','Noord-Holland',135621 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 214,'Porto Alegre','BRA','Rio Grande do Sul',1314032 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 397,'Lauro de Freitas','BRA','Bahia',109236
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 547,'Dobric','BGR','Varna',100399
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 552,'Bujumbura','BDI','Bujumbura',300000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 554,'Santiago de Chile','CHL','Santiago',4703954
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 626,'al-Minya','EGY','al-Minya',201360
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 646,'Santa Ana','SLV','Santa Ana',139389
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 762,'Bahir Dar','ETH','Amhara',96140
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 796,'Baguio','PHL','CAR',252386
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 896,'Malungon','PHL','Southern Mindanao',93232
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 904,'Banjul','GMB','Banjul',42326
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 924,'Villa Nueva','GTM','Guatemala',101295
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 990,'Waru','IDN','East Java',124300
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1155,'Latur','IND','Maharashtra',197408
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1222,'Tenali','IND','Andhra Pradesh',143726
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1235,'Tirunelveli','IND','Tamil Nadu',135825
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1256,'Alandur','IND','Tamil Nadu',125244 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1279,'Neyveli','IND','Tamil Nadu',118080
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1293,'Pallavaram','IND','Tamil Nadu',111866 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1350,'Dehri','IND','Bihar',94526 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1383,'Tabriz','IRN','East Azerbaidzan',1191043 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1385,'Karaj','IRN','Teheran',940968 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1508,'Bolzano','ITA','Trentino-Alto Adige',97232 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1520,'Cesena','ITA','Emilia-Romagna',89852 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1613,'Neyagawa','JPN','Osaka',257315 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1630,'Ageo','JPN','Saitama',209442 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1661,'Sayama','JPN','Saitama',162472
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1681,'Omuta','JPN','Fukuoka',142889
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1739,'Tokuyama','JPN','Yamaguchi',107078
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1793,'Novi Sad','YUG','Vojvodina',179626 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1857,'Kelowna','CAN','British Colombia',89442 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1895,'Harbin','CHN','Heilongjiang',4289800 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1900,'Changchun','CHN','Jilin',2812000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1913,'Lanzhou','CHN','Gansu',1565800 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 1947,'Changzhou','CHN','Jiangsu',530000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2070,'Dezhou','CHN','Shandong',195485
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2081,'Heze','CHN','Shandong',189293
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2111,'Chenzhou','CHN','Hunan',169400
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2153,'Xianning','CHN','Hubei',136811
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2192,'Lhasa','CHN','Tibet',120000 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2193,'Lianyuan','CHN','Hunan',118858
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2227,'Xingcheng','CHN','Liaoning',102384
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2273,'Villavicencio','COL','Meta',273140 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2384,'Tong-yong','KOR','Kyongsangnam',131717
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2386,'Yongju','KOR','Kyongsangbuk',131097 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2387,'Chinhae','KOR','Kyongsangnam',125997
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2388,'Sangju','KOR','Kyongsangbuk',124116 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2406,'Herakleion','GRC','Crete',116178 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2440,'Monrovia','LBR','Montserrado',850000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2462,'Lilongwe','MWI','Lilongwe',435964 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2505,'Taza','MAR','Taza-Al Hoceima-Taou',92700
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2555,'Xalapa','MEX','Veracruz',390058 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2602,'Ocosingo','MEX','Chiapas',171495 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2609,'Nogales','MEX','Sonora',159103
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2670,'San Pedro Cholula','MEX','Puebla',99734
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2689,'Palikir','FSM','Pohnpei',8600
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2706,'Tete','MOZ','Tete',101984
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2716,'Sittwe (Akyab)','MMR','Rakhine',137600
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2922,'Carolina','PRI','Carolina',186076 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2967,'Grudziadz','POL','Kujawsko-Pomorskie',102434
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 2972,'Malabo','GNQ','Bioko',40000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3073,'Essen','DEU','Nordrhein-Westfalen',599515
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3169,'Apia','WSM','Upolu',35900
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3198,'Dakar','SEN','Cap-Vert',785071
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3253,'Hama','SYR','Hama',343361
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3288,'Luchou','TWN','Taipei',160516 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3309,'Tanga','TZA','Tanga',137400 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3353,'Sousse','TUN','Sousse',145900 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3377,'Kahramanmaras','TUR','Kahramanmaras',245772 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3430,'Odesa','UKR','Odesa',1011000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3581,'St Petersburg','RUS','Pietari',4694000 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3770,'Hanoi','VNM', 'Hanoi',1410000
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3815,'El Paso','USA','Texas',563662
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3878,'Scottsdale','USA','Arizona',202705
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3965,'Corona','USA','California',124966
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3973,'Concord','USA','California',121780
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3977,'Cedar Rapids','USA','Iowa',120758 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 3982,'Coral Springs','USA','Florida',117549
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 4054,'Fairfield','USA','California',92256 
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 4058,'Boulder','USA','Colorado',91238
	INSERT INTO expected (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) select 4061,'Fall River','USA','Massachusetts',90555

    EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;

GO

--exec tSQLt.Run 'BasicSelectTestClass.[test_03selectall]';