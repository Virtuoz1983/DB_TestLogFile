USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimTrunkCodecMerge]    Script Date: 26.07.2019 21:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimFrlMerge

Purpose:  Procedure for inserting data about TrunkCodec.

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
					SELECT DISTINCT
						trunk_codec		AS trunk_codec,
						trunk_codec_f	AS trunk_codec_f
					FROM Stage.CallTemp
					WHERE trunk_codec IS NOT NULL
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.trunk_codec, 0)   = ISNULL(Tdest.TrunkCodecId,0)
					 AND ISNULL(Tsrc.trunk_codec_f,'') = ISNULL(Tdest.TrunkCodecName,'')
			
			
			WHEN MATCHED AND Tsrc.trunk_codec = Tdest.TrunkCodecId
				THEN
					 UPDATE
							SET 
								Tdest.TrunkCodecName = Tsrc.trunk_codec_f
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (TrunkCodecName)			
			VALUES (Tsrc.trunk_codec_f);


	

END;