/*
Procedure: Log.InDimLocation

Purpose:  Procedure for inserting data about calling location from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimLocation AS

BEGIN

DELETE FROM Log.DimLocation
INSERT INTO Log.DimLocation
SELECT DISTINCT location_from, location_from_f 
FROM Stage.CallTemp
WHERE location_from IS NOT NULL
UNION
SELECT DISTINCT location_to, location_to_f
FROM Stage.CallTemp
WHERE location_to IS NOT NULL


END;


