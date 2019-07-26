USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimFeatFlagMerge]    Script Date: 26.07.2019 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimFeatFlagMerge

Purpose:  Procedure for inserting data about feat flags.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimFeatFlagMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimFeatFlag AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(feat_flag, 0) as feat_flag, feat_flag_f
				  FROM
				  (
					SELECT 
						feat_flag	AS feat_flag,
						feat_flag_f	AS feat_flag_f
					FROM Stage.CallTemp
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.feat_flag, 0)   = ISNULL(Tdest.FeatFlagId,0)
					 AND ISNULL(Tsrc.feat_flag_f,'') = ISNULL(Tdest.FeatFlagName,'')
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (FeatFlagName)			
			VALUES (Tsrc.feat_flag_f);	
	

END;