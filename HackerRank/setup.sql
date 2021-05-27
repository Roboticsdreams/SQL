:setvar sname ATH57293\SQLEXPRESS

:setvar filepath C:\Users\prathinavel\Downloads\Workspace\SQL\HackerRank

!!sqlcmd -S $(sname) -i $(filepath)\01.HackerRankInstall.sql
!!sqlcmd -S $(sname) -i $(filepath)\02.SetClrEnabled.sql
!!sqlcmd -S $(sname) -i $(filepath)\03.tSQLt.class.sql