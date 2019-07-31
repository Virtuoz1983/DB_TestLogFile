USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimUriMerge]    Script Date: 31.07.2019 16:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimUriMerge

Purpose:  Procedure for inserting data about Uri.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes

*/

ALTER PROCEDURE [Log].[InDimUriMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimUri AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(from_uri, 0) as from_uri
				  FROM
				  (
					SELECT 
						from_uri	AS from_uri
					FROM Stage.CallTemp
					UNION ALL
					SELECT 
						to_uri AS from_uri
						FROM Stage.CallTemp
					) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.from_uri, 0)   = ISNULL(Tdest.UriName, 0)
					 
		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (UriName)			
			VALUES (Tsrc.from_uri);	


END;