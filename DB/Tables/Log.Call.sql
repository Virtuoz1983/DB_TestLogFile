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
 CONSTRAINT [PK_Call] PRIMARY KEY CLUSTERED 
(
	[call_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DImCondition] FOREIGN KEY([ConditionId])
REFERENCES [Log].[DimCondition] ([ConditionId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DImCondition]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimFeatFlag] FOREIGN KEY([FeatFlagId])
REFERENCES [Log].[DimFeatFlag] ([FeatFlagId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimFeatFlag]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimFrl] FOREIGN KEY([FrlId])
REFERENCES [Log].[DimFrl] ([FrlId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimFrl]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimInternalCodec] FOREIGN KEY([InternalCodecId])
REFERENCES [Log].[DimInternalCodec] ([InternalCodecId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimInternalCodec]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimIp] FOREIGN KEY([IpId])
REFERENCES [Log].[DimIp] ([IpId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimIp]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimLocation] FOREIGN KEY([LocationId])
REFERENCES [Log].[DimLocation] ([LocationId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimLocation]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimNumber] FOREIGN KEY([NumberId])
REFERENCES [Log].[DimNumber] ([NumberId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimNumber]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimTrk] FOREIGN KEY([TrkNumId])
REFERENCES [Log].[DimTrk] ([TrkId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimTrk]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimTrunkCodec] FOREIGN KEY([TrunkCodecId])
REFERENCES [Log].[DimTrunkCodec] ([TrunkCodecId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimTrunkCodec]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimUri] FOREIGN KEY([UriId])
REFERENCES [Log].[DimUri] ([UriId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimUri]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_Flag] FOREIGN KEY([FlagId])
REFERENCES [Log].[DimFlag] ([FlagId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_Flag]
GO


