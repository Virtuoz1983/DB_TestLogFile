/*
Procedure: Log.InDimUri

Purpose:  Procedure for inserting data about uri from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimUri AS

BEGIN

DELETE FROM Log.DimUri
INSERT INTO [Log].DimUri
SELECT from_uri
FROM Stage.CallTemp
WHERE from_uri IS NOT NULL
UNION
SELECT to_uri
FROM Stage.CallTemp
WHERE to_uri IS NOT NULL



END;


