USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimIpMerge]    Script Date: 31.07.2019 16:12:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimIpMerge

Purpose:  Procedure for inserting data about Ip.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimIpMerge] AS

BEGIN


 SET NOCOUNT ON;
             
	   MERGE INTO Log.DimIp AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(calling_ip, 0) as calling_ip
				  FROM
				  (
					SELECT 
						calling_ip	AS calling_ip
						FROM Stage.CallTemp
							WHERE calling_ip != ''
					UNION ALL			
					SELECT			
						dialed_ip   AS dialed_ip
						FROM Stage.CallTemp
							WHERE dialed_ip != ''
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.calling_ip, 0)   = ISNULL(Tdest.Ip,0)
					 
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (Ip)			
			VALUES (Tsrc.calling_ip);	

END;