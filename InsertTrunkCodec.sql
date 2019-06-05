/*
Procedure: Log.InDimTrunkCodec

Purpose:  Procedure for inserting data about trunk codec from stage table.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
*/

USE DB_TestLogFile
GO

CREATE PROCEDURE Log.InDimTrunkCodec AS

BEGIN

DELETE FROM Log.DimTrunkCodec
INSERT INTO Log.DimTrunkCodec(TrunkCodecId, TrunkCodecName)
SELECT DISTINCT trunk_codec, trunk_codec_f FROM Stage.CallTemp WHERE trunk_codec IS NOT NULL



END;


