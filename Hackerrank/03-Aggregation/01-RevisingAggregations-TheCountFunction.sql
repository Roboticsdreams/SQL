Query a count of the number of cities in CITY having a Population larger than 100000.

Input Format

The CITY table is described as follows: 

+-------------+--------------+
|    Field    |     Type     |
+-------------+--------------+
| ID          | number       |
| Name        | varchar2(17) |
| CountryCode | varchar2(3)  |
| District    | varchar2(20) |
| Population  | number       |
+-------------+--------------+

select count(id) from city where population >= 100000;

+------+--------------+--------------+---------------+------------+
|  ID  |     Name     | CountryCode  |   District    | Population |
+------+--------------+--------------+---------------+------------+
|    6 | Rotterdam    | NLD          | Zuid-Holland  |     593321 |
| 3878 | Scottsdale   | USA          | Arizona       |     202705 |
| 3965 | Corona       | USA          | California    |     124966 |
| 3973 | Concord      | USA          | California    |     121780 |
| 3977 | CedarRapids  | USA          | Iowa          |     120758 |
| 3982 | CoralSprings | USA          | Florida       |     117549 |
| 4054 | Fairfield    | USA          | California    |      92256 |
| 4058 | Boulder      | USA          | Colorado      |      91238 |
| 4061 | FallRiver    | USA          | Massachusetts |      90555 |
+------+--------------+--------------+---------------+------------+

6