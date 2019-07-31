USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_Call_filling]    Script Date: 31.07.2019 16:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Procedure: Log.usp_Call_filling

Purpose:  Procedure for filling the fact table

Activities:

Date		Modified By			Comments
26.07.2019  Labunets S.O.       Procedure created
26.07.2019	Labunets S.O.		Refactored procedure, added ISNULL check

*/



ALTER PROCEDURE [Log].[usp_Call_filling] AS

BEGIN

   SET NOCOUNT ON;



					 MERGE INTO Log.Call AS Tdest
	   USING
			(
			      SELECT DISTINCT ISNULL(call_id, 0) as call_id, [time], 
					[date], 
					start_time, 
					end_time, 
					duration, 
					clg_pty_cat, 
					in_crt_id, 
					ucid, 
					node_num, 
					CallingNumberId, 
					DialedNumberId, 
					CallingIpId, 
					DialedIpId, 
					LocationFromId, 
					LocationToId, 
					InTrkNumId, 
					OutTrkNumId, 
					ConditionId, 
					FrlId, 
					FromUriId, 
					ToUriId, 
					FeatFlagId, 
					FlagId, 
					InternalCodecId, 
					TrunkCodecId
				  FROM
				  (
					SELECT call_id,
						[time], 
					[date], 
					start_time, 
					end_time, 
					duration, 
					clg_pty_cat, 
					in_crt_id, 
					ucid, 
					node_num, 
					CallingNumberId, 
					DialedNumberId, 
					CallingIpId, 
					DialedIpId, 
					LocationFromId, 
					LocationToId, 
					InTrkNumId, 
					OutTrkNumId, 
					ConditionId, 
					FrlId, 
					FromUriId, 
					ToUriId, 
					FeatFlagId, 
					FlagId, 
					InternalCodecId, 
					TrunkCodecId
										FROM Stage.CallTemp
					WHERE call_id IS NOT NULL
				  ) AS A					  
			) AS Tsrc ON ISNULL(Tsrc.call_id, 0)			= ISNULL(Tdest.call_id, 0)
					 AND ISNULL(Tsrc.[date], 0)				= ISNULL(Tdest.[date], 0)
					 AND ISNULL(Tsrc.[time], 0)				= ISNULL(Tdest.[time], 0)
					 AND ISNULL(Tsrc.start_time, 0)			= ISNULL(Tdest.start_time, 0)
					 AND ISNULL(Tsrc.end_time, 0)			= ISNULL(Tdest.end_time, 0)
					 AND ISNULL(Tsrc.duration, 0)			= ISNULL(Tdest.duration, 0)
					 AND ISNULL(Tsrc.clg_pty_cat, 0)		= ISNULL(Tdest.clg_pty_cat, 0)
					 AND ISNULL(Tsrc.in_crt_id, 0)			= ISNULL(Tdest.in_crt_id, 0)
					 AND ISNULL(Tsrc.ucid, 0)				= ISNULL(Tdest.ucid, 0)
					 AND ISNULL(Tsrc.node_num, 0)			= ISNULL(Tdest.node_num, 0)
					 AND ISNULL(Tsrc.CallingNumberId, 0)	= ISNULL(Tdest.CallingNumberId, 0)
					 AND ISNULL(Tsrc.DialedNumberId, 0)		= ISNULL(Tdest.DialedNumberId, 0)
					 AND ISNULL(Tsrc.CallingIpId, 0)		= ISNULL(Tdest.CallingIpId, 0)
					 AND ISNULL(Tsrc.DialedIpId, 0)			= ISNULL(Tdest.DialedIpId, 0)
					 AND ISNULL(Tsrc.LocationFromId, 0)		= ISNULL(Tdest.LocationFromId, 0)
					 AND ISNULL(Tsrc.LocationToId, 0)		= ISNULL(Tdest.LocationToId, 0)
					 AND ISNULL(Tsrc.InTrkNumId, 0)			= ISNULL(Tdest.InTrkNumId, 0)
					 AND ISNULL(Tsrc.OutTrkNumId, 0)		= ISNULL(Tdest.OutTrkNumId, 0)
					 AND ISNULL(Tsrc.ConditionId, 0)		= ISNULL(Tdest.ConditionId, 0)
					 AND ISNULL(Tsrc.FrlId, 0)				= ISNULL(Tdest.FrlId, 0)
					 AND ISNULL(Tsrc.FromUriId, 0)			= ISNULL(Tdest.FromUriId, 0)
					 AND ISNULL(Tsrc.ToUriId, 0)			= ISNULL(Tdest.ToUriId, 0)
					 AND ISNULL(Tsrc.FeatFlagId, 0)			= ISNULL(Tdest.FeatFlagId, 0)
					 AND ISNULL(Tsrc.FlagId, 0)				= ISNULL(Tdest.FlagId, 0)
					 AND ISNULL(Tsrc.InternalCodecId, 0)	= ISNULL(Tdest.InternalCodecId, 0)
					 AND ISNULL(Tsrc.TrunkCodecId, 0)		= ISNULL(Tdest.TrunkCodecId, 0)

		WHEN MATCHED AND Tsrc.call_id = Tdest.call_id
		THEN
			UPDATE
					SET
						Tdest.[date] = Tsrc.[date],
						Tdest.[time] = Tsrc.[time],
						Tdest.start_time = Tsrc.start_time,
						Tdest.end_time = Tsrc.end_time,
						Tdest.duration = Tsrc.duration,
						Tdest.clg_pty_cat = Tsrc.clg_pty_cat,
						Tdest.in_crt_id = Tsrc.in_crt_id,
						Tdest.ucid = Tsrc.ucid,
						Tdest.node_num = Tsrc.node_num,
						Tdest.CallingNumberId = Tsrc.CallingNumberId,
						Tdest.DialedNumberId = Tsrc.DialedNumberId,
						Tdest.CallingIpId = Tsrc.CallingIpId,
						Tdest.DialedIpId = Tsrc.DialedIpId,
						Tdest.LocationFromId = Tsrc.LocationFromId,
						Tdest.LocationToId = Tsrc.LocationToId,
						Tdest.InTrkNumId = Tsrc.InTrkNumId,
						Tdest.OutTrkNumId = Tsrc.OutTrkNumId,
						Tdest.ConditionId = Tsrc.ConditionId,
						Tdest.FrlId = Tsrc.FrlId,
						Tdest.FromUriId = Tsrc.FromUriId,
						Tdest.ToUriId = Tsrc.ToUriId,
						Tdest.FeatFlagId = Tsrc.FeatFlagId,
						Tdest.FlagId = Tsrc.FlagId,
						Tdest.InternalCodecId = Tsrc.InternalCodecId,
						Tdest.TrunkCodecId = Tsrc.TrunkCodecId
												

		-- New attributes
		WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (call_id,
						[time], 
					[date], 
					start_time, 
					end_time, 
					duration, 
					clg_pty_cat, 
					in_crt_id, 
					ucid, 
					node_num, 
					CallingNumberId, 
					DialedNumberId, 
					CallingIpId, 
					DialedIpId, 
					LocationFromId, 
					LocationToId, 
					InTrkNumId, 
					OutTrkNumId, 
					ConditionId, 
					FrlId, 
					FromUriId, 
					ToUriId, 
					FeatFlagId, 
					FlagId, 
					InternalCodecId, 
					TrunkCodecId)			
			VALUES (Tsrc.call_id,
						Tsrc.[time], 
					Tsrc.[date], 
					Tsrc.start_time, 
					Tsrc.end_time, 
					Tsrc.duration, 
					Tsrc.clg_pty_cat, 
					Tsrc.in_crt_id, 
					Tsrc.ucid, 
					Tsrc.node_num, 
					Tsrc.CallingNumberId, 
					Tsrc.DialedNumberId, 
					Tsrc.CallingIpId, 
					Tsrc.DialedIpId, 
					Tsrc.LocationFromId, 
					Tsrc.LocationToId, 
					Tsrc.InTrkNumId, 
					Tsrc.OutTrkNumId, 
					Tsrc.ConditionId, 
					Tsrc.FrlId, 
					Tsrc.FromUriId, 
					Tsrc.ToUriId, 
					Tsrc.FeatFlagId, 
					Tsrc.FlagId, 
					Tsrc.InternalCodecId, 
					Tsrc.TrunkCodecId);	

END;
