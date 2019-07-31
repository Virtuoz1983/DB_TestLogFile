USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimFrl_Feed]    Script Date: 31.07.2019 16:14:44 ******/
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

ALTER PROCEDURE [Log].[usp_DimFrl_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimFrl] ON;
  
  IF EXISTS (SELECT Log.DimFrl.FrlId FROM Log.DimFrl WHERE Log.DimFrl.FrlId = -1)
  UPDATE 
		log.DimFrl
						SET Log.DimFrl.FrlName = ''
						WHERE Log.DimFrl.FrlId = '-1'

						ELSE
   
  INSERT INTO [Log].[DimFrl] ([FrlId], [FrlName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimFrl] OFF;

END
