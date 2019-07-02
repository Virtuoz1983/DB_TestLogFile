USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[FillIdsCallTemp]    Script Date: 02.07.2019 10:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [Log].[FillIdsCallTemp] AS

BEGIN


UPDATE Stage.CallTemp SET LocationFromId = NULL
UPDATE Stage.CallTemp SET LocationFromId = location_from

UPDATE Stage.CallTemp SET LocationToId = NULL
UPDATE Stage.CallTemp SET LocationToId = location_to


DELETE FROM Stage.TempTable
INSERT INTO Stage.TempTable
SELECT call_id, DimNumber.NumberId AS CallingNumber
FROM Stage.CallTemp
FULL JOIN Log.DimNumber ON DimNumber.Number = calling_num


UPDATE Stage.CallTemp SET CallingNumberId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimIp.IpId AS CallingIp
FROM Stage.CallTemp
FULL JOIN Log.DimIp ON DimIp.Ip = calling_ip


UPDATE Stage.CallTemp SET CallingIpId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimNumber.NumberId AS CallingNumber
FROM Stage.CallTemp
FULL JOIN Log.DimNumber ON DimNumber.Number = dialed_num



UPDATE Stage.CallTemp SET DialedNumberId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimIp.IpId AS DialedIp
FROM Stage.CallTemp
FULL JOIN Log.DimIp ON DimIp.Ip = dialed_ip


UPDATE Stage.CallTemp SET DialedIpId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimTrk.TrkId AS InTrk
FROM Stage.CallTemp
FULL JOIN Log.DimTrk ON DimTrk.TrkCode = in_trk_code


UPDATE Stage.CallTemp SET InTrkNumId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimTrk.TrkId AS OutTrk
FROM Stage.CallTemp
FULL JOIN Log.DimTrk ON DimTrk.TrkCode = code_used


UPDATE Stage.CallTemp SET OutTrkNumId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimCondition.ConditionId 
FROM Stage.CallTemp
FULL JOIN Log.DimCondition ON DimCondition.ConditionId = cond_code


UPDATE Stage.CallTemp SET ConditionId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimFrl.FrlId
FROM Stage.CallTemp
FULL JOIN Log.DimFrl ON DimFrl.FrlId = frl

UPDATE Stage.CallTemp SET FrlId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable


INSERT INTO Stage.TempTable

SELECT call_id, DimUri.UriId
FROM Stage.CallTemp
FULL JOIN Log.DimUri ON DimUri.UriName = from_uri


UPDATE Stage.CallTemp SET FromUriId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable


INSERT INTO Stage.TempTable

SELECT call_id, DimUri.UriId
FROM Stage.CallTemp
FULL JOIN Log.DimUri ON DimUri.UriName = to_uri


UPDATE Stage.CallTemp SET ToUriId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimFeatFlag.FeatFlagId
FROM Stage.CallTemp
FULL JOIN Log.DimFeatFlag ON DimFeatFlag.FeatFlagId = feat_flag

UPDATE Stage.CallTemp SET FeatFlagId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimFlag.FlagId
FROM Stage.CallTemp
FULL JOIN Log.DimFlag ON DimFlag.FlagId = res_flag

UPDATE Stage.CallTemp SET FlagId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimInternalCodec.InternalCodecId
FROM Stage.CallTemp
FULL JOIN Log.DimInternalCodec ON DimInternalCodec.InternalCodecId = internal_codec

UPDATE Stage.CallTemp SET InternalCodecId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


DELETE FROM Stage.TempTable

INSERT INTO Stage.TempTable
SELECT call_id, DimTrunkCodec.TrunkCodecId
FROM Stage.CallTemp
FULL JOIN Log.DimTrunkCodec ON DimTrunkCodec.TrunkCodecId = trunk_codec

UPDATE Stage.CallTemp SET TrunkCodecId = TempTable.NeededId
FROM Stage.CallTemp
FULL JOIN Stage.TempTable ON Id = call_id


END;