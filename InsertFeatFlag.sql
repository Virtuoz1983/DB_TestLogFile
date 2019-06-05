/*
Procedure:  Log.InDimFeatFlag

Purpose:  Procedure for inserting feat flag data from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/


USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimFeatFlag AS

BEGIN

DELETE FROM Log.DimFeatFlag
INSERT INTO Log.DimFeatFlag(FeatFlagId)
SELECT DISTINCT feat_flag FROM Stage.CallTemp WHERE feat_flag IS NOT NULL
END;

