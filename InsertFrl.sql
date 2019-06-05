/*
Procedure:  Log.InDimFrl

Purpose:  Procedure for inserting frl data from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/


USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimFrl AS

BEGIN

DELETE FROM Log.DimFrl
INSERT INTO [Log].DimFrl
SELECT DISTINCT frl, frl_f
FROM Stage.CallTemp
WHERE frl IS NOT NULL
ORDER BY frl ASC

END;

