USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimTrunkCodecMerge]    Script Date: 25.06.2019 18:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimTrunkCodecMerge

Purpose:  Procedure for inserting data about trunk codecs.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimTrunkCodecMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimTrunkCodec AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(trunk_codec, 0) as trunk_codec, trunk_codec_f
				  FROM
				  (
					SELECT 
						trunk_codec	AS trunk_codec,
						trunk_codec_f	AS trunk_codec_f
					FROM Stage.CallTemp
					) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.trunk_codec, 0)   = ISNULL(Tdest.TrunkCodecId, 0)
					 AND ISNULL(Tsrc.trunk_codec_f, 0) = ISNULL(Tdest.TrunkcodecName, 0)
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (TrunkCodecId, TrunkCodecName)			
			VALUES (Tsrc.trunk_codec, Tsrc.trunk_codec_f);	
	

END;