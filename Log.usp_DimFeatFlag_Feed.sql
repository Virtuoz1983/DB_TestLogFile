USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimFeatFlag_Feed]    Script Date: 05.07.2019 17:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimFeatFlag_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimFeatFlag] ON;
   
  INSERT INTO [Log].[DimFeatFlag] ([FeatFlagId], [FeatFlagName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimFeatFlag] OFF;

END
