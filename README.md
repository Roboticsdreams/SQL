![GitHub top language](https://img.shields.io/github/languages/top/Roboticsdreams/SQL?style=flat)
![GitHub last commit](https://img.shields.io/github/last-commit/Roboticsdreams/SQL?style=flat)
![ViewCount](https://views.whatilearened.today/views/github/Roboticsdreams/SQL.svg?cache=remove)

<p align="center">  
	<br>
	<a href="https://www.hackerrank.com/Rathinavel">
        <img height=100 src="https://d3keuzeb2crhkn.cloudfront.net/hackerrank/assets/styleguide/logo_wordmark-f5c5eb61ab0a154c3ed9eda24d0b9e31.svg"> 
    </a>
    <br>
</p>

## Description
**The solutions of all the SQL challenges for all easy, medium and hard challenges on HackerRank executed on MS-SQLand tested using tSQLt**

## Steps to download and execute this project

- [Download](https://www.microsoft.com/en-in/sql-server/sql-server-downloads) and [Install](https://www.sqlservertutorial.net/install-sql-server/) MS-SQL Server.
- Download the [SQL](https://github.com/Roboticsdreams/SQL/archive/refs/heads/master.zip) project.
- Extract the zip file.
- Open and Login SQL Server.
- Go to File -> Open -> Project/Solutions.
- Browse and Choose SQL.ssmssln and click Open.
- Choose DB as master.
- Open [setup.sql](HackerRank/setup.sql) and select All.
- Go to Query -> SQLCMD Mode then click Execute.
- Open [main.sql](HackerRank/main.sql) and select All.
- Go to Query -> SQLCMD Mode then click Execute.
<sub><sup>*Note:* this will only work if your project folder is under C:/User if not you need to go and run .sql file one by one based on the order from 1 to 10.</sup></sub>

## Output
```
+----------------------+
|Test Execution Summary|
+----------------------+
 
|No|Test Case Name                                       |Dur(ms)|Result |
+--+-----------------------------------------------------+-------+-------+
|1 |[AdvancedJoinTestClass].[test_01sqlprojectplanning]  |     63|Success|
|2 |[AdvancedJoinTestClass].[test_02placements]          |     77|Success|
|3 |[AdvancedJoinTestClass].[test_03symmetricpairs]      |     70|Success|
|4 |[AdvancedJoinTestClass].[test_04interviews]          |    293|Success|
|5 |[AdvancedJoinTestClass].[test_05learningsql]         |    260|Success|
|6 |[AdvancedSelectTestClass].[test_01typeoftriangle]    |     70|Success|
|7 |[AdvancedSelectTestClass].[test_02thepads]           |     56|Success|
|8 |[AdvancedSelectTestClass].[test_03occupations]       |     77|Success|
|9 |[AdvancedSelectTestClass].[test_04binarytreenodes]   |     70|Success|
|10|[AdvancedSelectTestClass].[test_05newcompaines]      |    563|Success|
|11|[AggregationTestClass].[test_01thecountfunction]     |      6|Success|
|12|[AggregationTestClass].[test_02thesumfunction]       |      6|Success|
|13|[AggregationTestClass].[test_03averages]             |      3|Success|
|14|[AggregationTestClass].[test_04averagepopulation]    |      0|Success|
|15|[AggregationTestClass].[test_05japanpopulation]      |      3|Success|
|16|[AggregationTestClass].[test_06populationdensitydiff]|      6|Success|
|17|[AggregationTestClass].[test_07theblunder]           |      3|Success|
|18|[AggregationTestClass].[test_08topearners]           |     44|Success|
|19|[AggregationTestClass].[test_09wos02]                |     40|Success|
|20|[AggregationTestClass].[test_10wos13]                |      7|Success|
|21|[AggregationTestClass].[test_11wos14]                |      4|Success|
|22|[AggregationTestClass].[test_12wos15]                |      7|Success|
|23|[AggregationTestClass].[test_13wos16]                |      7|Success|
|24|[AggregationTestClass].[test_14wos17]                |      7|Success|
|25|[AggregationTestClass].[test_15wos18]                |     10|Success|
|26|[AggregationTestClass].[test_16wos19]                |     10|Success|
|27|[AggregationTestClass].[test_17wos20]                |      6|Success|
|28|[AlternativeQueriesTestClass].[test_01drawtriangle1] |     87|Success|
|29|[AlternativeQueriesTestClass].[test_02drawtriangle2] |     87|Success|
|30|[AlternativeQueriesTestClass].[test_03printprime]    |    950|Success|
|31|[BasicJoinTestClass].[test_01populationcensus]       |     16|Success|
|32|[BasicJoinTestClass].[test_02africancities]          |     40|Success|
|33|[BasicJoinTestClass].[test_03avgpopulation]          |     40|Success|
|34|[BasicJoinTestClass].[test_04thereport]              |     70|Success|
|35|[BasicJoinTestClass].[test_05topcompetitors]         |    160|Success|
|36|[BasicJoinTestClass].[test_06ollivadersinventory]    |    950|Success|
|37|[BasicJoinTestClass].[test_07challenges]             |    113|Success|
|38|[BasicJoinTestClass].[test_08contestleaderboard]     |    317|Success|
|39|[BasicSelectTestClass].[test_01query1]               |    120|Success|
|40|[BasicSelectTestClass].[test_02query2]               |     43|Success|
|41|[BasicSelectTestClass].[test_03selectall]            |    157|Success|
|42|[BasicSelectTestClass].[test_04selectbyid]           |     50|Success|
|43|[BasicSelectTestClass].[test_05jpncity]              |     53|Success|
|44|[BasicSelectTestClass].[test_06jpncityname]          |     33|Success|
|45|[BasicSelectTestClass].[test_07wos01]                |    580|Success|
|46|[BasicSelectTestClass].[test_08wos03]                |    310|Success|
|47|[BasicSelectTestClass].[test_09wos04]                |      7|Success|
|48|[BasicSelectTestClass].[test_10wos05]                |     47|Success|
|49|[BasicSelectTestClass].[test_11wos06]                |    110|Success|
|50|[BasicSelectTestClass].[test_12wos07]                |    226|Success|
|51|[BasicSelectTestClass].[test_13wos08]                |     84|Success|
|52|[BasicSelectTestClass].[test_14wos09]                |    496|Success|
|53|[BasicSelectTestClass].[test_15wos10]                |    436|Success|
|54|[BasicSelectTestClass].[test_16wos11]                |    650|Success|
|55|[BasicSelectTestClass].[test_17wos12]                |    387|Success|
|56|[BasicSelectTestClass].[test_18higherthan75]         |     50|Success|
|57|[BasicSelectTestClass].[test_19employeenames]        |    186|Success|
|58|[BasicSelectTestClass].[test_20employeesalaries]     |     84|Success|
-------------------------------------------------------------------------------
Test Case Summary: 58 test case(s) executed, 58 succeeded, 0 failed, 0 errored.
-------------------------------------------------------------------------------
```

## Domains
### Basic Select Challenges

| Number | Challenges | Solutions |
|:------:|------------|:---------:|
| 1 | [Revising the Select Query I](https://www.hackerrank.com/challenges/revising-the-select-query/problem) | [SQL](HackerRank/04.BS01-Query-I.sql)
| 2 | [Revising the Select Query II](https://www.hackerrank.com/challenges/revising-the-select-query-2/problem) | [SQL](HackerRank/04.BS02-Query-II.sql)
| 3 | [Select All](https://www.hackerrank.com/challenges/select-all-sql/problem) | [SQL](HackerRank/04.BS03-SelectAll.sql)
| 4 | [Select By ID](https://www.hackerrank.com/challenges/select-by-id/problem) | [SQL](HackerRank/04.BS04-SelectByID.sql)
| 5 | [Japanese Cities' Attributes](https://www.hackerrank.com/challenges/japanese-cities-attributes/problem) | [SQL](HackerRank/04.BS05-JapaneseCitiesAttributes.sql)
| 6 | [Japanese Cities' Names](https://www.hackerrank.com/challenges/japanese-cities-name/problem) | [SQL](HackerRank/04.BS06-JapaneseCitiesNames.sql)
| 7 | [Weather Observation Station 1](https://www.hackerrank.com/challenges/weather-observation-station-1/problem) | [SQL](HackerRank/04.BS07-WeatherObservationStation01.sql)
| 8 | [Weather Observation Station 3](https://www.hackerrank.com/challenges/weather-observation-station-3/problem) | [SQL](HackerRank/04.BS08-WeatherObservationStation03.sql)
| 9 | [Weather Observation Station 4](https://www.hackerrank.com/challenges/weather-observation-station-4/problem) | [SQL](HackerRank/04.BS09-WeatherObservationStation04.sql)
| 10| [Weather Observation Station 5](https://www.hackerrank.com/challenges/weather-observation-station-5/problem) | [SQL](HackerRank/04.BS10-WeatherObservationStation05.sql)
| 11| [Weather Observation Station 6](https://www.hackerrank.com/challenges/weather-observation-station-6/problem) | [SQL](HackerRank/04.BS11-WeatherObservationStation06.sql)
| 12| [Weather Observation Station 7](https://www.hackerrank.com/challenges/weather-observation-station-7/problem) | [SQL](HackerRank/04.BS12-WeatherObservationStation07.sql)
| 13| [Weather Observation Station 8](https://www.hackerrank.com/challenges/weather-observation-station-8/problem) | [SQL](HackerRank/04.BS13-WeatherObservationStation08.sql)
| 14| [Weather Observation Station 9](https://www.hackerrank.com/challenges/weather-observation-station-9/problem) | [SQL](HackerRank/04.BS14-WeatherObservationStation09.sql)
| 15| [Weather Observation Station 10](https://www.hackerrank.com/challenges/weather-observation-station-10/problem) | [SQL](HackerRank/04.BS15-WeatherObservationStation10.sql)
| 16| [Weather Observation Station 11](https://www.hackerrank.com/challenges/weather-observation-station-11/problem) | [SQL](HackerRank/04.BS16-WeatherObservationStation11.sql)
| 17| [Weather Observation Station 12](https://www.hackerrank.com/challenges/weather-observation-station-12/problem) | [SQL](HackerRank/04.BS17-WeatherObservationStation12.sql)
| 18| [Higher Than 75 Marks](https://www.hackerrank.com/challenges/more-than-75-marks/problem) | [SQL](HackerRank/04.BS18-Higherthan75.sql)
| 19| [Employee Names](https://www.hackerrank.com/challenges/name-of-employees/problem) | [SQL](HackerRank/04.BS19-EmployeeNames.sql)
| 20| [Employee Salaries](https://www.hackerrank.com/challenges/salary-of-employees/problem) | [SQL](HackerRank/04.BS20-EmployeeSalaries.sql)

### Advanced Select Challenges

| Number | Challenges | Solutions |
|:------:|------------|:---------:|
| 1 |[Type of Triangle](https://www.hackerrank.com/challenges/what-type-of-triangle/problem) | [SQL](HackerRank/05.AS01-TypeofTriangle.sql) |
| 2 |[The PADS](https://www.hackerrank.com/challenges/the-pads/problem) | [SQL](HackerRank/05.AS02-ThePADS.sql) |
| 3 |[Occupations](https://www.hackerrank.com/challenges/occupations/problem) | [SQL](HackerRank/05.AS03-Occupations.sql) |
| 4 |[Binary Tree Nodes](https://www.hackerrank.com/challenges/binary-search-tree-1/problem) | [SQL](HackerRank/05.AS04-BinaryTreeNodes.sql)|
| 5 |[New Companies](https://www.hackerrank.com/challenges/the-company/problem) | [SQL](HackerRank/05.AS05-NewCompanies.sql) |

### Aggregation Challenges

| Number | Challenges | Solutions | 
| ------------- | ------------- | -------------|
| 1 | [Revising Aggregations - The Count Function](https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem) | [SQL](HackerRank/06.AG01-TheCountFunction.sql)  |
| 2 | [Revising Aggregations - The Sum Function](https://www.hackerrank.com/challenges/revising-aggregations-sum/problem) | [SQL](HackerRank/06.AG02-TheSumFunction.sql)  |
| 3 | [Revising Aggregations - Averages](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem) | [SQL](HackerRank/06.AG03-Averages.sql)  |
| 4 | [Average Population](https://www.hackerrank.com/challenges/average-population/problem) | [SQL](HackerRank/06.AG04-AveragePopulation.sql)  |
| 5 | [Japan Population](https://www.hackerrank.com/challenges/japan-population/problem) | [SQL](HackerRank/06.AG05-JapanPopulation.sql)  |
| 6 | [Population Density Difference](https://www.hackerrank.com/challenges/population-density-difference/problem) | [SQL](HackerRank/06.AG06-PopulationDensityDiff.sql)  |
| 7 | [The Blunder](https://www.hackerrank.com/challenges/the-blunder/problem) | [SQL](HackerRank/06.AG07-TheBlunder.sql)  |
| 8 | [Top Earners](https://www.hackerrank.com/challenges/earnings-of-employees/problem) | [SQL](HackerRank/06.AG08-TopEarners.sql)  |
| 9 | [Weather Observation Station 2](https://www.hackerrank.com/challenges/weather-observation-station-2/problem) | [SQL](HackerRank/06.AG09-WeatherObservationStation02.sql)  |
| 10 | [Weather Observation Station 13](https://www.hackerrank.com/challenges/weather-observation-station-13/problem) | [SQL](HackerRank/06.AG10-WeatherObservationStation13.sql)  |
| 11 | [Weather Observation Station 14](https://www.hackerrank.com/challenges/weather-observation-station-14/problem) | [SQL](HackerRank/06.AG11-WeatherObservationStation14.sql)  |
| 12 | [Weather Observation Station 15](https://www.hackerrank.com/challenges/weather-observation-station-15/problem) | [SQL](HackerRank/06.AG12-WeatherObservationStation15.sql)  |
| 13 | [Weather Observation Station 16](https://www.hackerrank.com/challenges/weather-observation-station-16/problem) | [SQL](HackerRank/06.AG13-WeatherObservationStation16.sql)  |
| 14 | [Weather Observation Station 17](https://www.hackerrank.com/challenges/weather-observation-station-17/problem) | [SQL](HackerRank/06.AG14-WeatherObservationStation17.sql)  |
| 15 | [Weather Observation Station 18](https://www.hackerrank.com/challenges/weather-observation-station-18/problem) | [SQL](HackerRank/06.AG15-WeatherObservationStation18.sql)  |
| 16 | [Weather Observation Station 19](https://www.hackerrank.com/challenges/weather-observation-station-19/problem) | [SQL](HackerRank/06.AG16-WeatherObservationStation19.sql)  |
| 17 | [Weather Observation Station 20](https://www.hackerrank.com/challenges/weather-observation-station-20/problem) | [SQL](HackerRank/06.AG17-WeatherObservationStation20.sql)  |

### Basic Join Challenges
| Number | Challenges | Solutions | 
| ------------- | ------------- | -------------|
| 1 | [Asian Population](https://www.hackerrank.com/challenges/asian-population/problem) | [SQL](HackerRank/07.BJ01-PopulationCensus.sql)  |
| 2 | [African Cities](https://www.hackerrank.com/challenges/african-cities/problem) | [SQL](HackerRank/07.BJ02-AfricanCities.sql)  |
| 3 | [Average Population of Each Continent](https://www.hackerrank.com/challenges/average-population-of-each-continent/problem) | [SQL](HackerRank/07.BJ03-AvgPopulation.sql)  |
| 4 | [The Report](https://www.hackerrank.com/challenges/the-report/problem) | [SQL](HackerRank/07.BJ04-TheReport.sql)  |
| 5 | [Top Competitors](https://www.hackerrank.com/challenges/full-score/problem) | [SQL](HackerRank/07.BJ05-TopCompetitors.sql)  |
| 6 | [Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem) | [SQL](HackerRank/07.BJ06-OllivandersInventory.sql)  |
| 7 | [Challenges](https://www.hackerrank.com/challenges/challenges/problem) | [SQL](HackerRank/07.BJ07-Challenges.sql)  |
| 8 | [Contest Leaderboard](https://www.hackerrank.com/challenges/contest-leaderboard/problem) | [SQL](HackerRank/07.BJ08-ContestLeaderboard.sql)  |

### Advanced Join Challenges
| Number | Challenges | Solutions | 
| ------------- | ------------- | -------------|
| 1 | [SQL Project Planning](https://www.hackerrank.com/challenges/sql-projects/problem) | [SQL](HackerRank/08.AJ01-SQLProjectPlanning.sql)  |
| 2 | [Placements](https://www.hackerrank.com/challenges/placements/problem) | [SQL](HackerRank/08.AJ02-Placements.sql)  |
| 3 | [Symmetric Pairs](https://www.hackerrank.com/challenges/symmetric-pairs/problem) | [SQL](HackerRank/08.AJ03-SymmetricPairs.sql)  |
| 4 | [Interviews](https://www.hackerrank.com/challenges/interviews/problem) | [SQL](HackerRank/08.AJ04-Interviews.sql)  |
| 5 | [15 Days of Learning SQL](https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem) | [SQL](HackerRank/08.AJ05-15DaysofLearningSQL.sql)  |


### Alternative Queries Challenges
| Number | Challenges | Solutions | 
| ------------- | ------------- | -------------|
| 1 | [Draw The Triangle 1](https://www.hackerrank.com/challenges/draw-the-triangle-1/problem) | [SQL](HackerRank/09.AQ01-DrawTheTriangle1.sql)  |
| 2 | [Draw The Triangle 2](https://www.hackerrank.com/challenges/draw-the-triangle-2/problem) | [SQL](HackerRank/09.AQ02-DrawTheTriangle2.sql)  |
| 3 | [Print Prime Numbers](https://www.hackerrank.com/challenges/print-prime-numbers/problem) | [SQL](HackerRank/09.AQ03-PrintPrimeNos.sql)  |

## References
- [Install MS SQL Server](https://www.microsoft.com/en-in/sql-server/sql-server-downloads?rtc=1).
- [Install tSQLt](https://tsqlt.org/downloads/)
- [Instant SQL Server](https://sqliteonline.com/)
- [Instant SQL Formatter](http://www.dpriver.com/pp/sqlformat.htm)
