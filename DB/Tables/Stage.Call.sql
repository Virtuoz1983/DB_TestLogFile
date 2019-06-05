/*
Table:  Stage.Call

Purpose:  Stage table which consists inserted data from file. SCD Type-3

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Stage.Call
     TRUNCATE TABLE Stage.Call
	 
     SELECT * FROM Stage.Call
*/

CREATE TABLE [Stage].[CallTemp](
	[call_id] [int] NOT NULL, -- id
	[time] [varchar](50) NULL, --time of call
	[date] [int] NULL, -- date of call
	[start_time] [int] NULL, -- time of call starting
	[end_time] [int] NULL, -- time of call ending
	[duration] [smallint] NULL, -- duration of the call
	[calling_num] [varchar](50) NULL, -- calling number
	[calling_ip] [nvarchar](255) NULL, -- calling ip
	[dialed_num] [varchar](50) NULL, -- dialed number
	[dialed_ip] [nvarchar](255) NULL, --dialed ip
	[location_from_f] [varchar](200) NULL, -- location, where calling was made from
	[location_from] [int] NULL, -- if of location, where calling was made from
	[clg_pty_cat] [tinyint] NULL, -- pty category
	[in_trk_code] [smallint] NULL, -- code of receiving trunk
	[in_trk_num] [tinyint] NULL, -- number of receiving trunk
	[in_trk_name] [varchar](50) NULL, -- name o receiving trunk
	[in_crt_id] [tinyint] NULL, -- incoming crt id
	[cond_code] [tinyint] NULL, -- id of conditiion
	[cond_code_f] [nvarchar](50) NULL, -- full name of condition 
	[location_to] [int] NULL, -- receiving location id
	[location_to_f] [varchar](200) NULL, -- receiving full name of location
	[code_used] [smallint] NULL, -- sending trunk code
	[out_trk_num] [int] NULL, -- sending trunk number
	[out_trk_name] [varchar](200) NULL, -- sending trunk name
	[out_crt_id] [tinyint] NULL, -- outcoming crt id
	[frl] [tinyint] NULL, -- frl id 
	[frl_f] [varchar](100) NULL, -- full frl about conversation's conclusion
	[ucid] [bigint] NULL, -- uc id
	[from_uri] [varchar](30) NULL, -- sending uri
	[to_uri] [varchar](30) NULL, -- receiving uri
	[feat_flag] [tinyint] NULL, -- feat flag id
	[feat_flag_f] [binary](1) NULL, -- full feat flag description
	[res_flag] [tinyint] NULL, -- result flag id
	[res_flag_f] [varchar](100) NULL, -- result flag full description
	[node_num] [tinyint] NULL, -- number of node
	[internal_codec] [tinyint] NULL, -- id of internal codec
	[internal_codec_f] [varchar](30) NULL, -- full decription of internal codec
	[trunk_codec] [tinyint] NULL, -- id of trunk codec
	[trunk_codec_f] [binary](1) NULL, -- full name of internal codec
	[NumberId] [int] NULL, -- calling or dialed number id from numbers dimenssion
	[IpId] [int] NULL, -- callig or dialed IP id from IPs dimenssion
	[LocationId] [int] NULL, -- calling or dialed location from locations dimenssion
	[TrkNumId] [bigint] NULL, -- calling or dialed number of trunk from trunks dimenssion
	[ConditionId] [int] NULL, -- condition of the call from conditions dimenssion
	[FrlId] [int] NULL, -- frl about conversation's conclusion from frls dimenssion
	[UriId] [int] NULL, -- uri from uris dimenssion
	[FeatFlagId] [bigint] NULL, -- featflag name from FeatFlag dimenssion
	[FlagId] [bigint] NULL, -- name of the flag about users's converstion devices from Flag dimenssion
	[InternalCodecId] [bigint] NULL, -- name of internal codec from InternalCodec dimenssion
	[TrunkCodecId] [bigint] NULL, -- codec of trunk from TrunkCodec dimenssion
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

