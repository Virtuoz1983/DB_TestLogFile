USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimInternalCodecMerge]    Script Date: 31.07.2019 16:12:12 ******/
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
					WHERE internal_codec_f != ''

				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.internal_codec_f, 0)   = ISNULL(Tdest.InternalCodecName, 0)
										 
		-- New attributes

		WHEN MATCHED AND ISNULL(Tsrc.internal_codec_f,'') <> ISNULL(Tdest.InternalCodecName,'')
			THEN
				UPDATE
				SET  Tdest.InternalCodecName = Tsrc.internal_codec_f

		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (InternalCodecName)			
			VALUES (Tsrc.internal_codec_f);	


END;