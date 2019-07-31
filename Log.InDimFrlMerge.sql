USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimFrlMerge]    Script Date: 31.07.2019 16:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimFrlMerge

Purpose:  Procedure for inserting data about Frl.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimFrlMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimFrl AS Tdest
	   USING
			(
			      SELECT DISTINCT frl, frl_f
				  FROM
				  (
					SELECT 
						frl		AS frl,
						frl_f	AS frl_f
					FROM Stage.CallTemp
					WHERE frl_f IS NOT NULL
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.frl_f,'') = ISNULL(Tdest.FrlName,'')
			
			
			WHEN MATCHED
				THEN
					 UPDATE
							SET 
								Tdest.FrlName = Tsrc.frl_f
					 
		-- New attributes
		WHEN NOT MATCHED
		THEN
			INSERT (FrlName)			
			VALUES (Tsrc.frl_f);
			
END;