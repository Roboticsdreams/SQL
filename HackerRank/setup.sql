!! CD C:\Users\ & FOR /F %B IN ('DIR /B /A -HS /S setup.sql') DO ECHO :setvar filepath "%~dpB" > %TEMP%\relative_path.txt

:r $(TEMP)\relative_path.txt

:r $(filepath)\01.HackerRankInstall.sql
:r $(filepath)\02.SetClrEnabled.sql
:r $(filepath)\03.tSQLt.class.sql