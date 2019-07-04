USE [DB_TestLogFile]
GO
/*
Procedure: Log.InDimFeatFlagMerge

Purpose:  Procedure for inserting data about feat flags.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
04.07.2019	Labunets S.O.		Refactored procedure, reducing code with usage of UPDATE
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [Log].[FillIdsCallTemp] AS

BEGIN

UPDATE Stage.CallTemp 
	SET
		CallingNumberId =	calling_number.NumberId,
		DialedNumberId =	dialed_number.NumberId,
		CallingIpId =		calling_ip.IpId,
		DialedIpId =		dialed_ip.IpId,
		--LocationFromId = ISNULL(LocationFromId, -1),
		LocationFromId =	a.LocationId,
		LocationToId =		b.LocationId,
		InTrkNumId =		c.TrkId,
		OutTrkNumId =		d.TrkId,
		ConditionId =		Log.DimCondition.ConditionId,
		FrlId =				Log.DimFrl.FrlId,
		FromUriId =			e.UriId,
		ToUriId =			f.UriId,
		FeatFlagId =		Log.DimFeatFlag.FeatFlagId,
		FlagId =			Log.DimFlag.FlagId,
		InternalCodecId =	Log.DimInternalCodec.InternalCodecId,
		TrunkCodecId =		Log.DimTrunkCodec.TrunkCodecId

	FROM Stage.CallTemp
		
LEFT JOIN Log.DimNumber AS calling_number ON calling_number.Number = CallTemp.calling_num
LEFT JOIN Log.DimNumber AS dialed_number ON dialed_number.Number = CallTemp.dialed_num
LEFT JOIN Log.DimIp AS calling_ip ON calling_ip.Ip = CallTemp.calling_ip
LEFT JOIN Log.DimIp AS dialed_ip ON dialed_ip.Ip = CallTemp.dialed_ip
LEFT JOIN Log.DimLocation AS a ON a.LocationName = CallTemp.location_from_f
LEFT JOIN Log.DimLocation AS b ON b.LocationName = CallTemp.location_to_f
LEFT JOIN Log.DimTrk AS c ON c.TrkName = CallTemp.in_trk_name
LEFT JOIN Log.DimTrk AS d ON d.TrkName = CallTemp.out_trk_name
LEFT JOIN Log.DimCondition ON ConditionName = CallTemp.cond_code_f
LEFT JOIN Log.DimFrl ON FrlName = CallTemp.frl_f
LEFT JOIN Log.DimUri AS e ON e.UriName = CallTemp.from_uri
LEFT JOIN Log.DimUri AS f ON f.UriName = CallTemp.to_uri
LEFT JOIN Log.DimFeatFlag ON FeatFlagName = CallTemp.feat_flag_f
LEFT JOIN Log.DimFlag ON FlagName = CallTemp.res_flag_f
LEFT JOIN Log.DimInternalCodec ON InternalCodecName = CallTemp.internal_codec_f
LEFT JOIN Log.DimTrunkCodec ON TrunkCodecName = CallTemp.trunk_codec_f

END;