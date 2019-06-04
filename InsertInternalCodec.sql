-------------------Inserting InternalCodec--04.06.2019-----------
DELETE FROM Log.DimInternalCodec
INSERT INTO Log.DimInternalCodec
SELECT DISTINCT internal_codec, internal_codec_f
FROM Stage.CallTemp
WHERE internal_codec_f IS NOT NULL
