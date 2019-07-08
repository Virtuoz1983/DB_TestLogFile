USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimNumberMerge]    Script Date: 25.06.2019 18:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimNumberMerge

Purpose:  Procedure for inserting data about calling and dialed numbers.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimNumberMerge] AS

BEGIN

   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimNumber AS Tdest
	   USING
			(
			      SELECT DISTINCT calling_num
				  FROM
				  (
					SELECT 
						calling_num	AS calling_num
					FROM Stage.CallTemp
					UNION ALL			
					SELECT			
						dialed_num     AS dialed_num
					FROM Stage.CallTemp
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.calling_num ,0)   = ISNULL(Tdest.Number,0)
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (Number)			
			VALUES (Tsrc.calling_num);	
	

END;