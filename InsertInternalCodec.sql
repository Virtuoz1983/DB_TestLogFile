/*
Procedure: Log.InDimInternalcodec

Purpose:  Procedure for inserting internal codec data from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimInternalcodec AS

BEGIN

DELETE FROM Log.DimInternalCodec
INSERT INTO Log.DimInternalCodec
SELECT DISTINCT internal_codec, internal_codec_f
FROM Stage.CallTemp
WHERE internal_codec_f IS NOT NULL

END;

