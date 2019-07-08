USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimCondition_Feed]    Script Date: 05.07.2019 17:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimCondition_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimLocation] ON;
   
  INSERT INTO [Log].[DimCondition] ([ConditionId], [ConditionName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimCondition] OFF;

END
