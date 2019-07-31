USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimTrunkCodec_Feed]    Script Date: 31.07.2019 16:15:28 ******/
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

ALTER PROCEDURE [Log].[usp_DimTrunkCodec_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimTrunkCodec] ON;
   
   IF EXISTS (SELECT Log.DimTrunkCodec.TrunkCodecId FROM Log.DimTrunkCodec WHERE Log.DimTrunkCodec.TrunkCodecId = -1)
  UPDATE 
		log.DimTrunkCodec
						SET Log.DimTrunkCodec.TrunkCodecName = ''
						WHERE Log.DimTrunkCodec.TrunkCodecId = '-1'

						ELSE

  INSERT INTO [Log].[DimTrunkCodec] ([TrunkCodecId], [TrunkCodecName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimTrunkCodec] OFF;

END
