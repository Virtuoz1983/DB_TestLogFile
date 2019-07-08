USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[InDimFlagMerge]    Script Date: 05.07.2019 17:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimFlagMerge

Purpose:  Procedure for inserting data about flags.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
10.06.2019  Tereschenko V.A.    Made refactoring
10.06.2019  Tereschenko V.A.    Added ISNULL check for location_num column
25.06.2019  Labunets S.O.		Recreated procedure according to fixes
05.07.2019	Labunets S.O.		Added OUTPUT function

*/


ALTER PROCEDURE [Log].[InDimFlagMerge] AS

BEGIN


   SET NOCOUNT ON;
             
	   MERGE INTO Log.DimFlag AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(res_flag, 0) as res_flag, res_flag_f
				  FROM
				  (
					SELECT 
						res_flag AS res_flag,
						res_flag_f	AS res_flag_f
					FROM Stage.CallTemp
					WHERE res_flag_f IS NOT NULL
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.res_flag, 0)   = ISNULL(Tdest.FlagId,0)
					 AND ISNULL(Tsrc.res_flag_f,'') = ISNULL(Tdest.FlagName,'')

		WHEN MATCHED AND Tsrc.res_flag = Tdest.FlagId
		THEN
			UPDATE
					SET
						Tdest.FlagId = Tsrc.res_flag,
						Tdest.FlagName = Tsrc.res_flag_f,
						Tdest.FlagDateTimeEnd = GETDATE()						

		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (FlagId, FlagName, FlagDateTimeStart, FlagDateTimeEnd)			
			VALUES (Tsrc.res_flag, Tsrc.res_flag_f, GETDATE(), NULL)	
	
	OUTPUT deleted.FlagName PreviousName, inserted.FlagName UpToDateName;


END;