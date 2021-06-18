use hackerrank;

GO 

exec tSQLt.DropClass 'BasicSelectTestClass'

GO 

exec tSQLt.newTestclass 'BasicSelectTestClass'

GO

raiserror('Now at the basicselect schema section ....',0,1)

GO

DROP TABLE IF EXISTS basicselect.CITY;

GO

raiserror('Now at the basicselect.CITY table creation ....',0,1)

GO

CREATE TABLE basicselect.CITY
(
   ID         	  int        		NOT NULL,
   NAME           varchar(17)       NOT NULL,
   COUNTRYCODE	  varchar(3)        NULL,
   DISTRICT       varchar(20)       NULL,
   POPULATION     int				NULL,
)

GO

raiserror('Now at the basicselect.CITY table insertion ....',0,1)

GO

BEGIN TRANSACTION

INSERT INTO basicselect.CITY VALUES(6,'Rotterdam','NLD','Zuid-Holland',593321);
INSERT INTO basicselect.CITY VALUES(19,'Zaanstad','NLD','Noord-Holland',135621); 
INSERT INTO basicselect.CITY VALUES(214,'Porto Alegre','BRA','Rio Grande do Sul',1314032); 
INSERT INTO basicselect.CITY VALUES(397,'Lauro de Freitas','BRA','Bahia',109236);
INSERT INTO basicselect.CITY VALUES(547,'Dobric','BGR','Varna',100399);
INSERT INTO basicselect.CITY VALUES(552,'Bujumbura','BDI','Bujumbura',300000);
INSERT INTO basicselect.CITY VALUES(554,'Santiago de Chile','CHL','Santiago',4703954);
INSERT INTO basicselect.CITY VALUES(626,'al-Minya','EGY','al-Minya',201360);
INSERT INTO basicselect.CITY VALUES(646,'Santa Ana','SLV','Santa Ana',139389);
INSERT INTO basicselect.CITY VALUES(762,'Bahir Dar','ETH','Amhara',96140);
INSERT INTO basicselect.CITY VALUES(796,'Baguio','PHL','CAR',252386);
INSERT INTO basicselect.CITY VALUES(896,'Malungon','PHL','Southern Mindanao',93232);
INSERT INTO basicselect.CITY VALUES(904,'Banjul','GMB','Banjul',42326);
INSERT INTO basicselect.CITY VALUES(924,'Villa Nueva','GTM','Guatemala',101295);
INSERT INTO basicselect.CITY VALUES(990,'Waru','IDN','East Java',124300);
INSERT INTO basicselect.CITY VALUES(1155,'Latur','IND','Maharashtra',197408);
INSERT INTO basicselect.CITY VALUES(1222,'Tenali','IND','Andhra Pradesh',143726);
INSERT INTO basicselect.CITY VALUES(1235,'Tirunelveli','IND','Tamil Nadu',135825);
INSERT INTO basicselect.CITY VALUES(1256,'Alandur','IND','Tamil Nadu',125244); 
INSERT INTO basicselect.CITY VALUES(1279,'Neyveli','IND','Tamil Nadu',118080);
INSERT INTO basicselect.CITY VALUES(1293,'Pallavaram','IND','Tamil Nadu',111866); 
INSERT INTO basicselect.CITY VALUES(1350,'Dehri','IND','Bihar',94526); 
INSERT INTO basicselect.CITY VALUES(1383,'Tabriz','IRN','East Azerbaidzan',1191043); 
INSERT INTO basicselect.CITY VALUES(1385,'Karaj','IRN','Teheran',940968); 
INSERT INTO basicselect.CITY VALUES(1508,'Bolzano','ITA','Trentino-Alto Adige',97232); 
INSERT INTO basicselect.CITY VALUES(1520,'Cesena','ITA','Emilia-Romagna',89852); 
INSERT INTO basicselect.CITY VALUES(1613,'Neyagawa','JPN','Osaka',257315); 
INSERT INTO basicselect.CITY VALUES(1630,'Ageo','JPN','Saitama',209442); 
INSERT INTO basicselect.CITY VALUES(1661,'Sayama','JPN','Saitama',162472);
INSERT INTO basicselect.CITY VALUES(1681,'Omuta','JPN','Fukuoka',142889);
INSERT INTO basicselect.CITY VALUES(1739,'Tokuyama','JPN','Yamaguchi',107078);
INSERT INTO basicselect.CITY VALUES(1793,'Novi Sad','YUG','Vojvodina',179626); 
INSERT INTO basicselect.CITY VALUES(1857,'Kelowna','CAN','British Colombia',89442); 
INSERT INTO basicselect.CITY VALUES(1895,'Harbin','CHN','Heilongjiang',4289800); 
INSERT INTO basicselect.CITY VALUES(1900,'Changchun','CHN','Jilin',2812000);
INSERT INTO basicselect.CITY VALUES(1913,'Lanzhou','CHN','Gansu',1565800); 
INSERT INTO basicselect.CITY VALUES(1947,'Changzhou','CHN','Jiangsu',530000);
INSERT INTO basicselect.CITY VALUES(2070,'Dezhou','CHN','Shandong',195485);
INSERT INTO basicselect.CITY VALUES(2081,'Heze','CHN','Shandong',189293);
INSERT INTO basicselect.CITY VALUES(2111,'Chenzhou','CHN','Hunan',169400);
INSERT INTO basicselect.CITY VALUES(2153,'Xianning','CHN','Hubei',136811);
INSERT INTO basicselect.CITY VALUES(2192,'Lhasa','CHN','Tibet',120000); 
INSERT INTO basicselect.CITY VALUES(2193,'Lianyuan','CHN','Hunan',118858);
INSERT INTO basicselect.CITY VALUES(2227,'Xingcheng','CHN','Liaoning',102384);
INSERT INTO basicselect.CITY VALUES(2273,'Villavicencio','COL','Meta',273140); 
INSERT INTO basicselect.CITY VALUES(2384,'Tong-yong','KOR','Kyongsangnam',131717);
INSERT INTO basicselect.CITY VALUES(2386,'Yongju','KOR','Kyongsangbuk',131097); 
INSERT INTO basicselect.CITY VALUES(2387,'Chinhae','KOR','Kyongsangnam',125997);
INSERT INTO basicselect.CITY VALUES(2388,'Sangju','KOR','Kyongsangbuk',124116); 
INSERT INTO basicselect.CITY VALUES(2406,'Herakleion','GRC','Crete',116178); 
INSERT INTO basicselect.CITY VALUES(2440,'Monrovia','LBR','Montserrado',850000);
INSERT INTO basicselect.CITY VALUES(2462,'Lilongwe','MWI','Lilongwe',435964); 
INSERT INTO basicselect.CITY VALUES(2505,'Taza','MAR','Taza-Al Hoceima-Taou',92700);
INSERT INTO basicselect.CITY VALUES(2555,'Xalapa','MEX','Veracruz',390058); 
INSERT INTO basicselect.CITY VALUES(2602,'Ocosingo','MEX','Chiapas',171495); 
INSERT INTO basicselect.CITY VALUES(2609,'Nogales','MEX','Sonora',159103);
INSERT INTO basicselect.CITY VALUES(2670,'San Pedro Cholula','MEX','Puebla',99734);
INSERT INTO basicselect.CITY VALUES(2689,'Palikir','FSM','Pohnpei',8600);
INSERT INTO basicselect.CITY VALUES(2706,'Tete','MOZ','Tete',101984);
INSERT INTO basicselect.CITY VALUES(2716,'Sittwe (Akyab)','MMR','Rakhine',137600);
INSERT INTO basicselect.CITY VALUES(2922,'Carolina','PRI','Carolina',186076); 
INSERT INTO basicselect.CITY VALUES(2967,'Grudziadz','POL','Kujawsko-Pomorskie',102434);
INSERT INTO basicselect.CITY VALUES(2972,'Malabo','GNQ','Bioko',40000);
INSERT INTO basicselect.CITY VALUES(3073,'Essen','DEU','Nordrhein-Westfalen',599515);
INSERT INTO basicselect.CITY VALUES(3169,'Apia','WSM','Upolu',35900);
INSERT INTO basicselect.CITY VALUES(3198,'Dakar','SEN','Cap-Vert',785071);
INSERT INTO basicselect.CITY VALUES(3253,'Hama','SYR','Hama',343361);
INSERT INTO basicselect.CITY VALUES(3288,'Luchou','TWN','Taipei',160516); 
INSERT INTO basicselect.CITY VALUES(3309,'Tanga','TZA','Tanga',137400); 
INSERT INTO basicselect.CITY VALUES(3353,'Sousse','TUN','Sousse',145900); 
INSERT INTO basicselect.CITY VALUES(3377,'Kahramanmaras','TUR','Kahramanmaras',245772); 
INSERT INTO basicselect.CITY VALUES(3430,'Odesa','UKR','Odesa',1011000);
INSERT INTO basicselect.CITY VALUES(3581,'St Petersburg','RUS','Pietari',4694000); 
INSERT INTO basicselect.CITY VALUES(3770,'Hanoi','VNM', 'Hanoi',1410000);
INSERT INTO basicselect.CITY VALUES(3815,'El Paso','USA','Texas',563662);
INSERT INTO basicselect.CITY VALUES(3878,'Scottsdale','USA','Arizona',202705);
INSERT INTO basicselect.CITY VALUES(3965,'Corona','USA','California',124966);
INSERT INTO basicselect.CITY VALUES(3973,'Concord','USA','California',121780);
INSERT INTO basicselect.CITY VALUES(3977,'Cedar Rapids','USA','Iowa',120758); 
INSERT INTO basicselect.CITY VALUES(3982,'Coral Springs','USA','Florida',117549);
INSERT INTO basicselect.CITY VALUES(4054,'Fairfield','USA','California',92256); 
INSERT INTO basicselect.CITY VALUES(4058,'Boulder','USA','Colorado',91238);
INSERT INTO basicselect.CITY VALUES(4061,'Fall River','USA','Massachusetts',90555);

COMMIT;

GO

DROP TABLE IF EXISTS basicselect.CITY2;

GO

CREATE TABLE basicselect.CITY2
(
   ID         	  int        		NOT NULL,
   NAME           varchar(17)       NOT NULL,
   COUNTRYCODE	  varchar(3)        NULL,
   DISTRICT       varchar(20)       NULL,
   POPULATION     int				NULL,
)

GO

raiserror('Now at the insert table section ....',0,1)

GO

BEGIN TRANSACTION

INSERT INTO basicselect.CITY2 VALUES(6,'Rotterdam','NLD','Zuid-Holland',593321);
INSERT INTO basicselect.CITY2 VALUES(19,'Zaanstad','NLD','Noord-Holland',135621); 
INSERT INTO basicselect.CITY2 VALUES(214,'Porto Alegre','BRA','Rio Grande do Sul',1314032); 
INSERT INTO basicselect.CITY2 VALUES(397,'Lauro de Freitas','BRA','Bahia',109236);
INSERT INTO basicselect.CITY2 VALUES(547,'Dobric','BGR','Varna',100399);
INSERT INTO basicselect.CITY2 VALUES(552,'Bujumbura','BDI','Bujumbura',300000);
INSERT INTO basicselect.CITY2 VALUES(554,'Santiago de Chile','CHL','Santiago',4703954);
INSERT INTO basicselect.CITY2 VALUES(626,'al-Minya','EGY','al-Minya',201360);
INSERT INTO basicselect.CITY2 VALUES(646,'Santa Ana','SLV','Santa Ana',139389);
INSERT INTO basicselect.CITY2 VALUES(762,'Bahir Dar','ETH','Amhara',96140);
INSERT INTO basicselect.CITY2 VALUES(796,'Baguio','PHL','CAR',252386);
INSERT INTO basicselect.CITY2 VALUES(896,'Malungon','PHL','Southern Mindanao',93232);
INSERT INTO basicselect.CITY2 VALUES(904,'Banjul','GMB','Banjul',42326);
INSERT INTO basicselect.CITY2 VALUES(924,'Villa Nueva','GTM','Guatemala',101295);
INSERT INTO basicselect.CITY2 VALUES(990,'Waru','IDN','East Java',124300);
INSERT INTO basicselect.CITY2 VALUES(1155,'Latur','IND','Maharashtra',197408);
INSERT INTO basicselect.CITY2 VALUES(1222,'Tenali','IND','Andhra Pradesh',143726);
INSERT INTO basicselect.CITY2 VALUES(1235,'Tirunelveli','IND','Tamil Nadu',135825);
INSERT INTO basicselect.CITY2 VALUES(1256,'Alandur','IND','Tamil Nadu',125244); 
INSERT INTO basicselect.CITY2 VALUES(1279,'Neyveli','IND','Tamil Nadu',118080);
INSERT INTO basicselect.CITY2 VALUES(1293,'Pallavaram','IND','Tamil Nadu',111866); 
INSERT INTO basicselect.CITY2 VALUES(1350,'Dehri','IND','Bihar',94526); 
INSERT INTO basicselect.CITY2 VALUES(1383,'Tabriz','IRN','East Azerbaidzan',1191043); 
INSERT INTO basicselect.CITY2 VALUES(1385,'Karaj','IRN','Teheran',940968); 
INSERT INTO basicselect.CITY2 VALUES(1508,'Bolzano','ITA','Trentino-Alto Adige',97232); 
INSERT INTO basicselect.CITY2 VALUES(1520,'Cesena','ITA','Emilia-Romagna',89852); 
INSERT INTO basicselect.CITY2 VALUES(1613,'Neyagawa','JPN','Osaka',257315); 
INSERT INTO basicselect.CITY2 VALUES(1630,'Ageo','JPN','Saitama',209442); 
INSERT INTO basicselect.CITY2 VALUES(1661,'Sayama','JPN','Saitama',162472);
INSERT INTO basicselect.CITY2 VALUES(1681,'Omuta','JPN','Fukuoka',142889);
INSERT INTO basicselect.CITY2 VALUES(1739,'Tokuyama','JPN','Yamaguchi',107078);
INSERT INTO basicselect.CITY2 VALUES(1793,'Novi Sad','YUG','Vojvodina',179626); 
INSERT INTO basicselect.CITY2 VALUES(1857,'Kelowna','CAN','British Colombia',89442); 
INSERT INTO basicselect.CITY2 VALUES(1895,'Harbin','CHN','Heilongjiang',4289800); 
INSERT INTO basicselect.CITY2 VALUES(1900,'Changchun','CHN','Jilin',2812000);
INSERT INTO basicselect.CITY2 VALUES(1913,'Lanzhou','CHN','Gansu',1565800); 
INSERT INTO basicselect.CITY2 VALUES(1947,'Changzhou','CHN','Jiangsu',530000);
INSERT INTO basicselect.CITY2 VALUES(2070,'Dezhou','CHN','Shandong',195485);
INSERT INTO basicselect.CITY2 VALUES(2081,'Heze','CHN','Shandong',189293);
INSERT INTO basicselect.CITY2 VALUES(2111,'Chenzhou','CHN','Hunan',169400);
INSERT INTO basicselect.CITY2 VALUES(2153,'Xianning','CHN','Hubei',136811);
INSERT INTO basicselect.CITY2 VALUES(2192,'Lhasa','CHN','Tibet',120000); 
INSERT INTO basicselect.CITY2 VALUES(2193,'Lianyuan','CHN','Hunan',118858);
INSERT INTO basicselect.CITY2 VALUES(2227,'Xingcheng','CHN','Liaoning',102384);
INSERT INTO basicselect.CITY2 VALUES(2273,'Villavicencio','COL','Meta',273140); 
INSERT INTO basicselect.CITY2 VALUES(2384,'Tong-yong','KOR','Kyongsangnam',131717);
INSERT INTO basicselect.CITY2 VALUES(2386,'Yongju','KOR','Kyongsangbuk',131097); 
INSERT INTO basicselect.CITY2 VALUES(2387,'Chinhae','KOR','Kyongsangnam',125997);
INSERT INTO basicselect.CITY2 VALUES(2388,'Sangju','KOR','Kyongsangbuk',124116); 
INSERT INTO basicselect.CITY2 VALUES(2406,'Herakleion','GRC','Crete',116178); 
INSERT INTO basicselect.CITY2 VALUES(2440,'Monrovia','LBR','Montserrado',850000);
INSERT INTO basicselect.CITY2 VALUES(2462,'Lilongwe','MWI','Lilongwe',435964); 
INSERT INTO basicselect.CITY2 VALUES(2505,'Taza','MAR','Taza-Al Hoceima-Taou',92700);
INSERT INTO basicselect.CITY2 VALUES(2555,'Xalapa','MEX','Veracruz',390058); 
INSERT INTO basicselect.CITY2 VALUES(2602,'Ocosingo','MEX','Chiapas',171495); 
INSERT INTO basicselect.CITY2 VALUES(2609,'Nogales','MEX','Sonora',159103);
INSERT INTO basicselect.CITY2 VALUES(2670,'San Pedro Cholula','MEX','Puebla',99734);
INSERT INTO basicselect.CITY2 VALUES(2689,'Palikir','FSM','Pohnpei',8600);
INSERT INTO basicselect.CITY2 VALUES(2706,'Tete','MOZ','Tete',101984);
INSERT INTO basicselect.CITY2 VALUES(2716,'Sittwe (Akyab)','MMR','Rakhine',137600);
INSERT INTO basicselect.CITY2 VALUES(2922,'Carolina','PRI','Carolina',186076); 
INSERT INTO basicselect.CITY2 VALUES(2967,'Grudziadz','POL','Kujawsko-Pomorskie',102434);
INSERT INTO basicselect.CITY2 VALUES(2972,'Malabo','GNQ','Bioko',40000);
INSERT INTO basicselect.CITY2 VALUES(3073,'Essen','DEU','Nordrhein-Westfalen',599515);
INSERT INTO basicselect.CITY2 VALUES(3169,'Apia','WSM','Upolu',35900);
INSERT INTO basicselect.CITY2 VALUES(3198,'Dakar','SEN','Cap-Vert',785071);
INSERT INTO basicselect.CITY2 VALUES(3253,'Hama','SYR','Hama',343361);
INSERT INTO basicselect.CITY2 VALUES(3288,'Luchou','TWN','Taipei',160516); 
INSERT INTO basicselect.CITY2 VALUES(3309,'Tanga','TZA','Tanga',137400); 
INSERT INTO basicselect.CITY2 VALUES(3353,'Sousse','TUN','Sousse',145900); 
INSERT INTO basicselect.CITY2 VALUES(3377,'Kahramanmaras','TUR','Kahramanmaras',245772); 
INSERT INTO basicselect.CITY2 VALUES(3430,'Odesa','UKR','Odesa',1011000);
INSERT INTO basicselect.CITY2 VALUES(3581,'St Petersburg','RUS','Pietari',4694000); 
INSERT INTO basicselect.CITY2 VALUES(3770,'Hanoi','VNM','Hanoi',1410000);
INSERT INTO basicselect.CITY2 VALUES(3815,'El Paso','USA','Texas',563662);
INSERT INTO basicselect.CITY2 VALUES(3878,'Scottsdale','USA','Arizona',202705);
INSERT INTO basicselect.CITY2 VALUES(3965,'Corona','USA','California',124966);
INSERT INTO basicselect.CITY2 VALUES(3973,'Concord','USA','California',121780);
INSERT INTO basicselect.CITY2 VALUES(3977,'Cedar Rapids','USA','Iowa',120758); 
INSERT INTO basicselect.CITY2 VALUES(3982,'Coral Springs','USA','Florida',117549);
INSERT INTO basicselect.CITY2 VALUES(4054,'Fairfield','USA','California',92256); 
INSERT INTO basicselect.CITY2 VALUES(4058,'Boulder','USA','Colorado',91238);
INSERT INTO basicselect.CITY2 VALUES(4061,'Fall River','USA','Massachusetts',90555);

COMMIT

GO

DROP TABLE IF EXISTS basicselect.STATION;

GO

/* Create a table called CITY */
CREATE TABLE basicselect.STATION
(
   ID         	  int        		NOT NULL,
   CITY           varchar(21)       NOT NULL,
   STATE		  varchar(2)        NULL,
   LAT_N	      int			    NULL,
   LONG_W	      int				NULL,
)

GO

raiserror('Now at the insert table section ....',0,1)

GO

BEGIN TRANSACTION

INSERT INTO basicselect.STATION VALUES (794,'Kissee Mills','MO',140,73); 
INSERT INTO basicselect.STATION VALUES (824,'Loma Mar','CA',49,131); 
INSERT INTO basicselect.STATION VALUES (603,'Sandy Hook','CT',72,148); 
INSERT INTO basicselect.STATION VALUES (478,'Tipton','IN',34,98); 
INSERT INTO basicselect.STATION VALUES (619,'Arlington','CO',75,93); 
INSERT INTO basicselect.STATION VALUES (711,'Turner','AR',50,101); 
INSERT INTO basicselect.STATION VALUES (839,'Slidell','LA',85,152); 
INSERT INTO basicselect.STATION VALUES (411,'Negreet','LA',99,105); 
INSERT INTO basicselect.STATION VALUES (588,'Glencoe','KY',46,136); 
INSERT INTO basicselect.STATION VALUES (665,'Chelsea','IA',99,60); 
INSERT INTO basicselect.STATION VALUES (342,'Chignik Lagoon','AK',103,153); 
INSERT INTO basicselect.STATION VALUES (733,'Pelahatchie','MS',39,28); 
INSERT INTO basicselect.STATION VALUES (441,'Hanna City','IL',51,137); 
INSERT INTO basicselect.STATION VALUES (811,'Dorrance','KS',102,122); 
INSERT INTO basicselect.STATION VALUES (698,'Albany','CA',50,80); 
INSERT INTO basicselect.STATION VALUES (325,'Monument','KS',71,142); 
INSERT INTO basicselect.STATION VALUES (414,'Manchester','MD',74,37); 
INSERT INTO basicselect.STATION VALUES (113,'Prescott','IA',40,66); 
INSERT INTO basicselect.STATION VALUES (971,'Graettinger','IA',95,150); 
INSERT INTO basicselect.STATION VALUES (266,'Cahone','CO',116,127); 
INSERT INTO basicselect.STATION VALUES (617,'Sturgis','MS',36,126); 
INSERT INTO basicselect.STATION VALUES (495,'Upperco','MD',114,30); 
INSERT INTO basicselect.STATION VALUES (473,'Highwood','IL',27,151); 
INSERT INTO basicselect.STATION VALUES (959,'Waipahu','HI',106,34); 
INSERT INTO basicselect.STATION VALUES (438,'Bowdon','GA',89,78); 
INSERT INTO basicselect.STATION VALUES (571,'Tyler','MN',133,59); 
INSERT INTO basicselect.STATION VALUES (92,'Watkins','CO',83,97); 
INSERT INTO basicselect.STATION VALUES (399,'Republic','MI',75,130); 
INSERT INTO basicselect.STATION VALUES (426,'Millville','CA',33,146); 
INSERT INTO basicselect.STATION VALUES (844,'Aguanga','CA',80,66); 
INSERT INTO basicselect.STATION VALUES (321,'Bowdon Junction','GA',86,34); 
INSERT INTO basicselect.STATION VALUES (606,'Morenci','AZ',105,110); 
INSERT INTO basicselect.STATION VALUES (957,'South El Monte','CA',74,80); 
INSERT INTO basicselect.STATION VALUES (833,'Hoskinston','KY',66,66); 
INSERT INTO basicselect.STATION VALUES (843,'Talbert','KY',40,59); 
INSERT INTO basicselect.STATION VALUES (166,'Mccomb','MS',74,43); 
INSERT INTO basicselect.STATION VALUES (339,'Kirk','CO',141,136); 
INSERT INTO basicselect.STATION VALUES (909,'Carlock','IL',117,85); 
INSERT INTO basicselect.STATION VALUES (829,'Seward','IL',72,90); 
INSERT INTO basicselect.STATION VALUES (766,'Gustine','CA',111,141); 
INSERT INTO basicselect.STATION VALUES (392,'Delano','CA',126,92); 
INSERT INTO basicselect.STATION VALUES (555,'Westphalia','MI',33,144); 
INSERT INTO basicselect.STATION VALUES (33,'Saint Elmo','AL',27,51); 
INSERT INTO basicselect.STATION VALUES (728,'Roy','MT',41,52); 
INSERT INTO basicselect.STATION VALUES (656,'Pattonsburg','MO',138,32); 
INSERT INTO basicselect.STATION VALUES (394,'Centertown','MO',134,93); 
INSERT INTO basicselect.STATION VALUES (366,'Norvell','MI',125,94); 
INSERT INTO basicselect.STATION VALUES (96,'Raymondville','MO',71,148); 
INSERT INTO basicselect.STATION VALUES (867,'Beaver Island','MI',82,165); 
INSERT INTO basicselect.STATION VALUES (977,'Odin','IL',53,116); 
INSERT INTO basicselect.STATION VALUES (741,'Jemison','AL',62,26); 
INSERT INTO basicselect.STATION VALUES (436,'West Hills','CA',68,73); 
INSERT INTO basicselect.STATION VALUES (323,'Barrigada','GU',61,148); 
INSERT INTO basicselect.STATION VALUES (3,'Hesperia','CA',106,71); 
INSERT INTO basicselect.STATION VALUES (814,'Wickliffe','KY',80,46); 
INSERT INTO basicselect.STATION VALUES (375,'Culdesac','ID',48,78); 
INSERT INTO basicselect.STATION VALUES (467,'Roselawn','IN',88,52); 
INSERT INTO basicselect.STATION VALUES (604,'Forest Lakes','AZ',145,114); 
INSERT INTO basicselect.STATION VALUES (551,'San Simeon','CA',38,28); 
INSERT INTO basicselect.STATION VALUES (706,'Little Rock','AR',122,121); 
INSERT INTO basicselect.STATION VALUES (647,'Portland','AR',84,45); 
INSERT INTO basicselect.STATION VALUES (25,'New Century','KS',135,79); 
INSERT INTO basicselect.STATION VALUES (250,'Hampden','MA',76,26); 
INSERT INTO basicselect.STATION VALUES (124,'Pine City','MN',119,129); 
INSERT INTO basicselect.STATION VALUES (547,'Sandborn','IN',56,94); 
INSERT INTO basicselect.STATION VALUES (701,'Seaton','IL',128,78); 
INSERT INTO basicselect.STATION VALUES (197,'Milledgeville','IL',91,113); 
INSERT INTO basicselect.STATION VALUES (613,'East China','MI',109,42); 
INSERT INTO basicselect.STATION VALUES (630,'Prince Frederick','MD',105,58); 
INSERT INTO basicselect.STATION VALUES (767,'Pomona Park','FL',101,163); 
INSERT INTO basicselect.STATION VALUES (679,'Gretna','LA',75,143); 
INSERT INTO basicselect.STATION VALUES (896,'Yazoo City','MS',95,85); 
INSERT INTO basicselect.STATION VALUES (403,'Zionsville','IN',58,36); 
INSERT INTO basicselect.STATION VALUES (519,'Rio Oso','CA',29,106); 
INSERT INTO basicselect.STATION VALUES (482,'Jolon','CA',67,53); 
INSERT INTO basicselect.STATION VALUES (252,'Childs','MD',93,104); 
INSERT INTO basicselect.STATION VALUES (600,'Shreveport','LA',136,39); 
INSERT INTO basicselect.STATION VALUES (14,'Forest','MS',120,50); 
INSERT INTO basicselect.STATION VALUES (260,'Sizerock','KY',116,113); 
INSERT INTO basicselect.STATION VALUES (65,'Buffalo Creek','CO',48,148); 
INSERT INTO basicselect.STATION VALUES (753,'Algonac','MI',119,80); 
INSERT INTO basicselect.STATION VALUES (174,'Onaway','MI',109,56); 
INSERT INTO basicselect.STATION VALUES (263,'Irvington','IL',97,68); 
INSERT INTO basicselect.STATION VALUES (253,'Winsted','MN',69,73); 
INSERT INTO basicselect.STATION VALUES (557,'Woodbury','GA',103,93); 
INSERT INTO basicselect.STATION VALUES (897,'Samantha','AL',75,36); 
INSERT INTO basicselect.STATION VALUES (98,'Hackleburg','AL',120,121); 
INSERT INTO basicselect.STATION VALUES (423,'Soldier','KS',77,153); 
INSERT INTO basicselect.STATION VALUES (361,'Arrowsmith','IL',28,109); 
INSERT INTO basicselect.STATION VALUES (409,'Columbus','GA',67,47); 
INSERT INTO basicselect.STATION VALUES (312,'Bentonville','AR',37,78); 
INSERT INTO basicselect.STATION VALUES (854,'Kirkland','AZ',86,58); 
INSERT INTO basicselect.STATION VALUES (160,'Grosse Pointe','MI',102,91); 
INSERT INTO basicselect.STATION VALUES (735,'Wilton','ME',57,157); 
INSERT INTO basicselect.STATION VALUES (608,'Busby','MT',104,30); 
INSERT INTO basicselect.STATION VALUES (122,'Robertsdale','AL',98,85); 
INSERT INTO basicselect.STATION VALUES (93,'Dale','IN',70,34); 
INSERT INTO basicselect.STATION VALUES (67,'Reeds','MO',31,43); 
INSERT INTO basicselect.STATION VALUES (906,'Hayfork','CA',35,117); 
INSERT INTO basicselect.STATION VALUES (34,'Mcbrides','MI',74,36); 
INSERT INTO basicselect.STATION VALUES (921,'Lee Center','IL',96,77); 
INSERT INTO basicselect.STATION VALUES (401,'Tennessee','IL',55,156); 
INSERT INTO basicselect.STATION VALUES (536,'Henderson','IA',78,78); 
INSERT INTO basicselect.STATION VALUES (953,'Udall','KS',113,60); 
INSERT INTO basicselect.STATION VALUES (370,'Palm Desert','CA',107,146); 
INSERT INTO basicselect.STATION VALUES (614,'Benedict','KS',138,96); 
INSERT INTO basicselect.STATION VALUES (998,'Oakfield','ME',48,132); 
INSERT INTO basicselect.STATION VALUES (805,'Tamms','IL',60,75); 
INSERT INTO basicselect.STATION VALUES (235,'Haubstadt','IN',28,32); 
INSERT INTO basicselect.STATION VALUES (820,'Chokio','MN',81,134); 
INSERT INTO basicselect.STATION VALUES (650,'Clancy','MT',46,164); 
INSERT INTO basicselect.STATION VALUES (791,'Scotts Valley','CA',120,91); 
INSERT INTO basicselect.STATION VALUES (324,'Norwood','MN',144,35); 
INSERT INTO basicselect.STATION VALUES (442,'Elkton','MD',103,157); 
INSERT INTO basicselect.STATION VALUES (633,'Bertha','MN',40,105); 
INSERT INTO basicselect.STATION VALUES (109,'Bridgeport','MI',51,80); 
INSERT INTO basicselect.STATION VALUES (780,'Cherry','IL',68,47); 
INSERT INTO basicselect.STATION VALUES (492,'Regina','KY',132,90); 
INSERT INTO basicselect.STATION VALUES (965,'Griffin','GA',39,152); 
INSERT INTO basicselect.STATION VALUES (778,'Pine Bluff','AR',60,146); 
INSERT INTO basicselect.STATION VALUES (337,'Mascotte','FL',121,146); 
INSERT INTO basicselect.STATION VALUES (259,'Baldwin','MD',82,40); 
INSERT INTO basicselect.STATION VALUES (955,'Netawaka','KS',109,120); 
INSERT INTO basicselect.STATION VALUES (752,'East Irvine','CA',106,115); 
INSERT INTO basicselect.STATION VALUES (886,'Pony','MT',99,163); 
INSERT INTO basicselect.STATION VALUES (200,'Franklin','LA',82,32); 
INSERT INTO basicselect.STATION VALUES (384,'Amo','IN',104,159); 
INSERT INTO basicselect.STATION VALUES (518,'Vulcan','MO',109,92); 
INSERT INTO basicselect.STATION VALUES (188,'Prairie Du Rocher','IL',76,71); 
INSERT INTO basicselect.STATION VALUES (161,'Alanson','MI',91,72); 
INSERT INTO basicselect.STATION VALUES (486,'Delta','LA',137,50); 
INSERT INTO basicselect.STATION VALUES (406,'Carver','MN',46,122); 
INSERT INTO basicselect.STATION VALUES (940,'Paron','AR',59,104); 
INSERT INTO basicselect.STATION VALUES (237,'Winchester','ID',38,80); 
INSERT INTO basicselect.STATION VALUES (465,'Jerome','AZ',122,34); 
INSERT INTO basicselect.STATION VALUES (591,'Baton Rouge','LA',130,72); 
INSERT INTO basicselect.STATION VALUES (570,'Greenview','CA',81,58); 
INSERT INTO basicselect.STATION VALUES (429,'Lucerne Valley','CA',36,48); 
INSERT INTO basicselect.STATION VALUES (278,'Cromwell','MN',129,54); 
INSERT INTO basicselect.STATION VALUES (927,'Quinter','KS',60,25); 
INSERT INTO basicselect.STATION VALUES (59,'Whitewater','MO',83,71); 
INSERT INTO basicselect.STATION VALUES (218,'Round Pond','ME',127,124); 
INSERT INTO basicselect.STATION VALUES (291,'Clarkdale','AZ',58,74); 
INSERT INTO basicselect.STATION VALUES (668,'Rockton','IL',116,87); 
INSERT INTO basicselect.STATION VALUES (682,'Pheba','MS',91,127); 
INSERT INTO basicselect.STATION VALUES (775,'Eleele','HI',81,153); 
INSERT INTO basicselect.STATION VALUES (527,'Auburn','IA',95,137); 
INSERT INTO basicselect.STATION VALUES (108,'North Berwick','ME',71,27); 
INSERT INTO basicselect.STATION VALUES (190,'Oconee','GA',93,119); 
INSERT INTO basicselect.STATION VALUES (232,'Grandville','MI',39,70); 
INSERT INTO basicselect.STATION VALUES (405,'Susanville','CA',128,80); 
INSERT INTO basicselect.STATION VALUES (273,'Rosie','AR',73,162); 
INSERT INTO basicselect.STATION VALUES (813,'Verona','MO',110,153); 
INSERT INTO basicselect.STATION VALUES (444,'Richland','GA',105,113); 
INSERT INTO basicselect.STATION VALUES (899,'Fremont','MI',54,151); 
INSERT INTO basicselect.STATION VALUES (738,'Philipsburg','MT',96,72); 
INSERT INTO basicselect.STATION VALUES (215,'Kensett','IA',56,140); 
INSERT INTO basicselect.STATION VALUES (743,'De Tour Village','MI',25,25); 
INSERT INTO basicselect.STATION VALUES (377,'Koleen','IN',138,111); 
INSERT INTO basicselect.STATION VALUES (727,'Winslow','IL',113,39); 
INSERT INTO basicselect.STATION VALUES (363,'Reasnor','IA',42,163); 
INSERT INTO basicselect.STATION VALUES (117,'West Grove','IA',127,99); 
INSERT INTO basicselect.STATION VALUES (420,'Frankfort Heights','IL',72,30); 
INSERT INTO basicselect.STATION VALUES (888,'Bono','AR',133,150); 
INSERT INTO basicselect.STATION VALUES (784,'Biggsville','IL',86,139); 
INSERT INTO basicselect.STATION VALUES (413,'Linthicum Heights','MD',128,68); 
INSERT INTO basicselect.STATION VALUES (695,'Amazonia','MO',46,148); 
INSERT INTO basicselect.STATION VALUES (609,'Marysville','MI',86,133); 
INSERT INTO basicselect.STATION VALUES (471,'Cape Girardeau','MO',74,91); 
INSERT INTO basicselect.STATION VALUES (649,'Pengilly','MN',25,154); 
INSERT INTO basicselect.STATION VALUES (946,'Newton Center','MA',48,145); 
INSERT INTO basicselect.STATION VALUES (380,'Crane Lake','MN',73,43); 
INSERT INTO basicselect.STATION VALUES (383,'Newbury','MA',128,85); 
INSERT INTO basicselect.STATION VALUES (44,'Kismet','KS',100,157); 
INSERT INTO basicselect.STATION VALUES (433,'Canton','ME',99,106); 
INSERT INTO basicselect.STATION VALUES (283,'Clipper Mills','CA',114,57); 
INSERT INTO basicselect.STATION VALUES (474,'Grayslake','IL',61,33); 
INSERT INTO basicselect.STATION VALUES (233,'Pierre Part','LA',52,90); 
INSERT INTO basicselect.STATION VALUES (990,'Bison','KS',132,75); 
INSERT INTO basicselect.STATION VALUES (502,'Bellevue','KY',127,122); 
INSERT INTO basicselect.STATION VALUES (327,'Ridgway','CO',77,110); 
INSERT INTO basicselect.STATION VALUES (4,'South Britain','CT',66,34); 
INSERT INTO basicselect.STATION VALUES (228,'Rydal','GA',36,79); 
INSERT INTO basicselect.STATION VALUES (642,'Lynnville','KY',25,146); 
INSERT INTO basicselect.STATION VALUES (885,'Deerfield','MO',40,36); 
INSERT INTO basicselect.STATION VALUES (539,'Montreal','MO',129,127); 
INSERT INTO basicselect.STATION VALUES (202,'Hope','MN',140,44); 
INSERT INTO basicselect.STATION VALUES (593,'Aliso Viejo','CA',68,131); 
INSERT INTO basicselect.STATION VALUES (521,'Gowrie','IA',130,128); 
INSERT INTO basicselect.STATION VALUES (938,'Andersonville','GA',141,73); 
INSERT INTO basicselect.STATION VALUES (919,'Knob Lick','KY',136,33); 
INSERT INTO basicselect.STATION VALUES (528,'Crouseville','ME',37,82); 
INSERT INTO basicselect.STATION VALUES (331,'Cranks','KY',56,27); 
INSERT INTO basicselect.STATION VALUES (45,'Rives Junction','MI',94,117); 
INSERT INTO basicselect.STATION VALUES (944,'Ledyard','CT',135,144); 
INSERT INTO basicselect.STATION VALUES (949,'Norway','ME',84,88); 
INSERT INTO basicselect.STATION VALUES (88,'Eros','LA',95,58); 
INSERT INTO basicselect.STATION VALUES (878,'Rantoul','KS',32,119); 
INSERT INTO basicselect.STATION VALUES (35,'Richmond Hill','GA',39,114); 
INSERT INTO basicselect.STATION VALUES (17,'Fredericktown','MO',106,113); 
INSERT INTO basicselect.STATION VALUES (447,'Arkadelphia','AR',99,50); 
INSERT INTO basicselect.STATION VALUES (498,'Glen Carbon','IL',61,141); 
INSERT INTO basicselect.STATION VALUES (351,'Fredericksburg','IN',45,78); 
INSERT INTO basicselect.STATION VALUES (774,'Manchester','IA',130,123); 
INSERT INTO basicselect.STATION VALUES (116,'Mc Henry','MD',93,113); 
INSERT INTO basicselect.STATION VALUES (963,'Eriline','KY',94,65); 
INSERT INTO basicselect.STATION VALUES (643,'Wellington','KY',100,32); 
INSERT INTO basicselect.STATION VALUES (781,'Hoffman Estates','IL',129,53); 
INSERT INTO basicselect.STATION VALUES (364,'Howard Lake','MN',126,78); 
INSERT INTO basicselect.STATION VALUES (777,'Edgewater','MD',130,72); 
INSERT INTO basicselect.STATION VALUES (15,'Ducor','CA',141,102); 
INSERT INTO basicselect.STATION VALUES (910,'Salem','KY',87,114); 
INSERT INTO basicselect.STATION VALUES (612,'Sturdivant','MO',94,86); 
INSERT INTO basicselect.STATION VALUES (537,'Hagatna','GU',97,152); 
INSERT INTO basicselect.STATION VALUES (970,'East Haddam','CT',116,132); 
INSERT INTO basicselect.STATION VALUES (510,'Eastlake','MI',134,39); 
INSERT INTO basicselect.STATION VALUES (354,'Larkspur','CA',107,66); 
INSERT INTO basicselect.STATION VALUES (983,'Patriot','IN',83,46); 
INSERT INTO basicselect.STATION VALUES (799,'Corriganville','MD',141,154); 
INSERT INTO basicselect.STATION VALUES (581,'Carlos','MN',115,66); 
INSERT INTO basicselect.STATION VALUES (825,'Addison','MI',96,142); 
INSERT INTO basicselect.STATION VALUES (526,'Tarzana','CA',136,81); 
INSERT INTO basicselect.STATION VALUES (176,'Grapevine','AR',92,85); 
INSERT INTO basicselect.STATION VALUES (994,'Kanorado','KS',65,86); 
INSERT INTO basicselect.STATION VALUES (704,'Climax','MI',127,107); 
INSERT INTO basicselect.STATION VALUES (582,'Curdsville','KY',85,150); 
INSERT INTO basicselect.STATION VALUES (884,'Southport','CT',59,63); 
INSERT INTO basicselect.STATION VALUES (196,'Compton','IL',107,99); 
INSERT INTO basicselect.STATION VALUES (605,'Notasulga','AL',67,116); 
INSERT INTO basicselect.STATION VALUES (430,'Rumsey','KY',71,50); 
INSERT INTO basicselect.STATION VALUES (234,'Rogers','CT',140,33); 
INSERT INTO basicselect.STATION VALUES (700,'Pleasant Grove','AR',135,146); 
INSERT INTO basicselect.STATION VALUES (702,'Everton','MO',119,51); 
INSERT INTO basicselect.STATION VALUES (662,'Skanee','MI',70,130); 
INSERT INTO basicselect.STATION VALUES (171,'Springerville','AZ',125,151); 
INSERT INTO basicselect.STATION VALUES (615,'Libertytown','MD',145,112); 
INSERT INTO basicselect.STATION VALUES (26,'Church Creek','MD',39,91); 
INSERT INTO basicselect.STATION VALUES (692,'Yellow Pine','ID',83,151); 
INSERT INTO basicselect.STATION VALUES (336,'Dumont','MN',57,129); 
INSERT INTO basicselect.STATION VALUES (464,'Gales Ferry','CT',105,37); 
INSERT INTO basicselect.STATION VALUES (315,'Ravenna','KY',79,106); 
INSERT INTO basicselect.STATION VALUES (505,'Williams','AZ',73,112); 
INSERT INTO basicselect.STATION VALUES (842,'Decatur','MI',63,161); 
INSERT INTO basicselect.STATION VALUES (982,'Holbrook','AZ',135,104); 
INSERT INTO basicselect.STATION VALUES (868,'Sherrill','AR',80,152); 
INSERT INTO basicselect.STATION VALUES (554,'Brownsdale','MN',52,51); 
INSERT INTO basicselect.STATION VALUES (199,'Linden','MI',53,33); 
INSERT INTO basicselect.STATION VALUES (453,'Sedgwick','AR',69,75); 
INSERT INTO basicselect.STATION VALUES (451,'Fort Atkinson','IA',143,141); 
INSERT INTO basicselect.STATION VALUES (950,'Peachtree City','GA',80,156); 
INSERT INTO basicselect.STATION VALUES (326,'Rocheport','MO',114,64); 
INSERT INTO basicselect.STATION VALUES (189,'West Somerset','KY',74,45); 
INSERT INTO basicselect.STATION VALUES (638,'Clovis','CA',92,138); 
INSERT INTO basicselect.STATION VALUES (156,'Heyburn','ID',82,121); 
INSERT INTO basicselect.STATION VALUES (861,'Peabody','KS',75,152); 
INSERT INTO basicselect.STATION VALUES (722,'Marion Junction','AL',53,31); 
INSERT INTO basicselect.STATION VALUES (428,'Randall','KS',48,136); 
INSERT INTO basicselect.STATION VALUES (677,'Hayesville','IA',120,42); 
INSERT INTO basicselect.STATION VALUES (183,'Jordan','MN',69,35); 
INSERT INTO basicselect.STATION VALUES (322,'White Horse Beach','MA',54,59); 
INSERT INTO basicselect.STATION VALUES (827,'Greenville','IL',51,153); 
INSERT INTO basicselect.STATION VALUES (242,'Macy','IN',139,152); 
INSERT INTO basicselect.STATION VALUES (621,'Flowood','MS',65,149); 
INSERT INTO basicselect.STATION VALUES (960,'Deep River','IA',75,39); 
INSERT INTO basicselect.STATION VALUES (180,'Napoleon','IN',32,160); 
INSERT INTO basicselect.STATION VALUES (382,'Leavenworth','IN',100,122); 
INSERT INTO basicselect.STATION VALUES (853,'Coldwater','KS',48,26); 
INSERT INTO basicselect.STATION VALUES (105,'Weldon','CA',134,119); 
INSERT INTO basicselect.STATION VALUES (357,'Yellville','AR',36,42); 
INSERT INTO basicselect.STATION VALUES (710,'Turners Falls','MA',31,125); 
INSERT INTO basicselect.STATION VALUES (520,'Delray Beach','FL',27,159); 
INSERT INTO basicselect.STATION VALUES (920,'Eustis','FL',43,39); 
INSERT INTO basicselect.STATION VALUES (684,'Mineral Point','MO',91,41); 
INSERT INTO basicselect.STATION VALUES (355,'Weldona','CO',33,58); 
INSERT INTO basicselect.STATION VALUES (389,'Midpines','CA',106,59); 
INSERT INTO basicselect.STATION VALUES (303,'Cascade','ID',32,157); 
INSERT INTO basicselect.STATION VALUES (501,'Tefft','IN',93,150); 
INSERT INTO basicselect.STATION VALUES (673,'Showell','MD',44,164); 
INSERT INTO basicselect.STATION VALUES (834,'Bayville','ME',107,143); 
INSERT INTO basicselect.STATION VALUES (255,'Brighton','IL',108,33); 
INSERT INTO basicselect.STATION VALUES (595,'Grimes','IA',42,75); 
INSERT INTO basicselect.STATION VALUES (709,'Nubieber','CA',133,49); 
INSERT INTO basicselect.STATION VALUES (100,'North Monmouth','ME',131,78); 
INSERT INTO basicselect.STATION VALUES (522,'Harmony','MN',124,126); 
INSERT INTO basicselect.STATION VALUES (16,'Beaufort','MO',72,86); 
INSERT INTO basicselect.STATION VALUES (231,'Arispe','IA',31,138); 
INSERT INTO basicselect.STATION VALUES (923,'Union Star','MO',79,133); 
INSERT INTO basicselect.STATION VALUES (891,'Humeston','IA',75,122); 
INSERT INTO basicselect.STATION VALUES (165,'Baileyville','IL',82,61); 
INSERT INTO basicselect.STATION VALUES (757,'Lakeville','CT',60,95); 
INSERT INTO basicselect.STATION VALUES (506,'Firebrick','KY',50,95); 
INSERT INTO basicselect.STATION VALUES (76,'Pico Rivera','CA',143,117); 
INSERT INTO basicselect.STATION VALUES (246,'Ludington','MI',30,120); 
INSERT INTO basicselect.STATION VALUES (583,'Channing','MI',117,57); 
INSERT INTO basicselect.STATION VALUES (666,'West Baden Springs','IN',30,96); 
INSERT INTO basicselect.STATION VALUES (373,'Pawnee','IL',85,81); 
INSERT INTO basicselect.STATION VALUES (504,'Melber','KY',37,56); 
INSERT INTO basicselect.STATION VALUES (901,'Manchester','MN',71,84); 
INSERT INTO basicselect.STATION VALUES (306,'Bainbridge','GA',62,57); 
INSERT INTO basicselect.STATION VALUES (821,'Sanders','AZ',131,97); 
INSERT INTO basicselect.STATION VALUES (586,'Ottertail','MN',100,44); 
INSERT INTO basicselect.STATION VALUES (95,'Dupo','IL',41,29); 
INSERT INTO basicselect.STATION VALUES (524,'Montrose','CA',136,119); 
INSERT INTO basicselect.STATION VALUES (716,'Schleswig','IA',119,52); 
INSERT INTO basicselect.STATION VALUES (849,'Harbor Springs','MI',141,149); 
INSERT INTO basicselect.STATION VALUES (611,'Richmond','IL',113,163); 
INSERT INTO basicselect.STATION VALUES (904,'Ermine','KY',120,63); 
INSERT INTO basicselect.STATION VALUES (740,'Siler','KY',137,117); 
INSERT INTO basicselect.STATION VALUES (439,'Reeves','LA',35,51); 
INSERT INTO basicselect.STATION VALUES (57,'Clifton','AZ',30,136); 
INSERT INTO basicselect.STATION VALUES (155,'Casco','MI',139,109); 
INSERT INTO basicselect.STATION VALUES (755,'Sturgis','MI',117,135); 
INSERT INTO basicselect.STATION VALUES (11,'Crescent City','FL',58,118); 
INSERT INTO basicselect.STATION VALUES (287,'Madisonville','LA',112,53); 
INSERT INTO basicselect.STATION VALUES (435,'Albion','IN',44,122); 
INSERT INTO basicselect.STATION VALUES (672,'Lismore','MN',59,104); 
INSERT INTO basicselect.STATION VALUES (572,'Athens','IN',75,121); 
INSERT INTO basicselect.STATION VALUES (890,'Eufaula','AL',140,103); 
INSERT INTO basicselect.STATION VALUES (975,'Panther Burn','MS',117,165); 
INSERT INTO basicselect.STATION VALUES (914,'Hanscom Afb','MA',129,136); 
INSERT INTO basicselect.STATION VALUES (119,'Wildie','KY',70,112); 
INSERT INTO basicselect.STATION VALUES (540,'Mosca','CO',89,141); 
INSERT INTO basicselect.STATION VALUES (678,'Bennington','IN',36,27); 
INSERT INTO basicselect.STATION VALUES (208,'Lottie','LA',110,83); 
INSERT INTO basicselect.STATION VALUES (512,'Garland','ME',109,134); 
INSERT INTO basicselect.STATION VALUES (352,'Clutier','IA',61,127); 
INSERT INTO basicselect.STATION VALUES (948,'Lupton','MI',140,53); 
INSERT INTO basicselect.STATION VALUES (503,'Northfield','MN',61,37); 
INSERT INTO basicselect.STATION VALUES (288,'Daleville','AL',122,136); 
INSERT INTO basicselect.STATION VALUES (560,'Osage City','KS',110,90); 
INSERT INTO basicselect.STATION VALUES (479,'Cuba','MO',64,88); 
INSERT INTO basicselect.STATION VALUES (826,'Norris','MT',47,37); 
INSERT INTO basicselect.STATION VALUES (651,'Clopton','AL',41,85); 
INSERT INTO basicselect.STATION VALUES (143,'Renville','MN',142,99); 
INSERT INTO basicselect.STATION VALUES (240,'Saint Paul','KS',66,163); 
INSERT INTO basicselect.STATION VALUES (102,'Kirksville','MO',140,144); 
INSERT INTO basicselect.STATION VALUES (69,'Kingsland','AR',78,85); 
INSERT INTO basicselect.STATION VALUES (181,'Fairview','KS',80,165); 
INSERT INTO basicselect.STATION VALUES (175,'Lydia','LA',42,40); 
INSERT INTO basicselect.STATION VALUES (80,'Bridgton','ME',93,140); 
INSERT INTO basicselect.STATION VALUES (596,'Brownstown','IL',49,63); 
INSERT INTO basicselect.STATION VALUES (301,'Monona','IA',144,82); 
INSERT INTO basicselect.STATION VALUES (987,'Hartland','MI',136,108); 
INSERT INTO basicselect.STATION VALUES (973,'Andover','CT',52,53); 
INSERT INTO basicselect.STATION VALUES (981,'Lakota','IA',56,92); 
INSERT INTO basicselect.STATION VALUES (440,'Grand Terrace','CA',37,127); 
INSERT INTO basicselect.STATION VALUES (110,'Mesick','MI',82,109); 
INSERT INTO basicselect.STATION VALUES (396,'Dryden','MI',70,48); 
INSERT INTO basicselect.STATION VALUES (637,'Beverly','KY',58,127); 
INSERT INTO basicselect.STATION VALUES (566,'Marine On Saint Croix','MN',126,116); 
INSERT INTO basicselect.STATION VALUES (801,'Pocahontas','IL',110,83); 
INSERT INTO basicselect.STATION VALUES (739,'Fort Meade','FL',44,35); 
INSERT INTO basicselect.STATION VALUES (130,'Hayneville','AL',110,157); 
INSERT INTO basicselect.STATION VALUES (345,'Yoder','IN',83,144); 
INSERT INTO basicselect.STATION VALUES (851,'Gatewood','MO',76,146); 
INSERT INTO basicselect.STATION VALUES (489,'Madden','MS',81,99); 
INSERT INTO basicselect.STATION VALUES (223,'Losantville','IN',113,107); 
INSERT INTO basicselect.STATION VALUES (538,'Cheswold','DE',32,59); 
INSERT INTO basicselect.STATION VALUES (329,'Caseville','MI',103,98); 
INSERT INTO basicselect.STATION VALUES (815,'Pomona','MO',52,50); 
INSERT INTO basicselect.STATION VALUES (789,'Hopkinsville','KY',27,48); 
INSERT INTO basicselect.STATION VALUES (269,'Jack','AL',50,86); 
INSERT INTO basicselect.STATION VALUES (969,'Dixie','GA',27,36); 
INSERT INTO basicselect.STATION VALUES (271,'Hillside','CO',99,69); 
INSERT INTO basicselect.STATION VALUES (667,'Hawarden','IA',91,47); 
INSERT INTO basicselect.STATION VALUES (350,'Cannonsburg','MI',91,121); 
INSERT INTO basicselect.STATION VALUES (49,'Osborne','KS',70,140); 
INSERT INTO basicselect.STATION VALUES (332,'Elm Grove','LA',46,29); 
INSERT INTO basicselect.STATION VALUES (172,'Atlantic Mine','MI',131,99); 
INSERT INTO basicselect.STATION VALUES (699,'North Branford','CT',38,95); 
INSERT INTO basicselect.STATION VALUES (417,'New Liberty','IA',140,95); 
INSERT INTO basicselect.STATION VALUES (99,'Woodstock Valley','CT',117,163); 
INSERT INTO basicselect.STATION VALUES (404,'Farmington','IL',92,72); 
INSERT INTO basicselect.STATION VALUES (23,'Honolulu','HI',110,140); 
INSERT INTO basicselect.STATION VALUES (1,'Pfeifer','KS',37,66); 
INSERT INTO basicselect.STATION VALUES (127,'Oshtemo','MI',100,136); 
INSERT INTO basicselect.STATION VALUES (657,'Gridley','KS',118,56); 
INSERT INTO basicselect.STATION VALUES (261,'Fulton','KY',111,52); 
INSERT INTO basicselect.STATION VALUES (182,'Winter Park','FL',133,33); 
INSERT INTO basicselect.STATION VALUES (328,'Monroe','LA',28,108); 
INSERT INTO basicselect.STATION VALUES (779,'Del Mar','CA',59,96); 
INSERT INTO basicselect.STATION VALUES (646,'Greens Fork','IN',134,135); 
INSERT INTO basicselect.STATION VALUES (756,'Garden City','AL',96,105); 
INSERT INTO basicselect.STATION VALUES (157,'Blue River','KY',117,162); 
INSERT INTO basicselect.STATION VALUES (400,'New Ross','IN',134,121); 
INSERT INTO basicselect.STATION VALUES (61,'Brilliant','AL',86,160); 
INSERT INTO basicselect.STATION VALUES (610,'Archie','MO',40,28); 
INSERT INTO basicselect.STATION VALUES (985,'Winslow','AR',126,126); 
INSERT INTO basicselect.STATION VALUES (207,'Olmitz','KS',29,38); 
INSERT INTO basicselect.STATION VALUES (941,'Allerton','IA',62,113); 
INSERT INTO basicselect.STATION VALUES (70,'Norphlet','AR',144,61); 
INSERT INTO basicselect.STATION VALUES (343,'Mechanic Falls','ME',72,71); 
INSERT INTO basicselect.STATION VALUES (531,'North Middletown','KY',43,142); 
INSERT INTO basicselect.STATION VALUES (996,'Keyes','CA',77,86); 
INSERT INTO basicselect.STATION VALUES (167,'Equality','AL',107,116); 
INSERT INTO basicselect.STATION VALUES (750,'Neon','KY',102,148); 
INSERT INTO basicselect.STATION VALUES (410,'Calhoun','KY',96,57); 
INSERT INTO basicselect.STATION VALUES (725,'Alpine','AR',117,115); 
INSERT INTO basicselect.STATION VALUES (988,'Mullan','ID',143,155); 
INSERT INTO basicselect.STATION VALUES (55,'Coalgood','KY',57,149); 
INSERT INTO basicselect.STATION VALUES (640,'Walnut','MS',41,77); 
INSERT INTO basicselect.STATION VALUES (302,'Saint Petersburg','FL',52,120); 
INSERT INTO basicselect.STATION VALUES (387,'Ojai','CA',69,119); 
INSERT INTO basicselect.STATION VALUES (476,'Julian','CA',131,102); 
INSERT INTO basicselect.STATION VALUES (907,'Veedersburg','IN',79,95); 
INSERT INTO basicselect.STATION VALUES (294,'Orange Park','FL',59,137); 
INSERT INTO basicselect.STATION VALUES (661,'Payson','AZ',126,154); 
INSERT INTO basicselect.STATION VALUES (745,'Windom','KS',114,126); 
INSERT INTO basicselect.STATION VALUES (631,'Urbana','IA',143,29); 
INSERT INTO basicselect.STATION VALUES (356,'Ludlow','CA',111,88); 
INSERT INTO basicselect.STATION VALUES (419,'Lindsay','MT',143,68); 
INSERT INTO basicselect.STATION VALUES (494,'Palatka','FL',95,52); 
INSERT INTO basicselect.STATION VALUES (625,'Bristol','ME',88,95); 
INSERT INTO basicselect.STATION VALUES (459,'Harmony','IN',135,71); 
INSERT INTO basicselect.STATION VALUES (636,'Ukiah','CA',87,90); 
INSERT INTO basicselect.STATION VALUES (106,'Yuma','AZ',111,154); 
INSERT INTO basicselect.STATION VALUES (204,'Alba','MI',92,104); 
INSERT INTO basicselect.STATION VALUES (344,'Zachary','LA',61,152); 
INSERT INTO basicselect.STATION VALUES (599,'Esmond','IL',76,91); 
INSERT INTO basicselect.STATION VALUES (515,'Waresboro','GA',144,154); 
INSERT INTO basicselect.STATION VALUES (497,'Hills','MN',138,135); 
INSERT INTO basicselect.STATION VALUES (162,'Montgomery City','MO',70,45); 
INSERT INTO basicselect.STATION VALUES (499,'Delavan','MN',33,65); 
INSERT INTO basicselect.STATION VALUES (362,'Magnolia','MS',113,32); 
INSERT INTO basicselect.STATION VALUES (545,'Byron','CA',137,120); 
INSERT INTO basicselect.STATION VALUES (712,'Dundee','IA',62,105); 
INSERT INTO basicselect.STATION VALUES (257,'Eureka Springs','AR',72,35); 
INSERT INTO basicselect.STATION VALUES (154,'Baker','CA',31,148); 
INSERT INTO basicselect.STATION VALUES (715,'Hyde Park','MA',65,156); 
INSERT INTO basicselect.STATION VALUES (493,'Groveoak','AL',53,88); 
INSERT INTO basicselect.STATION VALUES (836,'Kenner','LA',92,127); 
INSERT INTO basicselect.STATION VALUES (82,'Many','LA',36,95); 
INSERT INTO basicselect.STATION VALUES (644,'Seward','AK',120,36); 
INSERT INTO basicselect.STATION VALUES (391,'Berryton','KS',61,140); 
INSERT INTO basicselect.STATION VALUES (696,'Chilhowee','MO',80,49); 
INSERT INTO basicselect.STATION VALUES (905,'Newark','IL',73,130); 
INSERT INTO basicselect.STATION VALUES (81,'Cowgill','MO',137,28); 
INSERT INTO basicselect.STATION VALUES (31,'Novinger','MO',108,112); 
INSERT INTO basicselect.STATION VALUES (299,'Goodman','MS',101,117); 
INSERT INTO basicselect.STATION VALUES (84,'Cobalt','CT',87,27); 
INSERT INTO basicselect.STATION VALUES (754,'South Haven','MI',145,53); 
INSERT INTO basicselect.STATION VALUES (144,'Eskridge','KS',108,63); 
INSERT INTO basicselect.STATION VALUES (305,'Bennington','KS',94,83); 
INSERT INTO basicselect.STATION VALUES (226,'Decatur','MS',71,118); 
INSERT INTO basicselect.STATION VALUES (224,'West Hyannisport','MA',59,96); 
INSERT INTO basicselect.STATION VALUES (694,'Ozona','FL',145,121); 
INSERT INTO basicselect.STATION VALUES (623,'Jackson','AL',111,67); 
INSERT INTO basicselect.STATION VALUES (543,'Lapeer','MI',129,114); 
INSERT INTO basicselect.STATION VALUES (819,'Peaks Island','ME',59,111); 
INSERT INTO basicselect.STATION VALUES (243,'Hazlehurst','MS',49,109); 
INSERT INTO basicselect.STATION VALUES (457,'Chester','CA',70,124); 
INSERT INTO basicselect.STATION VALUES (871,'Clarkston','MI',94,81); 
INSERT INTO basicselect.STATION VALUES (470,'Healdsburg','CA',111,54); 
INSERT INTO basicselect.STATION VALUES (705,'Hotchkiss','CO',70,72); 
INSERT INTO basicselect.STATION VALUES (690,'Ravenden Springs','AR',68,108); 
INSERT INTO basicselect.STATION VALUES (62,'Monroe','AR',132,150); 
INSERT INTO basicselect.STATION VALUES (365,'Payson','IL',82,92); 
INSERT INTO basicselect.STATION VALUES (922,'Kell','IL',70,59); 
INSERT INTO basicselect.STATION VALUES (838,'Strasburg','CO',89,48); 
INSERT INTO basicselect.STATION VALUES (286,'Five Points','AL',46,122); 
INSERT INTO basicselect.STATION VALUES (968,'Norris City','IL',54,76); 
INSERT INTO basicselect.STATION VALUES (928,'Coaling','AL',144,52); 
INSERT INTO basicselect.STATION VALUES (746,'Orange City','IA',94,163); 
INSERT INTO basicselect.STATION VALUES (892,'Effingham','KS',133,98); 
INSERT INTO basicselect.STATION VALUES (193,'Corcoran','CA',81,140); 
INSERT INTO basicselect.STATION VALUES (225,'Garden City','IA',54,120); 
INSERT INTO basicselect.STATION VALUES (573,'Alton','MO',80,112); 
INSERT INTO basicselect.STATION VALUES (830,'Greenway','AR',119,36); 
INSERT INTO basicselect.STATION VALUES (241,'Woodsboro','MD',77,142); 
INSERT INTO basicselect.STATION VALUES (783,'Strawn','IL',30,51); 
INSERT INTO basicselect.STATION VALUES (675,'Dent','MN',71,137); 
INSERT INTO basicselect.STATION VALUES (270,'Shingletown','CA',61,102); 
INSERT INTO basicselect.STATION VALUES (378,'Clio','IA',46,115); 
INSERT INTO basicselect.STATION VALUES (104,'Yalaha','FL',120,120); 
INSERT INTO basicselect.STATION VALUES (460,'Leakesville','MS',107,73); 
INSERT INTO basicselect.STATION VALUES (804,'Fort Lupton','CO',39,93); 
INSERT INTO basicselect.STATION VALUES (53,'Shasta','CA',99,156); 
INSERT INTO basicselect.STATION VALUES (448,'Canton','MN',124,151); 
INSERT INTO basicselect.STATION VALUES (751,'Agency','MO',59,96); 
INSERT INTO basicselect.STATION VALUES (29,'South Carrollton','KY',58,117); 
INSERT INTO basicselect.STATION VALUES (718,'Taft','CA',108,147); 
INSERT INTO basicselect.STATION VALUES (213,'Calpine','CA',47,43); 
INSERT INTO basicselect.STATION VALUES (624,'Knobel','AR',95,62); 
INSERT INTO basicselect.STATION VALUES (908,'Bullhead City','AZ',95,30); 
INSERT INTO basicselect.STATION VALUES (845,'Tina','MO',132,28); 
INSERT INTO basicselect.STATION VALUES (685,'Anthony','KS',45,161); 
INSERT INTO basicselect.STATION VALUES (731,'Emmett','ID',57,32); 
INSERT INTO basicselect.STATION VALUES (311,'South Haven','MN',30,87); 
INSERT INTO basicselect.STATION VALUES (866,'Haverhill','IA',62,109); 
INSERT INTO basicselect.STATION VALUES (598,'Middleboro','MA',108,149); 
INSERT INTO basicselect.STATION VALUES (541,'Siloam','GA',105,92); 
INSERT INTO basicselect.STATION VALUES (889,'Lena','LA',78,130); 
INSERT INTO basicselect.STATION VALUES (654,'Lee','IL',28,51); 
INSERT INTO basicselect.STATION VALUES (841,'Freeport','MI',114,51); 
INSERT INTO basicselect.STATION VALUES (446,'Mid Florida','FL',110,51); 
INSERT INTO basicselect.STATION VALUES (249,'Acme','LA',73,68); 
INSERT INTO basicselect.STATION VALUES (376,'Gorham','KS',111,65); 
INSERT INTO basicselect.STATION VALUES (136,'Bass Harbor','ME',138,61); 
INSERT INTO basicselect.STATION VALUES (455,'Granger','IA',33,102); 

COMMIT

GO

raiserror('Now at the Creating table section ....',0,1)

GO

DROP TABLE IF EXISTS basicselect.STUDENTS;

GO

/* Create a table called STUDENTS */
CREATE TABLE basicselect.STUDENTS
(
   ID         	 int        		NOT NULL,
   NAME          varchar(21)        NOT NULL,
   MARKS	     int				NULL,
)

GO

raiserror('Now at the insert table section ....',0,1)

GO

BEGIN TRANSACTION

INSERT INTO basicselect.STUDENTS VALUES (19,'Samantha',87); 
INSERT INTO basicselect.STUDENTS VALUES (21,'Julia',96); 
INSERT INTO basicselect.STUDENTS VALUES (11,'Britney',95); 
INSERT INTO basicselect.STUDENTS VALUES (32,'Kristeen',100); 
INSERT INTO basicselect.STUDENTS VALUES (12,'Dyana',55); 
INSERT INTO basicselect.STUDENTS VALUES (13,'Jenny',66); 
INSERT INTO basicselect.STUDENTS VALUES (14,'Christene',88); 
INSERT INTO basicselect.STUDENTS VALUES (15,'Meera',24); 
INSERT INTO basicselect.STUDENTS VALUES (16,'Priya',76); 
INSERT INTO basicselect.STUDENTS VALUES (17,'Priyanka',77); 
INSERT INTO basicselect.STUDENTS VALUES (18,'Paige',74); 
INSERT INTO basicselect.STUDENTS VALUES (19,'Jane',64); 
INSERT INTO basicselect.STUDENTS VALUES (21,'Belvet',78); 
INSERT INTO basicselect.STUDENTS VALUES (31,'Scarlet',80); 
INSERT INTO basicselect.STUDENTS VALUES (41,'Salma',81); 
INSERT INTO basicselect.STUDENTS VALUES (51,'Amanda',34); 
INSERT INTO basicselect.STUDENTS VALUES (61,'Heraldo',94); 
INSERT INTO basicselect.STUDENTS VALUES (71,'Stuart',99); 
INSERT INTO basicselect.STUDENTS VALUES (81,'Aamina',77); 
INSERT INTO basicselect.STUDENTS VALUES (76,'Amina',89); 
INSERT INTO basicselect.STUDENTS VALUES (91,'Vivek',84); 
INSERT INTO basicselect.STUDENTS VALUES (17,'Evil',79); 
INSERT INTO basicselect.STUDENTS VALUES (16,'Devil',76); 
INSERT INTO basicselect.STUDENTS VALUES (34,'Fanny',75); 
INSERT INTO basicselect.STUDENTS VALUES (38,'Danny',75);

COMMIT

GO

raiserror('Create basicselect.Employee table ....',0,1)

GO

DROP TABLE IF EXISTS basicselect.EMPLOYEE;

GO

CREATE TABLE basicselect.EMPLOYEE
(
   EMPLOYEE_ID   int        	NOT NULL,
   NAME			 varchar(21)    NOT NULL,
   MONTHS	     int			NULL,
   SALARY		 int			NULL
)

GO

raiserror('Insert basicselect.Employee table ....',0,1)

GO

BEGIN TRANSACTION

INSERT INTO basicselect.EMPLOYEE VALUES (330,'Rose',5,2248); 
INSERT INTO basicselect.EMPLOYEE VALUES (1233,'Angela',7,1296); 
INSERT INTO basicselect.EMPLOYEE VALUES (1901,'Frank',10,2763); 
INSERT INTO basicselect.EMPLOYEE VALUES (2035,'Patrick',1,4583); 
INSERT INTO basicselect.EMPLOYEE VALUES (2405,'Lisa',7,4350); 
INSERT INTO basicselect.EMPLOYEE VALUES (2974,'Kimberly',11,2874); 
INSERT INTO basicselect.EMPLOYEE VALUES (3190,'Bonnie',11,3758); 
INSERT INTO basicselect.EMPLOYEE VALUES (3506,'Michael',9,1936); 
INSERT INTO basicselect.EMPLOYEE VALUES (3708,'Todd',22,4046); 
INSERT INTO basicselect.EMPLOYEE VALUES (4428,'Joe',22,3802); 
INSERT INTO basicselect.EMPLOYEE VALUES (5962,'Earl',11,2958); 
INSERT INTO basicselect.EMPLOYEE VALUES (6060,'Robert',22,4128); 
INSERT INTO basicselect.EMPLOYEE VALUES (6418,'Amy',2,4832); 
INSERT INTO basicselect.EMPLOYEE VALUES (7466,'Pamela',1,4199); 
INSERT INTO basicselect.EMPLOYEE VALUES (9102,'Maria',11,2958); 
INSERT INTO basicselect.EMPLOYEE VALUES (11863,'Joe',18,1721); 
INSERT INTO basicselect.EMPLOYEE VALUES (12004,'Linda',15,2306); 
INSERT INTO basicselect.EMPLOYEE VALUES (12387,'Melissa',20,1854); 
INSERT INTO basicselect.EMPLOYEE VALUES (13835,'Carol',20,4340); 
INSERT INTO basicselect.EMPLOYEE VALUES (15151,'Paula',15,1526); 
INSERT INTO basicselect.EMPLOYEE VALUES (15286,'Marilyn',10,3087); 
INSERT INTO basicselect.EMPLOYEE VALUES (15675,'Jennifer',2,2336); 
INSERT INTO basicselect.EMPLOYEE VALUES (16493,'Harry',14,4755); 
INSERT INTO basicselect.EMPLOYEE VALUES (17858,'David',13,3658); 
INSERT INTO basicselect.EMPLOYEE VALUES (19035,'Julia',4,2195); 
INSERT INTO basicselect.EMPLOYEE VALUES (19172,'Kevin',1,2113); 
INSERT INTO basicselect.EMPLOYEE VALUES (21638,'Paul',6,3120); 
INSERT INTO basicselect.EMPLOYEE VALUES (22684,'James',14,1370); 
INSERT INTO basicselect.EMPLOYEE VALUES (23621,'Kelly',7,1923); 
INSERT INTO basicselect.EMPLOYEE VALUES (24011,'Robin',22,1880); 
INSERT INTO basicselect.EMPLOYEE VALUES (24611,'Ralph',22,1495); 
INSERT INTO basicselect.EMPLOYEE VALUES (25109,'Gloria',2,1979); 
INSERT INTO basicselect.EMPLOYEE VALUES (25120,'Victor',20,1557); 
INSERT INTO basicselect.EMPLOYEE VALUES (28247,'David',23,2212); 
INSERT INTO basicselect.EMPLOYEE VALUES (30183,'Joyce',20,2748); 
INSERT INTO basicselect.EMPLOYEE VALUES (30712,'Donna',8,2604); 
INSERT INTO basicselect.EMPLOYEE VALUES (32502,'Michelle',1,2086); 
INSERT INTO basicselect.EMPLOYEE VALUES (32654,'Stephanie',17,1444); 
INSERT INTO basicselect.EMPLOYEE VALUES (33086,'Gerald',23,2206); 
INSERT INTO basicselect.EMPLOYEE VALUES (33132,'Walter',11,4180); 
INSERT INTO basicselect.EMPLOYEE VALUES (37008,'Christina',8,3100); 
INSERT INTO basicselect.EMPLOYEE VALUES (38246,'Brandon',3,4339); 
INSERT INTO basicselect.EMPLOYEE VALUES (38272,'Elizabeth',23,3967); 
INSERT INTO basicselect.EMPLOYEE VALUES (38964,'Joseph',4,2194); 
INSERT INTO basicselect.EMPLOYEE VALUES (39789,'Lawrence',9,1872); 
INSERT INTO basicselect.EMPLOYEE VALUES (40797,'Marilyn',15,2112); 
INSERT INTO basicselect.EMPLOYEE VALUES (41228,'Lori',13,4350); 
INSERT INTO basicselect.EMPLOYEE VALUES (44436,'Matthew',15,4673); 
INSERT INTO basicselect.EMPLOYEE VALUES (45285,'Jesse',1,3768); 
INSERT INTO basicselect.EMPLOYEE VALUES (47458,'John',13,3104); 
INSERT INTO basicselect.EMPLOYEE VALUES (47496,'Martha',15,4020); 
INSERT INTO basicselect.EMPLOYEE VALUES (47920,'Timothy',10,1745); 
INSERT INTO basicselect.EMPLOYEE VALUES (48129,'Christine',22,3738); 
INSERT INTO basicselect.EMPLOYEE VALUES (50664,'Anthony',22,4912); 
INSERT INTO basicselect.EMPLOYEE VALUES (51741,'Paula',1,2492); 
INSERT INTO basicselect.EMPLOYEE VALUES (52923,'Kimberly',17,1955); 
INSERT INTO basicselect.EMPLOYEE VALUES (55238,'Louise',1,2717); 
INSERT INTO basicselect.EMPLOYEE VALUES (56775,'Martin',16,1385); 
INSERT INTO basicselect.EMPLOYEE VALUES (57065,'Paul',23,3379); 
INSERT INTO basicselect.EMPLOYEE VALUES (58343,'Antonio',21,3268); 
INSERT INTO basicselect.EMPLOYEE VALUES (59256,'Jacqueline',14,3913); 
INSERT INTO basicselect.EMPLOYEE VALUES (60119,'Diana',13,5149); 
INSERT INTO basicselect.EMPLOYEE VALUES (61191,'John',5,1775); 
INSERT INTO basicselect.EMPLOYEE VALUES (65288,'Dorothy',22,3792); 
INSERT INTO basicselect.EMPLOYEE VALUES (65375,'Evelyn',6,4079); 
INSERT INTO basicselect.EMPLOYEE VALUES (66442,'Phillip',9,1894); 
INSERT INTO basicselect.EMPLOYEE VALUES (67137,'Evelyn',15,1311); 
INSERT INTO basicselect.EMPLOYEE VALUES (68942,'Debra',20,3704); 
INSERT INTO basicselect.EMPLOYEE VALUES (69085,'David',11,1845); 
INSERT INTO basicselect.EMPLOYEE VALUES (69234,'Willie',12,5088); 
INSERT INTO basicselect.EMPLOYEE VALUES (69475,'Brandon',19,2279); 
INSERT INTO basicselect.EMPLOYEE VALUES (69787,'Ann',9,1311); 
INSERT INTO basicselect.EMPLOYEE VALUES (70963,'Emily',8,5247); 
INSERT INTO basicselect.EMPLOYEE VALUES (71569,'Dorothy',22,4088); 
INSERT INTO basicselect.EMPLOYEE VALUES (72030,'Jonathan',4,5009); 
INSERT INTO basicselect.EMPLOYEE VALUES (72370,'Dorothy',18,3174); 
INSERT INTO basicselect.EMPLOYEE VALUES (72785,'Marilyn',1,1860); 
INSERT INTO basicselect.EMPLOYEE VALUES (72974,'Norma',21,1558); 
INSERT INTO basicselect.EMPLOYEE VALUES (74662,'Nancy',6,3223); 
INSERT INTO basicselect.EMPLOYEE VALUES (76876,'Andrew',11,1746); 
INSERT INTO basicselect.EMPLOYEE VALUES (77609,'Keith',2,1219); 
INSERT INTO basicselect.EMPLOYEE VALUES (78101,'Benjamin',7,4414); 
INSERT INTO basicselect.EMPLOYEE VALUES (79744,'Charles',11,1911); 
INSERT INTO basicselect.EMPLOYEE VALUES (80475,'Alan',16,1853); 
INSERT INTO basicselect.EMPLOYEE VALUES (80895,'Tammy',8,1591); 
INSERT INTO basicselect.EMPLOYEE VALUES (81381,'Anna',16,1569); 
INSERT INTO basicselect.EMPLOYEE VALUES (82828,'James',23,4398); 
INSERT INTO basicselect.EMPLOYEE VALUES (85287,'Robin',23,2078); 
INSERT INTO basicselect.EMPLOYEE VALUES (87170,'Jean',18,3895); 
INSERT INTO basicselect.EMPLOYEE VALUES (87355,'Andrew',15,1446); 
INSERT INTO basicselect.EMPLOYEE VALUES (89017,'Roy',8,3443); 
INSERT INTO basicselect.EMPLOYEE VALUES (90507,'Diana',9,5101); 
INSERT INTO basicselect.EMPLOYEE VALUES (90558,'Christina',23,3498); 
INSERT INTO basicselect.EMPLOYEE VALUES (92908,'Jesse',13,4753); 
INSERT INTO basicselect.EMPLOYEE VALUES (95322,'Joyce',18,1577); 
INSERT INTO basicselect.EMPLOYEE VALUES (95983,'Patricia',23,1469); 
INSERT INTO basicselect.EMPLOYEE VALUES (96963,'Gregory',16,5071); 
INSERT INTO basicselect.EMPLOYEE VALUES (97178,'Brian',19,3144); 
INSERT INTO basicselect.EMPLOYEE VALUES (98271,'Christine',3,3796); 
INSERT INTO basicselect.EMPLOYEE VALUES (98491,'Lillian',3,1920); 

COMMIT

GO