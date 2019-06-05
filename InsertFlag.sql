/*
Procedure: Log.InDimFlag

Purpose:  Procedure for inserting flag data from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/


USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimFlag AS

BEGIN

DELETE FROM Log.DimFlag
INSERT INTO Log.DimFlag(FlagId, FlagName)
SELECT DISTINCT res_flag, res_flag_f FROM Stage.CallTemp WHERE res_flag IS NOT NULL

END;

