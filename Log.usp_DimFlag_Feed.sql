USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimFlag_Feed]    Script Date: 05.07.2019 17:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimFlag_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimFlag] ON;
   
  INSERT INTO [Log].[DimFlag] ([FlagId], [FlagName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimFlag] OFF;

END
