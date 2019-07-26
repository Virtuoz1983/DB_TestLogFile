USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimFlag_Feed]    Script Date: 26.07.2019 21:53:57 ******/
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

ALTER PROCEDURE [Log].[usp_DimFlag_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimFlag] ON;
   
   IF EXISTS (SELECT Log.DimFlag.FlagId FROM Log.DimFlag WHERE Log.DimFlag.FlagId = -1)
  UPDATE 
		log.DimFlag
						SET Log.DimFlag.FlagName = ''
						WHERE Log.DimFlag.FlagId = '-1'

						ELSE

  INSERT INTO [Log].[DimFlag] ([FlagId], [FlagName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimFlag] OFF;

END
