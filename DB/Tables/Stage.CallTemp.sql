USE [DB_TestLogFile]
GO

/****** Object:  Table [Stage].[CallTemp]    Script Date: 31.07.2019 16:00:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Stage].[CallTemp](
	[call_id] [int] NULL,
	[time] [bigint] NULL,
	[date] [int] NULL,
	[start_time] [int] NULL,
	[end_time] [int] NULL,
	[duration] [smallint] NULL,
	[calling_num] [nvarchar](50) NULL,
	[calling_ip] [nvarchar](255) NULL,
	[dialed_num] [nvarchar](50) NULL,
	[dialed_ip] [nvarchar](255) NULL,
	[location_from_f] [nvarchar](50) NULL,
	[location_from] [nvarchar](50) NULL,
	[clg_pty_cat] [nvarchar](50) NULL,
	[in_trk_code] [nvarchar](50) NULL,
	[in_trk_num] [nvarchar](50) NULL,
	[in_trk_name] [nvarchar](50) NULL,
	[in_crt_id] [nvarchar](50) NULL,
	[cond_code] [nvarchar](50) NULL,
	[cond_code_f] [nvarchar](150) NULL,
	[location_to] [nvarchar](50) NULL,
	[location_to_f] [nvarchar](50) NULL,
	[code_used] [nvarchar](50) NULL,
	[out_trk_num] [nvarchar](50) NULL,
	[out_trk_name] [nvarchar](50) NULL,
	[out_crt_id] [nvarchar](50) NULL,
	[frl] [tinyint] NULL,
	[frl_f] [nvarchar](150) NULL,
	[ucid] [bigint] NULL,
	[from_uri] [nvarchar](50) NULL,
	[to_uri] [nvarchar](50) NULL,
	[feat_flag] [nvarchar](50) NULL,
	[feat_flag_f] [nvarchar](150) NULL,
	[res_flag] [bigint] NULL,
	[res_flag_f] [nvarchar](150) NULL,
	[node_num] [nvarchar](50) NULL,
	[internal_codec] [nvarchar](50) NULL,
	[internal_codec_f] [nvarchar](50) NULL,
	[trunk_codec] [tinyint] NULL,
	[trunk_codec_f] [nvarchar](50) NULL,
	[CallingNumberId] [int] NULL,
	[DialedNumberId] [int] NULL,
	[CallingIpId] [int] NULL,
	[DialedIpId] [int] NULL,
	[LocationFromId] [int] NULL,
	[LocationToId] [int] NULL,
	[InTrkNumId] [int] NULL,
	[OutTrkNumId] [int] NULL,
	[ConditionId] [int] NULL,
	[FrlId] [int] NULL,
	[FromUriId] [int] NULL,
	[ToUriId] [int] NULL,
	[FeatFlagId] [int] NULL,
	[FlagId] [int] NULL,
	[InternalCodecId] [int] NULL,
	[TrunkCodecId] [int] NULL
) ON [PRIMARY]

GO


