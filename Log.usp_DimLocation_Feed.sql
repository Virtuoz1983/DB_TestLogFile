USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimLocation_Feed]    Script Date: 31.07.2019 16:15:07 ******/
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

ALTER PROCEDURE [Log].[usp_DimLocation_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimLocation] ON;
   
   IF EXISTS (SELECT Log.DimLocation.LocationId FROM Log.DimLocation WHERE Log.DimLocation.LocationId = -1)
  UPDATE 
		log.DimLocation
						SET Log.DimLocation.LocationName = ''
						WHERE Log.DimLocation.LocationId = '-1'

						ELSE

  INSERT INTO [Log].[DimLocation] ([LocationId], [LocationNum])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimLocation] OFF;

END
