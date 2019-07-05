USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_CallTemp_PostUpdate]    Script Date: 05.07.2019 12:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Procedure: Log.usp_CallTemp_PostUpdate

Purpose:  Procedure for inserting data about feat flags.

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First procedure
04.07.2019	Labunets S.O.		Refactored procedure, reducing code with usage of UPDATE
05.07.2019	Labunets S.O.		Added ISNULL check, renamed aliasses
*/


ALTER PROCEDURE [Log].[usp_CallTemp_PostUpdate] AS

BEGIN


UPDATE Stage.CallTemp 
	SET
		CallingNumberId =	ISNULL(calling_number.NumberId, -1),
		DialedNumberId =	ISNULL(dialed_number.NumberId, -1),
		CallingIpId =		ISNULL(calling_ip.IpId, -1),
		DialedIpId =		ISNULL(dialed_ip.IpId, -1),
		LocationFromId =	ISNULL(location_from.LocationId, -1),
		LocationToId =		ISNULL(location_to.LocationId, -1),
		InTrkNumId =		ISNULL(in_trk.TrkId, -1),
		OutTrkNumId =		ISNULL(out_trk.TrkId, -1),
		ConditionId =		ISNULL(Log.DimCondition.ConditionId, -1),
		FrlId =				ISNULL(Log.DimFrl.FrlId, -1),
		FromUriId =			ISNULL(from_uri.UriId, -1),
		ToUriId =			ISNULL(to_uri.UriId, -1),
		FeatFlagId =		ISNULL(Log.DimFeatFlag.FeatFlagId, -1),
		FlagId =			ISNULL(Log.DimFlag.FlagId, -1),
		InternalCodecId =	ISNULL(Log.DimInternalCodec.InternalCodecId, -1),
		TrunkCodecId =		ISNULL(Log.DimTrunkCodec.TrunkCodecId, -1)
		
		FROM Stage.CallTemp
LEFT JOIN Log.DimNumber AS calling_number ON calling_number.Number = CallTemp.calling_num
LEFT JOIN Log.DimNumber AS dialed_number ON dialed_number.Number = CallTemp.dialed_num
LEFT JOIN Log.DimIp AS calling_ip ON calling_ip.Ip = CallTemp.calling_ip
LEFT JOIN Log.DimIp AS dialed_ip ON dialed_ip.Ip = CallTemp.dialed_ip
LEFT JOIN Log.DimLocation AS location_from ON location_from.LocationName = CallTemp.location_from_f
LEFT JOIN Log.DimLocation AS location_to ON location_to.LocationName = CallTemp.location_to_f
LEFT JOIN Log.DimTrk AS in_trk ON in_trk.TrkName = CallTemp.in_trk_name
LEFT JOIN Log.DimTrk AS out_trk ON out_trk.TrkName = CallTemp.out_trk_name
LEFT JOIN Log.DimCondition ON ConditionName = CallTemp.cond_code_f
LEFT JOIN Log.DimFrl ON FrlName = CallTemp.frl_f
LEFT JOIN Log.DimUri AS from_uri ON from_uri.UriName = CallTemp.from_uri
LEFT JOIN Log.DimUri AS to_uri ON to_uri.UriName = CallTemp.to_uri
LEFT JOIN Log.DimFeatFlag ON FeatFlagName = CallTemp.feat_flag_f
LEFT JOIN Log.DimFlag ON FlagName = CallTemp.res_flag_f
LEFT JOIN Log.DimInternalCodec ON InternalCodecName = CallTemp.internal_codec_f
LEFT JOIN Log.DimTrunkCodec ON TrunkCodecName = CallTemp.trunk_codec_f


END;