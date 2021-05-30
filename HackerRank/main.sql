!! CD C:\Users\ & FOR /F %B IN ('DIR /B /A -HS /S main.sql') DO ECHO :setvar filepath "%~dpB" > %TEMP%\relative_path.txt

:r $(TEMP)\relative_path.txt

:r $(filepath)\04.BS00-BasicSelect.sql
:r $(filepath)\04.BS01-Query-I.sql
:r $(filepath)\04.BS02-Query-II.sql
:r $(filepath)\04.BS03-SelectAll.sql
:r $(filepath)\04.BS04-SelectByID.sql
:r $(filepath)\04.BS05-JapaneseCitiesAttributes.sql
:r $(filepath)\04.BS06-JapaneseCitiesNames.sql
:r $(filepath)\04.BS07-WeatherObservationStation01.sql
:r $(filepath)\04.BS08-WeatherObservationStation03.sql
:r $(filepath)\04.BS09-WeatherObservationStation04.sql
:r $(filepath)\04.BS10-WeatherObservationStation05.sql
:r $(filepath)\04.BS11-WeatherObservationStation06.sql
:r $(filepath)\04.BS12-WeatherObservationStation07.sql
:r $(filepath)\04.BS13-WeatherObservationStation08.sql
:r $(filepath)\04.BS14-WeatherObservationStation09.sql
:r $(filepath)\04.BS15-WeatherObservationStation10.sql
:r $(filepath)\04.BS16-WeatherObservationStation11.sql
:r $(filepath)\04.BS17-WeatherObservationStation12.sql
:r $(filepath)\04.BS18-Higherthan75.sql
:r $(filepath)\04.BS19-EmployeeNames.sql
:r $(filepath)\04.BS20-EmployeeSalaries.sql

:r $(filepath)\05.AS00-AdvancedSelect.sql
:r $(filepath)\05.AS01-TypeofTriangle.sql
:r $(filepath)\05.AS02-ThePADS.sql
:r $(filepath)\05.AS03-Occupations.sql
:r $(filepath)\05.AS04-BinaryTreeNodes.sql
:r $(filepath)\05.AS05-NewCompanies.sql

:r $(filepath)\06.AG00-Aggregation.sql
:r $(filepath)\06.AG01-TheCountFunction.sql
:r $(filepath)\06.AG02-TheSumFunction.sql
:r $(filepath)\06.AG03-Averages.sql
:r $(filepath)\06.AG04-AveragePopulation.sql
:r $(filepath)\06.AG05-JapanPopulation.sql
:r $(filepath)\06.AG06-PopulationDensityDiff.sql
:r $(filepath)\06.AG07-TheBlunder.sql
:r $(filepath)\06.AG08-TopEarners.sql
:r $(filepath)\06.AG09-WeatherObservationStation02.sql
:r $(filepath)\06.AG10-WeatherObservationStation13.sql
:r $(filepath)\06.AG11-WeatherObservationStation14.sql
:r $(filepath)\06.AG12-WeatherObservationStation15.sql
:r $(filepath)\06.AG13-WeatherObservationStation16.sql
:r $(filepath)\06.AG14-WeatherObservationStation17.sql
:r $(filepath)\06.AG15-WeatherObservationStation18.sql
:r $(filepath)\06.AG16-WeatherObservationStation19.sql
:r $(filepath)\06.AG17-WeatherObservationStation20.sql

:r $(filepath)\07.BJ00-BasicJoin.sql
:r $(filepath)\07.BJ01-PopulationCensus.sql
:r $(filepath)\07.BJ02-AfricanCities.sql
:r $(filepath)\07.BJ03-AvgPopulation.sql
:r $(filepath)\07.BJ04-TheReport.sql
:r $(filepath)\07.BJ05-TopCompetitors.sql
:r $(filepath)\07.BJ06-OllivandersInventory.sql
:r $(filepath)\07.BJ07-Challenges.sql
:r $(filepath)\07.BJ08-ContestLeaderboard.sql

:r $(filepath)\08.AJ00-AdvancedJoin.sql
:r $(filepath)\08.AJ01-SQLProjectPlanning.sql
:r $(filepath)\08.AJ02-Placements.sql
:r $(filepath)\08.AJ03-SymmetricPairs.sql
:r $(filepath)\08.AJ04-Interviews.sql
:r $(filepath)\08.AJ05-15DaysofLearningSQL.sql

:r $(filepath)\09.AQ00-AlternativeQueries.sql
:r $(filepath)\09.AQ01-DrawTheTriangle1.sql
:r $(filepath)\09.AQ02-DrawTheTriangle2.sql
:r $(filepath)\09.AQ03-PrintPrimeNos.sql

:r $(filepath)\10.FinalTestcases.sql