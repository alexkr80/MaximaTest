-- Скрипт создания базы

USE [maxima]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[City] ADD  DEFAULT ((0)) FOR [Id]
GO

ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF__City__Name__06EF628D_City]  DEFAULT ('') FOR [Name]
GO

CREATE TABLE [dbo].[Company](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [Company_uq] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF__Company__Id__0412F5E2_Company]  DEFAULT ((0)) FOR [Id]
GO

ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF__Company__Name__05071A1B_Company]  DEFAULT ('') FOR [Name]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Список организаций' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company'
GO


CREATE TABLE [dbo].[DBMS](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Список баз данных' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DBMS'
GO


CREATE TABLE [dbo].[Developer](
	[id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[level] [smallint] NOT NULL,
	[Company] [int] NOT NULL,
	[ActualCity] [int] NOT NULL,
	[ExperienceInYears] [smallint] NOT NULL,
 CONSTRAINT [Developer_pk_Developer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Developer] ADD  CONSTRAINT [DF__Developer__id__75C4D68B_Developer]  DEFAULT ((0)) FOR [id]
GO

ALTER TABLE [dbo].[Developer] ADD  CONSTRAINT [DF__Developer__Name__77AD1EFD_Developer]  DEFAULT ('') FOR [Name]
GO

ALTER TABLE [dbo].[Developer] ADD  CONSTRAINT [DF__Developer__level__74D0B252_Developer]  DEFAULT ((0)) FOR [level]
GO

ALTER TABLE [dbo].[Developer] ADD  CONSTRAINT [DF__Developer__Compa__7D65F853_Developer]  DEFAULT ('') FOR [Company]
GO

ALTER TABLE [dbo].[Developer] ADD  CONSTRAINT [DF__Developer__Actua__7E5A1C8C_Developer]  DEFAULT ((0)) FOR [ActualCity]
GO

ALTER TABLE [dbo].[Developer] ADD  CONSTRAINT [DF__Developer__Exper__7F4E40C5_Developer]  DEFAULT ((0)) FOR [ExperienceInYears]
GO

EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Список разработчиков' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Developer'
GO


CREATE TABLE [dbo].[DeveloperDBMS](
	[Id] [int] NOT NULL,
	[DBMS] [int] NOT NULL,
	[Developer] [varchar](100) NOT NULL,
	[Version] [smallint] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeveloperDBMS] ADD  CONSTRAINT [DF__DeveloperDBM__Id__08D7AAFF_DeveloperDBMS]  DEFAULT ((0)) FOR [Id]
GO

ALTER TABLE [dbo].[DeveloperDBMS] ADD  CONSTRAINT [DF__DeveloperD__DBMS__09CBCF38_DeveloperDBMS]  DEFAULT ((0)) FOR [DBMS]
GO

ALTER TABLE [dbo].[DeveloperDBMS] ADD  CONSTRAINT [DF__Developer__Devel__0ABFF371_DeveloperDBMS]  DEFAULT ('') FOR [Developer]
GO

ALTER TABLE [dbo].[DeveloperDBMS] ADD  CONSTRAINT [DF__Developer__Versi__0BB417AA_DeveloperDBMS]  DEFAULT ((0)) FOR [Version]
GO


CREATE TABLE [dbo].[DeveloperDBMSTag](
	[DeveloperDBMS] [int] NOT NULL,
	[Tag] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeveloperDBMSTag] ADD  CONSTRAINT [DF__Developer__Devel__1631A61D_DeveloperDBMSTag]  DEFAULT ((0)) FOR [DeveloperDBMS]
GO

ALTER TABLE [dbo].[DeveloperDBMSTag] ADD  CONSTRAINT [DF__DeveloperDB__Tag__1725CA56_DeveloperDBMSTag]  DEFAULT ('') FOR [Tag]
GO


CREATE TABLE [dbo].[DeveloperLanguage](
	[Id] [int] NOT NULL,
	[Developer] [int] NOT NULL,
	[Language] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeveloperLanguage] ADD  CONSTRAINT [DF__DeveloperLan__Id__116CF100_DeveloperLanguage]  DEFAULT ((0)) FOR [Id]
GO

ALTER TABLE [dbo].[DeveloperLanguage] ADD  CONSTRAINT [DF__Developer__Devel__12611539_DeveloperLanguage]  DEFAULT ((0)) FOR [Developer]
GO

ALTER TABLE [dbo].[DeveloperLanguage] ADD  CONSTRAINT [DF__Developer__Langu__13553972_DeveloperLanguage]  DEFAULT ('') FOR [Language]
GO


CREATE TABLE [dbo].[DeveloperLanguageTag](
	[DeveloperLanguage] [int] NULL,
	[IsWriter] [tinyint] NOT NULL,
	[Tag] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeveloperLanguageTag] ADD  CONSTRAINT [DF__Developer__IsWri__190E12C8_DeveloperLanguageTag]  DEFAULT ((0)) FOR [IsWriter]
GO

ALTER TABLE [dbo].[DeveloperLanguageTag] ADD  CONSTRAINT [DF__DeveloperLa__Tag__1A023701_DeveloperLanguageTag]  DEFAULT ('') FOR [Tag]
GO


-- Представление

CREATE VIEW [dbo].[viewDeveloper] (
   [Name],
   [Level],
   Advantage
)
AS
    select d.Name as DeveloperName, d.[Level],
                  (
                      case
                          when exists (select * from dbo.DeveloperLanguage as dl where dl.Developer = d.Id and dl.[Language] in ('C#', 'Java', 'Delphi')) then 1 
                          else 0 
                      end +
                      iif(ddbt.DeveloperDBMS is null, 0, 1) +
                      iif(dlt.DeveloperLanguage is null, 0, 1)
                  ) as Advantage
              from dbo.Developer as d
              inner join dbo.Company as c on c.Id = d.Company
              inner join dbo.City as ct on ct.Id = d.ActualCity
              inner join dbo.DeveloperDBMS as ddb on ddb.Developer = d.Id
              inner join dbo.DeveloperLanguage as dl on dl.Developer = d.Id and dl.[Language] = 'T-SQL'
              inner join dbo.DBMS as db on db.Id = ddb.DBMS
              left join dbo.DeveloperDBMSTag as ddbt on ddbt.DeveloperDBMS = ddb.Id and ddbt.Tag = 'AlwaysOn'
              left join dbo.DeveloperLanguageTag as dlt on dlt.DeveloperLanguage = dl.Id and dlt.IsWriter = 1 and dlt.Tag = 'MOT'
              where 
                  ct.Name = 'Kazan' and c.Name != 'Maxima' and 
                  db.Name = 'MS SQL Server' and ddb.[Version] in (2008, 2012, 2014, 2016) and
                  (select count(*) from dbo.DeveloperDBMSTag as ddbt where ddbt.DeveloperDBMS = ddb.Id and ddbt.Tag in ('OLTP', 'lock', 'transaction', 'optimization', 'admin')) >= 4 and
                  (
                      select count(*)
                          from dbo.DeveloperLanguageTag as dlt
                          where dlt.DeveloperLanguage = dl.Id and dlt.IsWriter = 1 and dlt.Tag in ('index', 'procedure', 'function', 'trigger', 'view')
                  ) > 3 and
                  d.ExperienceInYears >= 2
GO



