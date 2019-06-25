USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimInternalCodecMerge]    Script Date: 25.06.2019 18:42:00 ******/
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
					 AND ISNULL(Tsrc.internal_codec_f,'') = ISNULL(Tdest.InternalCodecName,'')
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (InternalCodecId, InternalCodecName)			
			VALUES (Tsrc.internal_codec, Tsrc.internal_codec_f);	
	

END;