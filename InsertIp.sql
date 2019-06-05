/*
Procedure: Log.InDimIp

Purpose:  Procedure for inserting ip data from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimIp AS

BEGIN

DELETE FROM Log.DimIp
INSERT INTO [Log].DimIp
SELECT DISTINCT calling_ip
FROM Stage.CallTemp
WHERE calling_ip IS NOT NULL
UNION
SELECT dialed_ip
FROM Stage.CallTemp
WHERE dialed_ip IS NOT NULL

END;

