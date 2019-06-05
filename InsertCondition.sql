/*
Procedure:  Log.InDimconditions

Purpose:  Procedure for inserting conditions data from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/


USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimCondition AS

BEGIN

DELETE FROM Log.DimCondition
INSERT INTO [Log].DimCondition
SELECT DISTINCT cond_code, cond_code_f
FROM Stage.CallTemp
WHERE cond_code IS NOT NULL

END;