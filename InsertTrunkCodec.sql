-------------------Inserting TrunkCodec--04.06.2019---------------
DELETE FROM Log.DimTrunkCodec
INSERT INTO Log.DimTrunkCodec(TrunkCodecId, TrunkCodecName)
SELECT DISTINCT trunk_codec, trunk_codec_f FROM Stage.CallTemp WHERE trunk_codec IS NOT NULL