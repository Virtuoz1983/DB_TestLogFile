/*
Procedure: Log.InDimNumber

Purpose:  Procedure for inserting data about calling numbers from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimNumber AS

BEGIN

DELETE FROM Log.DimNumber
INSERT INTO [Log].DimNumber
SELECT DISTINCT calling_num
FROM Stage.CallTemp
WHERE calling_num IS NOT NULL
UNION
SELECT dialed_num
FROM Stage.CallTemp
WHERE dialed_num IS NOT NULL 



END;


