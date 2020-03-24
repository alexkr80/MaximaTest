USE [master]
GO

CREATE DATABASE [maxima]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'maxima', FILENAME = N'D:\MSSQL\Data\maxima.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 3072KB )
 LOG ON 
( NAME = N'maxima_log', FILENAME = N'D:\MSSQL\Data\maxima_log.ldf' , SIZE = 10240KB , MAXSIZE = 204800KB , FILEGROWTH = 3072KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [maxima].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

