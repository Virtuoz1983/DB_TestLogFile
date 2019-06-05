/*
Procedure: Log.InDimTrk

Purpose:  Procedure for inserting data about trunks from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimTrk AS

BEGIN

DELETE FROM Log.DimTrk
INSERT INTO Log.DimTrk
SELECT DISTINCT in_trk_code, in_trk_num, in_trk_name 
FROM Stage.CallTemp 
WHERE in_trk_num IS NOT NULL
UNION
SELECT DISTINCT code_used, out_trk_num, out_trk_name 
FROM Stage.CallTemp 
WHERE code_used IS NOT NULL



END;


