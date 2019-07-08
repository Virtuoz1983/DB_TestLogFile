USE [DB_TestLogFile]
GO

/*
Procedure: Log.InDimConditionMerge

Purpose:  Procedure for inserting data about conditions.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes
03.07.2019  Labunets S.O.		Created update possibility

*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [Log].[InDimInternalCodecMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimInternalCodec AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(internal_codec, 0) as internal_codec, internal_codec_f
				  FROM
				  (
					SELECT 
						internal_codec AS internal_codec,
						internal_codec_f	AS internal_codec_f
					FROM Stage.CallTemp
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.internal_codec, 0)   = ISNULL(Tdest.InternalCodecId, 0)
										 
		-- New attributes

		WHEN MATCHED AND ISNULL(Tsrc.internal_codec_f,'') <> ISNULL(Tdest.InternalCodecName,'')
			THEN
				UPDATE
				SET  Tdest.InternalCodecName = Tsrc.internal_codec_f

		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (InternalCodecId, InternalCodecName)			
			VALUES (Tsrc.internal_codec, Tsrc.internal_codec_f);	
	

END;