USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimInternalCodec_Feed]    Script Date: 31.07.2019 16:14:52 ******/
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

ALTER PROCEDURE [Log].[usp_DimInternalCodec_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimInternalCodec] ON;
   
    IF EXISTS (SELECT Log.DimInternalCodec.InternalCodecId FROM Log.DimInternalCodec WHERE Log.DimInternalCodec.InternalCodecId = -1)
  UPDATE 
		log.DimInternalCodec
						SET Log.DimInternalCodec.InternalCodecName = ''
						WHERE Log.DimInternalCodec.InternalCodecId = '-1'

						ELSE

  INSERT INTO [Log].[DimInternalCodec] ([InternalCodecId], [InternalCodecName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimInternalCodec] OFF;

END
