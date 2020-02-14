/*
Weather Observation Station 10

Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows

FILEDS			TYPE
ID				NUMBER
CITY			VARCHAR2(21)
STATE			VARCHAR2(2)
LAT_N			NUMBER
LONG_W			NUMBER

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

BEGIN TRANSACTION;

/* Create a table called STATION */
CREATE TABLE STATION(
ID 		NUMBER, 
CITY 	VARCHAR2(21),
STATE	NUMBER,
LAT_N 	NUMBER,
LONG_W 	NUMBER);

/* select 'insert into station values (' ||id ||','''||city||''','''||state||''','||LAT_N||','||LONG_W||');' from station; */

/* Create few records in this table */
insert into station values (794,'Kissee Mills','MO',140,73); 
insert into station values (824,'Loma Mar','CA',49,131); 
insert into station values (603,'Sandy Hook','CT',72,148); 
insert into station values (478,'Tipton','IN',34,98); 
insert into station values (619,'Arlington','CO',75,93); 
insert into station values (711,'Turner','AR',50,101); 
insert into station values (839,'Slidell','LA',85,152); 
insert into station values (411,'Negreet','LA',99,105); 
insert into station values (588,'Glencoe','KY',46,136); 
insert into station values (665,'Chelsea','IA',99,60); 
insert into station values (342,'Chignik Lagoon','AK',103,153); 
insert into station values (733,'Pelahatchie','MS',39,28); 
insert into station values (441,'Hanna City','IL',51,137); 
insert into station values (811,'Dorrance','KS',102,122); 
insert into station values (698,'Albany','CA',50,80); 
insert into station values (325,'Monument','KS',71,142); 
insert into station values (414,'Manchester','MD',74,37); 
insert into station values (113,'Prescott','IA',40,66); 
insert into station values (971,'Graettinger','IA',95,150); 
insert into station values (266,'Cahone','CO',116,127); 
insert into station values (617,'Sturgis','MS',36,126); 
insert into station values (495,'Upperco','MD',114,30); 
insert into station values (473,'Highwood','IL',27,151); 
insert into station values (959,'Waipahu','HI',106,34); 
insert into station values (438,'Bowdon','GA',89,78); 
insert into station values (571,'Tyler','MN',133,59); 
insert into station values (92,'Watkins','CO',83,97); 
insert into station values (399,'Republic','MI',75,130); 
insert into station values (426,'Millville','CA',33,146); 
insert into station values (844,'Aguanga','CA',80,66); 
insert into station values (321,'Bowdon Junction','GA',86,34); 
insert into station values (606,'Morenci','AZ',105,110); 
insert into station values (957,'South El Monte','CA',74,80); 
insert into station values (833,'Hoskinston','KY',66,66); 
insert into station values (843,'Talbert','KY',40,59); 
insert into station values (166,'Mccomb','MS',74,43); 
insert into station values (339,'Kirk','CO',141,136); 
insert into station values (909,'Carlock','IL',117,85); 
insert into station values (829,'Seward','IL',72,90); 
insert into station values (766,'Gustine','CA',111,141); 
insert into station values (392,'Delano','CA',126,92); 
insert into station values (555,'Westphalia','MI',33,144); 
insert into station values (33,'Saint Elmo','AL',27,51); 
insert into station values (728,'Roy','MT',41,52); 
insert into station values (656,'Pattonsburg','MO',138,32); 
insert into station values (394,'Centertown','MO',134,93); 
insert into station values (366,'Norvell','MI',125,94); 
insert into station values (96,'Raymondville','MO',71,148); 
insert into station values (867,'Beaver Island','MI',82,165); 
insert into station values (977,'Odin','IL',53,116); 
insert into station values (741,'Jemison','AL',62,26); 
insert into station values (436,'West Hills','CA',68,73); 
insert into station values (323,'Barrigada','GU',61,148); 
insert into station values (3,'Hesperia','CA',106,71); 
insert into station values (814,'Wickliffe','KY',80,46); 
insert into station values (375,'Culdesac','ID',48,78); 
insert into station values (467,'Roselawn','IN',88,52); 
insert into station values (604,'Forest Lakes','AZ',145,114); 
insert into station values (551,'San Simeon','CA',38,28); 
insert into station values (706,'Little Rock','AR',122,121); 
insert into station values (647,'Portland','AR',84,45); 
insert into station values (25,'New Century','KS',135,79); 
insert into station values (250,'Hampden','MA',76,26); 
insert into station values (124,'Pine City','MN',119,129); 
insert into station values (547,'Sandborn','IN',56,94); 
insert into station values (701,'Seaton','IL',128,78); 
insert into station values (197,'Milledgeville','IL',91,113); 
insert into station values (613,'East China','MI',109,42); 
insert into station values (630,'Prince Frederick','MD',105,58); 
insert into station values (767,'Pomona Park','FL',101,163); 
insert into station values (679,'Gretna','LA',75,143); 
insert into station values (896,'Yazoo City','MS',95,85); 
insert into station values (403,'Zionsville','IN',58,36); 
insert into station values (519,'Rio Oso','CA',29,106); 
insert into station values (482,'Jolon','CA',67,53); 
insert into station values (252,'Childs','MD',93,104); 
insert into station values (600,'Shreveport','LA',136,39); 
insert into station values (14,'Forest','MS',120,50); 
insert into station values (260,'Sizerock','KY',116,113); 
insert into station values (65,'Buffalo Creek','CO',48,148); 
insert into station values (753,'Algonac','MI',119,80); 
insert into station values (174,'Onaway','MI',109,56); 
insert into station values (263,'Irvington','IL',97,68); 
insert into station values (253,'Winsted','MN',69,73); 
insert into station values (557,'Woodbury','GA',103,93); 
insert into station values (897,'Samantha','AL',75,36); 
insert into station values (98,'Hackleburg','AL',120,121); 
insert into station values (423,'Soldier','KS',77,153); 
insert into station values (361,'Arrowsmith','IL',28,109); 
insert into station values (409,'Columbus','GA',67,47); 
insert into station values (312,'Bentonville','AR',37,78); 
insert into station values (854,'Kirkland','AZ',86,58); 
insert into station values (160,'Grosse Pointe','MI',102,91); 
insert into station values (735,'Wilton','ME',57,157); 
insert into station values (608,'Busby','MT',104,30); 
insert into station values (122,'Robertsdale','AL',98,85); 
insert into station values (93,'Dale','IN',70,34); 
insert into station values (67,'Reeds','MO',31,43); 
insert into station values (906,'Hayfork','CA',35,117); 
insert into station values (34,'Mcbrides','MI',74,36); 
insert into station values (921,'Lee Center','IL',96,77); 
insert into station values (401,'Tennessee','IL',55,156); 
insert into station values (536,'Henderson','IA',78,78); 
insert into station values (953,'Udall','KS',113,60); 
insert into station values (370,'Palm Desert','CA',107,146); 
insert into station values (614,'Benedict','KS',138,96); 
insert into station values (998,'Oakfield','ME',48,132); 
insert into station values (805,'Tamms','IL',60,75); 
insert into station values (235,'Haubstadt','IN',28,32); 
insert into station values (820,'Chokio','MN',81,134); 
insert into station values (650,'Clancy','MT',46,164); 
insert into station values (791,'Scotts Valley','CA',120,91); 
insert into station values (324,'Norwood','MN',144,35); 
insert into station values (442,'Elkton','MD',103,157); 
insert into station values (633,'Bertha','MN',40,105); 
insert into station values (109,'Bridgeport','MI',51,80); 
insert into station values (780,'Cherry','IL',68,47); 
insert into station values (492,'Regina','KY',132,90); 
insert into station values (965,'Griffin','GA',39,152); 
insert into station values (778,'Pine Bluff','AR',60,146); 
insert into station values (337,'Mascotte','FL',121,146); 
insert into station values (259,'Baldwin','MD',82,40); 
insert into station values (955,'Netawaka','KS',109,120); 
insert into station values (752,'East Irvine','CA',106,115); 
insert into station values (886,'Pony','MT',99,163); 
insert into station values (200,'Franklin','LA',82,32); 
insert into station values (384,'Amo','IN',104,159); 
insert into station values (518,'Vulcan','MO',109,92); 
insert into station values (188,'Prairie Du Rocher','IL',76,71); 
insert into station values (161,'Alanson','MI',91,72); 
insert into station values (486,'Delta','LA',137,50); 
insert into station values (406,'Carver','MN',46,122); 
insert into station values (940,'Paron','AR',59,104); 
insert into station values (237,'Winchester','ID',38,80); 
insert into station values (465,'Jerome','AZ',122,34); 
insert into station values (591,'Baton Rouge','LA',130,72); 
insert into station values (570,'Greenview','CA',81,58); 
insert into station values (429,'Lucerne Valley','CA',36,48); 
insert into station values (278,'Cromwell','MN',129,54); 
insert into station values (927,'Quinter','KS',60,25); 
insert into station values (59,'Whitewater','MO',83,71); 
insert into station values (218,'Round Pond','ME',127,124); 
insert into station values (291,'Clarkdale','AZ',58,74); 
insert into station values (668,'Rockton','IL',116,87); 
insert into station values (682,'Pheba','MS',91,127); 
insert into station values (775,'Eleele','HI',81,153); 
insert into station values (527,'Auburn','IA',95,137); 
insert into station values (108,'North Berwick','ME',71,27); 
insert into station values (190,'Oconee','GA',93,119); 
insert into station values (232,'Grandville','MI',39,70); 
insert into station values (405,'Susanville','CA',128,80); 
insert into station values (273,'Rosie','AR',73,162); 
insert into station values (813,'Verona','MO',110,153); 
insert into station values (444,'Richland','GA',105,113); 
insert into station values (899,'Fremont','MI',54,151); 
insert into station values (738,'Philipsburg','MT',96,72); 
insert into station values (215,'Kensett','IA',56,140); 
insert into station values (743,'De Tour Village','MI',25,25); 
insert into station values (377,'Koleen','IN',138,111); 
insert into station values (727,'Winslow','IL',113,39); 
insert into station values (363,'Reasnor','IA',42,163); 
insert into station values (117,'West Grove','IA',127,99); 
insert into station values (420,'Frankfort Heights','IL',72,30); 
insert into station values (888,'Bono','AR',133,150); 
insert into station values (784,'Biggsville','IL',86,139); 
insert into station values (413,'Linthicum Heights','MD',128,68); 
insert into station values (695,'Amazonia','MO',46,148); 
insert into station values (609,'Marysville','MI',86,133); 
insert into station values (471,'Cape Girardeau','MO',74,91); 
insert into station values (649,'Pengilly','MN',25,154); 
insert into station values (946,'Newton Center','MA',48,145); 
insert into station values (380,'Crane Lake','MN',73,43); 
insert into station values (383,'Newbury','MA',128,85); 
insert into station values (44,'Kismet','KS',100,157); 
insert into station values (433,'Canton','ME',99,106); 
insert into station values (283,'Clipper Mills','CA',114,57); 
insert into station values (474,'Grayslake','IL',61,33); 
insert into station values (233,'Pierre Part','LA',52,90); 
insert into station values (990,'Bison','KS',132,75); 
insert into station values (502,'Bellevue','KY',127,122); 
insert into station values (327,'Ridgway','CO',77,110); 
insert into station values (4,'South Britain','CT',66,34); 
insert into station values (228,'Rydal','GA',36,79); 
insert into station values (642,'Lynnville','KY',25,146); 
insert into station values (885,'Deerfield','MO',40,36); 
insert into station values (539,'Montreal','MO',129,127); 
insert into station values (202,'Hope','MN',140,44); 
insert into station values (593,'Aliso Viejo','CA',68,131); 
insert into station values (521,'Gowrie','IA',130,128); 
insert into station values (938,'Andersonville','GA',141,73); 
insert into station values (919,'Knob Lick','KY',136,33); 
insert into station values (528,'Crouseville','ME',37,82); 
insert into station values (331,'Cranks','KY',56,27); 
insert into station values (45,'Rives Junction','MI',94,117); 
insert into station values (944,'Ledyard','CT',135,144); 
insert into station values (949,'Norway','ME',84,88); 
insert into station values (88,'Eros','LA',95,58); 
insert into station values (878,'Rantoul','KS',32,119); 
insert into station values (35,'Richmond Hill','GA',39,114); 
insert into station values (17,'Fredericktown','MO',106,113); 
insert into station values (447,'Arkadelphia','AR',99,50); 
insert into station values (498,'Glen Carbon','IL',61,141); 
insert into station values (351,'Fredericksburg','IN',45,78); 
insert into station values (774,'Manchester','IA',130,123); 
insert into station values (116,'Mc Henry','MD',93,113); 
insert into station values (963,'Eriline','KY',94,65); 
insert into station values (643,'Wellington','KY',100,32); 
insert into station values (781,'Hoffman Estates','IL',129,53); 
insert into station values (364,'Howard Lake','MN',126,78); 
insert into station values (777,'Edgewater','MD',130,72); 
insert into station values (15,'Ducor','CA',141,102); 
insert into station values (910,'Salem','KY',87,114); 
insert into station values (612,'Sturdivant','MO',94,86); 
insert into station values (537,'Hagatna','GU',97,152); 
insert into station values (970,'East Haddam','CT',116,132); 
insert into station values (510,'Eastlake','MI',134,39); 
insert into station values (354,'Larkspur','CA',107,66); 
insert into station values (983,'Patriot','IN',83,46); 
insert into station values (799,'Corriganville','MD',141,154); 
insert into station values (581,'Carlos','MN',115,66); 
insert into station values (825,'Addison','MI',96,142); 
insert into station values (526,'Tarzana','CA',136,81); 
insert into station values (176,'Grapevine','AR',92,85); 
insert into station values (994,'Kanorado','KS',65,86); 
insert into station values (704,'Climax','MI',127,107); 
insert into station values (582,'Curdsville','KY',85,150); 
insert into station values (884,'Southport','CT',59,63); 
insert into station values (196,'Compton','IL',107,99); 
insert into station values (605,'Notasulga','AL',67,116); 
insert into station values (430,'Rumsey','KY',71,50); 
insert into station values (234,'Rogers','CT',140,33); 
insert into station values (700,'Pleasant Grove','AR',135,146); 
insert into station values (702,'Everton','MO',119,51); 
insert into station values (662,'Skanee','MI',70,130); 
insert into station values (171,'Springerville','AZ',125,151); 
insert into station values (615,'Libertytown','MD',145,112); 
insert into station values (26,'Church Creek','MD',39,91); 
insert into station values (692,'Yellow Pine','ID',83,151); 
insert into station values (336,'Dumont','MN',57,129); 
insert into station values (464,'Gales Ferry','CT',105,37); 
insert into station values (315,'Ravenna','KY',79,106); 
insert into station values (505,'Williams','AZ',73,112); 
insert into station values (842,'Decatur','MI',63,161); 
insert into station values (982,'Holbrook','AZ',135,104); 
insert into station values (868,'Sherrill','AR',80,152); 
insert into station values (554,'Brownsdale','MN',52,51); 
insert into station values (199,'Linden','MI',53,33); 
insert into station values (453,'Sedgwick','AR',69,75); 
insert into station values (451,'Fort Atkinson','IA',143,141); 
insert into station values (950,'Peachtree City','GA',80,156); 
insert into station values (326,'Rocheport','MO',114,64); 
insert into station values (189,'West Somerset','KY',74,45); 
insert into station values (638,'Clovis','CA',92,138); 
insert into station values (156,'Heyburn','ID',82,121); 
insert into station values (861,'Peabody','KS',75,152); 
insert into station values (722,'Marion Junction','AL',53,31); 
insert into station values (428,'Randall','KS',48,136); 
insert into station values (677,'Hayesville','IA',120,42); 
insert into station values (183,'Jordan','MN',69,35); 
insert into station values (322,'White Horse Beach','MA',54,59); 
insert into station values (827,'Greenville','IL',51,153); 
insert into station values (242,'Macy','IN',139,152); 
insert into station values (621,'Flowood','MS',65,149); 
insert into station values (960,'Deep River','IA',75,39); 
insert into station values (180,'Napoleon','IN',32,160); 
insert into station values (382,'Leavenworth','IN',100,122); 
insert into station values (853,'Coldwater','KS',48,26); 
insert into station values (105,'Weldon','CA',134,119); 
insert into station values (357,'Yellville','AR',36,42); 
insert into station values (710,'Turners Falls','MA',31,125); 
insert into station values (520,'Delray Beach','FL',27,159); 
insert into station values (920,'Eustis','FL',43,39); 
insert into station values (684,'Mineral Point','MO',91,41); 
insert into station values (355,'Weldona','CO',33,58); 
insert into station values (389,'Midpines','CA',106,59); 
insert into station values (303,'Cascade','ID',32,157); 
insert into station values (501,'Tefft','IN',93,150); 
insert into station values (673,'Showell','MD',44,164); 
insert into station values (834,'Bayville','ME',107,143); 
insert into station values (255,'Brighton','IL',108,33); 
insert into station values (595,'Grimes','IA',42,75); 
insert into station values (709,'Nubieber','CA',133,49); 
insert into station values (100,'North Monmouth','ME',131,78); 
insert into station values (522,'Harmony','MN',124,126); 
insert into station values (16,'Beaufort','MO',72,86); 
insert into station values (231,'Arispe','IA',31,138); 
insert into station values (923,'Union Star','MO',79,133); 
insert into station values (891,'Humeston','IA',75,122); 
insert into station values (165,'Baileyville','IL',82,61); 
insert into station values (757,'Lakeville','CT',60,95); 
insert into station values (506,'Firebrick','KY',50,95); 
insert into station values (76,'Pico Rivera','CA',143,117); 
insert into station values (246,'Ludington','MI',30,120); 
insert into station values (583,'Channing','MI',117,57); 
insert into station values (666,'West Baden Springs','IN',30,96); 
insert into station values (373,'Pawnee','IL',85,81); 
insert into station values (504,'Melber','KY',37,56); 
insert into station values (901,'Manchester','MN',71,84); 
insert into station values (306,'Bainbridge','GA',62,57); 
insert into station values (821,'Sanders','AZ',131,97); 
insert into station values (586,'Ottertail','MN',100,44); 
insert into station values (95,'Dupo','IL',41,29); 
insert into station values (524,'Montrose','CA',136,119); 
insert into station values (716,'Schleswig','IA',119,52); 
insert into station values (849,'Harbor Springs','MI',141,149); 
insert into station values (611,'Richmond','IL',113,163); 
insert into station values (904,'Ermine','KY',120,63); 
insert into station values (740,'Siler','KY',137,117); 
insert into station values (439,'Reeves','LA',35,51); 
insert into station values (57,'Clifton','AZ',30,136); 
insert into station values (155,'Casco','MI',139,109); 
insert into station values (755,'Sturgis','MI',117,135); 
insert into station values (11,'Crescent City','FL',58,118); 
insert into station values (287,'Madisonville','LA',112,53); 
insert into station values (435,'Albion','IN',44,122); 
insert into station values (672,'Lismore','MN',59,104); 
insert into station values (572,'Athens','IN',75,121); 
insert into station values (890,'Eufaula','AL',140,103); 
insert into station values (975,'Panther Burn','MS',117,165); 
insert into station values (914,'Hanscom Afb','MA',129,136); 
insert into station values (119,'Wildie','KY',70,112); 
insert into station values (540,'Mosca','CO',89,141); 
insert into station values (678,'Bennington','IN',36,27); 
insert into station values (208,'Lottie','LA',110,83); 
insert into station values (512,'Garland','ME',109,134); 
insert into station values (352,'Clutier','IA',61,127); 
insert into station values (948,'Lupton','MI',140,53); 
insert into station values (503,'Northfield','MN',61,37); 
insert into station values (288,'Daleville','AL',122,136); 
insert into station values (560,'Osage City','KS',110,90); 
insert into station values (479,'Cuba','MO',64,88); 
insert into station values (826,'Norris','MT',47,37); 
insert into station values (651,'Clopton','AL',41,85); 
insert into station values (143,'Renville','MN',142,99); 
insert into station values (240,'Saint Paul','KS',66,163); 
insert into station values (102,'Kirksville','MO',140,144); 
insert into station values (69,'Kingsland','AR',78,85); 
insert into station values (181,'Fairview','KS',80,165); 
insert into station values (175,'Lydia','LA',42,40); 
insert into station values (80,'Bridgton','ME',93,140); 
insert into station values (596,'Brownstown','IL',49,63); 
insert into station values (301,'Monona','IA',144,82); 
insert into station values (987,'Hartland','MI',136,108); 
insert into station values (973,'Andover','CT',52,53); 
insert into station values (981,'Lakota','IA',56,92); 
insert into station values (440,'Grand Terrace','CA',37,127); 
insert into station values (110,'Mesick','MI',82,109); 
insert into station values (396,'Dryden','MI',70,48); 
insert into station values (637,'Beverly','KY',58,127); 
insert into station values (566,'Marine On Saint Croix','MN',126,116); 
insert into station values (801,'Pocahontas','IL',110,83); 
insert into station values (739,'Fort Meade','FL',44,35); 
insert into station values (130,'Hayneville','AL',110,157); 
insert into station values (345,'Yoder','IN',83,144); 
insert into station values (851,'Gatewood','MO',76,146); 
insert into station values (489,'Madden','MS',81,99); 
insert into station values (223,'Losantville','IN',113,107); 
insert into station values (538,'Cheswold','DE',32,59); 
insert into station values (329,'Caseville','MI',103,98); 
insert into station values (815,'Pomona','MO',52,50); 
insert into station values (789,'Hopkinsville','KY',27,48); 
insert into station values (269,'Jack','AL',50,86); 
insert into station values (969,'Dixie','GA',27,36); 
insert into station values (271,'Hillside','CO',99,69); 
insert into station values (667,'Hawarden','IA',91,47); 
insert into station values (350,'Cannonsburg','MI',91,121); 
insert into station values (49,'Osborne','KS',70,140); 
insert into station values (332,'Elm Grove','LA',46,29); 
insert into station values (172,'Atlantic Mine','MI',131,99); 
insert into station values (699,'North Branford','CT',38,95); 
insert into station values (417,'New Liberty','IA',140,95); 
insert into station values (99,'Woodstock Valley','CT',117,163); 
insert into station values (404,'Farmington','IL',92,72); 
insert into station values (23,'Honolulu','HI',110,140); 
insert into station values (1,'Pfeifer','KS',37,66); 
insert into station values (127,'Oshtemo','MI',100,136); 
insert into station values (657,'Gridley','KS',118,56); 
insert into station values (261,'Fulton','KY',111,52); 
insert into station values (182,'Winter Park','FL',133,33); 
insert into station values (328,'Monroe','LA',28,108); 
insert into station values (779,'Del Mar','CA',59,96); 
insert into station values (646,'Greens Fork','IN',134,135); 
insert into station values (756,'Garden City','AL',96,105); 
insert into station values (157,'Blue River','KY',117,162); 
insert into station values (400,'New Ross','IN',134,121); 
insert into station values (61,'Brilliant','AL',86,160); 
insert into station values (610,'Archie','MO',40,28); 
insert into station values (985,'Winslow','AR',126,126); 
insert into station values (207,'Olmitz','KS',29,38); 
insert into station values (941,'Allerton','IA',62,113); 
insert into station values (70,'Norphlet','AR',144,61); 
insert into station values (343,'Mechanic Falls','ME',72,71); 
insert into station values (531,'North Middletown','KY',43,142); 
insert into station values (996,'Keyes','CA',77,86); 
insert into station values (167,'Equality','AL',107,116); 
insert into station values (750,'Neon','KY',102,148); 
insert into station values (410,'Calhoun','KY',96,57); 
insert into station values (725,'Alpine','AR',117,115); 
insert into station values (988,'Mullan','ID',143,155); 
insert into station values (55,'Coalgood','KY',57,149); 
insert into station values (640,'Walnut','MS',41,77); 
insert into station values (302,'Saint Petersburg','FL',52,120); 
insert into station values (387,'Ojai','CA',69,119); 
insert into station values (476,'Julian','CA',131,102); 
insert into station values (907,'Veedersburg','IN',79,95); 
insert into station values (294,'Orange Park','FL',59,137); 
insert into station values (661,'Payson','AZ',126,154); 
insert into station values (745,'Windom','KS',114,126); 
insert into station values (631,'Urbana','IA',143,29); 
insert into station values (356,'Ludlow','CA',111,88); 
insert into station values (419,'Lindsay','MT',143,68); 
insert into station values (494,'Palatka','FL',95,52); 
insert into station values (625,'Bristol','ME',88,95); 
insert into station values (459,'Harmony','IN',135,71); 
insert into station values (636,'Ukiah','CA',87,90); 
insert into station values (106,'Yuma','AZ',111,154); 
insert into station values (204,'Alba','MI',92,104); 
insert into station values (344,'Zachary','LA',61,152); 
insert into station values (599,'Esmond','IL',76,91); 
insert into station values (515,'Waresboro','GA',144,154); 
insert into station values (497,'Hills','MN',138,135); 
insert into station values (162,'Montgomery City','MO',70,45); 
insert into station values (499,'Delavan','MN',33,65); 
insert into station values (362,'Magnolia','MS',113,32); 
insert into station values (545,'Byron','CA',137,120); 
insert into station values (712,'Dundee','IA',62,105); 
insert into station values (257,'Eureka Springs','AR',72,35); 
insert into station values (154,'Baker','CA',31,148); 
insert into station values (715,'Hyde Park','MA',65,156); 
insert into station values (493,'Groveoak','AL',53,88); 
insert into station values (836,'Kenner','LA',92,127); 
insert into station values (82,'Many','LA',36,95); 
insert into station values (644,'Seward','AK',120,36); 
insert into station values (391,'Berryton','KS',61,140); 
insert into station values (696,'Chilhowee','MO',80,49); 
insert into station values (905,'Newark','IL',73,130); 
insert into station values (81,'Cowgill','MO',137,28); 
insert into station values (31,'Novinger','MO',108,112); 
insert into station values (299,'Goodman','MS',101,117); 
insert into station values (84,'Cobalt','CT',87,27); 
insert into station values (754,'South Haven','MI',145,53); 
insert into station values (144,'Eskridge','KS',108,63); 
insert into station values (305,'Bennington','KS',94,83); 
insert into station values (226,'Decatur','MS',71,118); 
insert into station values (224,'West Hyannisport','MA',59,96); 
insert into station values (694,'Ozona','FL',145,121); 
insert into station values (623,'Jackson','AL',111,67); 
insert into station values (543,'Lapeer','MI',129,114); 
insert into station values (819,'Peaks Island','ME',59,111); 
insert into station values (243,'Hazlehurst','MS',49,109); 
insert into station values (457,'Chester','CA',70,124); 
insert into station values (871,'Clarkston','MI',94,81); 
insert into station values (470,'Healdsburg','CA',111,54); 
insert into station values (705,'Hotchkiss','CO',70,72); 
insert into station values (690,'Ravenden Springs','AR',68,108); 
insert into station values (62,'Monroe','AR',132,150); 
insert into station values (365,'Payson','IL',82,92); 
insert into station values (922,'Kell','IL',70,59); 
insert into station values (838,'Strasburg','CO',89,48); 
insert into station values (286,'Five Points','AL',46,122); 
insert into station values (968,'Norris City','IL',54,76); 
insert into station values (928,'Coaling','AL',144,52); 
insert into station values (746,'Orange City','IA',94,163); 
insert into station values (892,'Effingham','KS',133,98); 
insert into station values (193,'Corcoran','CA',81,140); 
insert into station values (225,'Garden City','IA',54,120); 
insert into station values (573,'Alton','MO',80,112); 
insert into station values (830,'Greenway','AR',119,36); 
insert into station values (241,'Woodsboro','MD',77,142); 
insert into station values (783,'Strawn','IL',30,51); 
insert into station values (675,'Dent','MN',71,137); 
insert into station values (270,'Shingletown','CA',61,102); 
insert into station values (378,'Clio','IA',46,115); 
insert into station values (104,'Yalaha','FL',120,120); 
insert into station values (460,'Leakesville','MS',107,73); 
insert into station values (804,'Fort Lupton','CO',39,93); 
insert into station values (53,'Shasta','CA',99,156); 
insert into station values (448,'Canton','MN',124,151); 
insert into station values (751,'Agency','MO',59,96); 
insert into station values (29,'South Carrollton','KY',58,117); 
insert into station values (718,'Taft','CA',108,147); 
insert into station values (213,'Calpine','CA',47,43); 
insert into station values (624,'Knobel','AR',95,62); 
insert into station values (908,'Bullhead City','AZ',95,30); 
insert into station values (845,'Tina','MO',132,28); 
insert into station values (685,'Anthony','KS',45,161); 
insert into station values (731,'Emmett','ID',57,32); 
insert into station values (311,'South Haven','MN',30,87); 
insert into station values (866,'Haverhill','IA',62,109); 
insert into station values (598,'Middleboro','MA',108,149); 
insert into station values (541,'Siloam','GA',105,92); 
insert into station values (889,'Lena','LA',78,130); 
insert into station values (654,'Lee','IL',28,51); 
insert into station values (841,'Freeport','MI',114,51); 
insert into station values (446,'Mid Florida','FL',110,51); 
insert into station values (249,'Acme','LA',73,68); 
insert into station values (376,'Gorham','KS',111,65); 
insert into station values (136,'Bass Harbor','ME',138,61); 
insert into station values (455,'Granger','IA',33,102); 
COMMIT;

select distinct(city) from station where upper(substr(city,-1,1)) not in ('A','E','I','O','U');