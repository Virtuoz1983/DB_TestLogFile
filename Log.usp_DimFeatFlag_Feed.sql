USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimFeatFlag_Feed]    Script Date: 26.07.2019 21:53:45 ******/
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

ALTER PROCEDURE [Log].[usp_DimFeatFlag_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimFeatFlag] ON;
 
 IF EXISTS (SELECT Log.DimFeatFlag.FeatFlagName FROM Log.DimFeatFlag WHERE Log.DimFeatFlag.FeatFlagId = -1)
  UPDATE 
		log.DimFeatFlag
						SET Log.DimFeatFlag.FeatFlagName = ''
						WHERE Log.DimFeatFlag.FeatFlagId= '-1'

						ELSE
 
   
  INSERT INTO [Log].[DimFeatFlag] ([FeatFlagId], [FeatFlagName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimFeatFlag] OFF;

END
