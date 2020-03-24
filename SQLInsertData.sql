 BEGIN TRANSACTION
GO

INSERT INTO [dbo].[City] ([Id], [Name])
VALUES (1, N'Kazan')
GO

INSERT INTO [dbo].[City] ([Id], [Name])
VALUES (2, N'Moscow')
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Company] ([Id], [Name])
VALUES (1, N'Maxima')
GO

INSERT INTO [dbo].[Company] ([Id], [Name])
VALUES (2, N'Yandex')
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

INSERT INTO [dbo].[DBMS] ([Id], [Name])
VALUES (1, N'MS SQL Server')
GO

INSERT INTO [dbo].[DBMS] ([Id], [Name])
VALUES (2, N'Oracle')
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Developer] ([id], [Name], [level], [Company], [ActualCity], [ExperienceInYears])
VALUES (1, N'Ivanov', 1, 1, 1, 4)
GO

INSERT INTO [dbo].[Developer] ([id], [Name], [level], [Company], [ActualCity], [ExperienceInYears])
VALUES (2, N'Petrov', 1, 1, 1, 2)
GO

INSERT INTO [dbo].[Developer] ([id], [Name], [level], [Company], [ActualCity], [ExperienceInYears])
VALUES (3, N'Sidorov', 1, 1, 1, 1)
GO

INSERT INTO [dbo].[Developer] ([id], [Name], [level], [Company], [ActualCity], [ExperienceInYears])
VALUES (4, N'Svetlakov', 1, 2, 1, 4)
GO

INSERT INTO [dbo].[Developer] ([id], [Name], [level], [Company], [ActualCity], [ExperienceInYears])
VALUES (5, N'Volodin', 2, 2, 1, 5)
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

INSERT INTO [dbo].[DeveloperDBMS] ([Id], [DBMS], [Developer], [Version])
VALUES (1, 1, N'4', 2008)
GO

INSERT INTO [dbo].[DeveloperDBMS] ([Id], [DBMS], [Developer], [Version])
VALUES (2, 1, N'4', 2012)
GO

INSERT INTO [dbo].[DeveloperDBMS] ([Id], [DBMS], [Developer], [Version])
VALUES (3, 1, N'5', 2014)
GO

INSERT INTO [dbo].[DeveloperDBMS] ([Id], [DBMS], [Developer], [Version])
VALUES (4, 1, N'5', 2016)
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (1, N'AlwaysOn')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (1, N'admin')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (1, N'OLTP')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (1, N'lock')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (1, N'transaction')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (1, N'optimization')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (4, N'AlwaysOn')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (4, N'optimization')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (4, N'lock')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (4, N'admin')
GO

INSERT INTO [dbo].[DeveloperDBMSTag] ([DeveloperDBMS], [Tag])
VALUES (4, N'transaction')
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

INSERT INTO [dbo].[DeveloperLanguage] ([Id], [Developer], [Language])
VALUES (1, 4, N'C#')
GO

INSERT INTO [dbo].[DeveloperLanguage] ([Id], [Developer], [Language])
VALUES (2, 4, N'T-SQL')
GO

INSERT INTO [dbo].[DeveloperLanguage] ([Id], [Developer], [Language])
VALUES (3, 4, N'Java')
GO

INSERT INTO [dbo].[DeveloperLanguage] ([Id], [Developer], [Language])
VALUES (4, 5, N'T-SQL')
GO

INSERT INTO [dbo].[DeveloperLanguage] ([Id], [Developer], [Language])
VALUES (5, 5, N'C#')
GO

COMMIT
GO

﻿BEGIN TRANSACTION
GO

/* Data for the 'dbo.DeveloperLanguageTag' table  (Records 1 - 10) */

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (2, 1, N'index')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (2, 1, N'procedure')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (2, 1, N'function')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (2, 1, N'trigger')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (2, 1, N'MOT')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (4, 1, N'index')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (4, 1, N'procedure')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (4, 1, N'trigger')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (4, 1, N'MOT')
GO

INSERT INTO [dbo].[DeveloperLanguageTag] ([DeveloperLanguage], [IsWriter], [Tag])
VALUES (4, 1, N'function')
GO

COMMIT
GO