USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimConditionMerge]    Script Date: 26.07.2019 21:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

*/



ALTER PROCEDURE [Log].[InDimConditionMerge] AS

BEGIN

   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimCondition AS Tdest
	   USING
			(
			      SELECT DISTINCT cond_code, cond_code_f
				  FROM
				  (
					SELECT
						cond_code	AS cond_code,
						cond_code_f	AS cond_code_f
					FROM Stage.CallTemp
					WHERE cond_code IS NOT NULL
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.cond_code,0)   = ISNULL(Tdest.ConditionId, 0)
					 
		-- New attributes

		WHEN MATCHED AND ISNULL(Tsrc.cond_code_f,'') <> ISNULL(Tdest.ConditionName, '')
		THEN
			UPDATE
			SET Tdest.ConditionName = Tsrc.cond_code_f

		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (ConditionName)			
			VALUES (Tsrc.cond_code_f);



END;