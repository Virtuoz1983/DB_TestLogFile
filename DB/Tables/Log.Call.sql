/*
Table:  Log.Call

Purpose:  Final table storing information about calls. SCD Type-3

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.Call
     TRUNCATE TABLE Log.Call

     SELECT * FROM Log.Call
*/


USE [DB_TestLogFile]
GO

DROP TABLE Log.Call

CREATE TABLE [Log].[Call](
	[call_id] [int] NOT NULL, --id
	[time] [time](7) NULL, --time of call
	[date] [date] NULL, -- date of call
	[start_time] [time](7) NULL, -- time of call starting
	[end_time] [time](7) NULL, -- time of call ending
	[duration] [time](7) NULL, -- duration of the call
	[clg_pty_cat] [bigint] NULL, -- pty category
	[in_crt_id] [bigint] NULL, -- crt id
	[out_crt_id] [bigint] NULL, -- crt id
	[ucid] [bigint] NULL, -- ucid
	[node_num] [tinyint] NULL, -- number of the node
	[CallingNumberId] [int] NULL, -- calling number id from numbers dimenssion
	[DialedNumberId] [int] NULL, -- dialed number id from numbers dimenssion
	[CallingIpId] [int] NULL, -- callig IP id from IPs dimenssion
	[DialedIpId] [int] NULL, -- dialed IP id from IPs dimenssion
	[LocationId] [int] NULL, -- calling or dialed location from locations dimenssion
	[TrkNumId] [bigint] NULL, -- calling or dialed number of trunk from trunks dimenssion
	[ConditionId] [int] NULL, -- condition of the call from conditions dimenssion
	[FrlId] [int] NULL, -- frl about conversation's conclusion from frls dimenssion
	[UriId] [int] NULL, -- uri from uris dimenssion
	[FeatFlagId] [bigint] NULL, -- featflag name from FeatFlag dimenssion
	[FlagId] [bigint] NULL, -- name of the flag about users's converstion devices from Flag dimenssion
	[InternalCodecId] [bigint] NULL, -- name of internal codec from InternalCodec dimenssion
	[TrunkCodecId] [bigint] NULL, -- codec of trunk from TrunkCodec dimenssion
 CONSTRAINT [PK_Call] PRIMARY KEY CLUSTERED 
(
	[call_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
