USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimCondition_Feed]    Script Date: 26.07.2019 21:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimFeatFlagMerge

Purpose:  Procedure for inserting data about feat flags.

Activities:

Date		Modified By			Comments
26.07.2019  Labunets S.O.       Added EXISTS check

*/

ALTER PROCEDURE [Log].[usp_DimCondition_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimLocation] ON;
  
  IF EXISTS (SELECT Log.DimCondition.ConditionId FROM Log.DimCondition WHERE Log.DimCondition.ConditionId = -1)
  UPDATE 
		log.DimCondition
						SET Log.DimCondition.ConditionName = ''
						WHERE Log.DimCondition.ConditionId = '-1'

						ELSE
  
  INSERT INTO [Log].[DimCondition] ([ConditionId], [ConditionName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimCondition] OFF;

END
