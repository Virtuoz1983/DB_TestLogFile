USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimUri_Feed]    Script Date: 26.07.2019 21:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimUri_Feed]
AS 
BEGIN

/*
Procedure: Log.InDimFeatFlagMerge

Purpose:  Procedure for inserting data about feat flags.

Activities:

Date		Modified By			Comments
26.07.2019  Labunets S.O.       Added EXISTS check

*/
 
  SET IDENTITY_INSERT [Log].[DimUri] ON;
   
   IF EXISTS (SELECT Log.DimUri.UriId FROM Log.DimUri WHERE Log.DimUri.UriId = -1)
  UPDATE 
		log.DimUri
						SET Log.DimUri.UriName = ''
						WHERE Log.DimUri.UriId = '-1'

						ELSE

  INSERT INTO [Log].[DimUri] ([UriId], [UriName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimUri] OFF;

END
