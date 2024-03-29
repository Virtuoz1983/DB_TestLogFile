/*
Procedure: Log.usp_DimLocation_Merge

Purpose:  Procedure for inserting data about calling location from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column

*/


CREATE PROCEDURE Log.usp_DimLocation_Merge AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimLocation AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(location_num,0) as location_num, location_name
				  FROM
				  (
					SELECT 
						location_from	AS location_num,
						location_from_f	AS location_name				 	
					FROM Stage.CallTemp
					UNION ALL			
					SELECT			
						location_to     AS location_num,
						location_to_f   AS location_name
					FROM Stage.CallTemp
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.location_num,0)   = ISNULL(Tdest.LocationNum,0)
					 AND ISNULL(Tsrc.location_name,'') = ISNULL(Tdest.LocationName,'')
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (LocationNum, LocationName)			
			VALUES (Tsrc.location_num, Tsrc.location_name);	
	

END;


