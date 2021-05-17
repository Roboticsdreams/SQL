/*                                                                        */
/*              HackerRankInstall.sql - Creates the hackerrank database    */ 
/*                                                                        */

SET NOCOUNT ON

GO

SET dateformat mdy

USE master

declare @dttm varchar(55)
select  @dttm=convert(varchar,getdate(),113)
raiserror('Beginning HackerRankInstall.sql at %s ....',1,1,@dttm) with nowait

GO

IF EXISTS (select * from sysdatabases where name='hackerrank')
	BEGIN
		raiserror('Dropping existing hackerrank database ....',0,1)
		DROP database hackerrank
	END
GO

CHECKPOINT

GO

raiserror('Creating hackerrank database....',0,1)

GO

use master

GO

CREATE DATABASE hackerrank

GO

CHECKPOINT

GO

USE hackerrank

GO

IF db_name() <> 'hackerrank'
   raiserror('Error in HackerRankInstall.SQL, ''USE hackerrank'' failed!  Killing the SPID now.',22,127) with log
GO

IF CAST(SERVERPROPERTY('ProductMajorVersion') AS INT) < 12 
	BEGIN
		exec sp_dboption 'hackerrank','trunc. log on chkpt.','true'
		exec sp_dboption 'hackerrank','select into/bulkcopy','true'
	END
ELSE 
	ALTER DATABASE [hackerrank] SET RECOVERY SIMPLE WITH NO_WAIT
GO

execute sp_addtype id      ,'varchar(11)' ,'NOT NULL'
execute sp_addtype tid     ,'varchar(6)'  ,'NOT NULL'
execute sp_addtype empid   ,'char(9)'     ,'NOT NULL'

raiserror('Now at the create schema section ....',0,1)

GO

CREATE SCHEMA basicselect;

GO

CREATE SCHEMA advancedselect;

GO

CREATE SCHEMA aggregation;

GO

CREATE SCHEMA basicjoin;

GO

CREATE SCHEMA advancedjoin;

GO

CREATE SCHEMA alternativequeries;

GO

SET QUOTED_IDENTIFIER ON;

GO

CHECKPOINT

GO

USE master

GO

declare @dttm varchar(55)
select  @dttm=convert(varchar,getdate(),113)
raiserror('Ending hackerranksql.SQL at %s ....',1,1,@dttm) with nowait

GO