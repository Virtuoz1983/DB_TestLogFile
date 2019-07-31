USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimLocationMerge]    Script Date: 31.07.2019 16:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Procedure: Log.usp_DimLocation_Merge

Purpose:  Procedure for inserting data about calling location from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column

*/


ALTER PROCEDURE [Log].[InDimLocationMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimLocation AS Tdest
	   USING
			(
			      SELECT DISTINCT location_name
				  FROM
				  (
					SELECT 
						location_from_f	AS location_name				 	
						FROM Stage.CallTemp
							WHERE location_from_f != ''
					UNION ALL			
					SELECT			
						location_to_f   AS location_name
						FROM Stage.CallTemp
							WHERE location_to_f != ''
				  ) AS A			  
			) AS Tsrc ON ISNULL(Tsrc.location_name,'') = ISNULL(Tdest.LocationName,'')
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (LocationName)			
			VALUES (Tsrc.location_name);	


END;


