USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimTrkMerge]    Script Date: 25.06.2019 18:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimTrkMerge

Purpose:  Procedure for inserting data about incoming and outcoming trk.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimTrkMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimTrk AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(in_trk_code, 0) as in_trk_code, in_trk_num, in_trk_name
				  FROM
				  (
					SELECT 
						in_trk_code	AS in_trk_code,
						in_trk_num	AS in_trk_num,
						in_trk_name	AS in_trk_name
					FROM Stage.CallTemp
					UNION ALL			
					SELECT			
						code_used     AS code_used,
						out_trk_num   AS out_trk_num,
						out_trk_name   AS out_trk_name
					FROM Stage.CallTemp
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.in_trk_code, 0)   = ISNULL(Tdest.TrkCode,0)
					 AND ISNULL(Tsrc.in_trk_num, 0) = ISNULL(Tdest.TrkNum, 0)
					 AND ISNULL(Tsrc.in_trk_name, '') = ISNULL(Tdest.TrkName, '')
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (TrkCode, TrkNum, TrkName)			
			VALUES (Tsrc.in_trk_code, Tsrc.in_trk_num, in_trk_name);	
	

END;