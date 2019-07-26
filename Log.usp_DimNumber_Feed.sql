USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimNumber_Feed]    Script Date: 26.07.2019 21:54:34 ******/
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

ALTER PROCEDURE [Log].[usp_DimNumber_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimNumber] ON;
   
   IF EXISTS (SELECT Log.DimNumber.NumberId FROM Log.DimNumber WHERE Log.DimNumber.NumberId = -1)
  UPDATE 
		log.DimNumber
						SET Log.DimNumber.Number = ''
						WHERE Log.DimNumber.NumberId = '-1'

						ELSE

  INSERT INTO [Log].[DimNumber] ([NumberId], [Number])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimNumber] OFF;

END
