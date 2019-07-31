USE [DB_TestLogFile]
GO

/****** Object:  Table [Log].[Call]    Script Date: 31.07.2019 15:56:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Log].[Call](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[call_id] [int] NULL,
	[time] [int] NULL,
	[date] [int] NULL,
	[start_time] [int] NULL,
	[end_time] [int] NULL,
	[duration] [int] NULL,
	[clg_pty_cat] [bigint] NULL,
	[in_crt_id] [bigint] NULL,
	[out_crt_id] [bigint] NULL,
	[ucid] [bigint] NULL,
	[node_num] [tinyint] NULL,
	[CallingNumberId] [int] NULL,
	[DialedNumberId] [int] NULL,
	[CallingIpId] [int] NULL,
	[DialedIpId] [int] NULL,
	[LocationFromId] [int] NULL,
	[LocationToId] [int] NULL,
	[InTrkNumId] [bigint] NULL,
	[OutTrkNumId] [bigint] NULL,
	[ConditionId] [int] NULL,
	[FrlId] [int] NULL,
	[FromUriId] [int] NULL,
	[ToUriId] [int] NULL,
	[FeatFlagId] [bigint] NULL,
	[FlagId] [bigint] NULL,
	[InternalCodecId] [bigint] NULL,
	[TrunkCodecId] [bigint] NULL,
 CONSTRAINT [PK_Call] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
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

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimFlag] FOREIGN KEY([FlagId])
REFERENCES [Log].[DimFlag] ([FlagId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimFlag]
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

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimIp2] FOREIGN KEY([CallingIpId])
REFERENCES [Log].[DimIp] ([IpId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimIp2]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimIp3] FOREIGN KEY([DialedIpId])
REFERENCES [Log].[DimIp] ([IpId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimIp3]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimLocation1] FOREIGN KEY([LocationFromId])
REFERENCES [Log].[DimLocation] ([LocationId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimLocation1]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimLocation2] FOREIGN KEY([LocationToId])
REFERENCES [Log].[DimLocation] ([LocationId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimLocation2]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimNumber] FOREIGN KEY([CallingNumberId])
REFERENCES [Log].[DimNumber] ([NumberId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimNumber]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimNumber1] FOREIGN KEY([DialedNumberId])
REFERENCES [Log].[DimNumber] ([NumberId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimNumber1]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimTrk2] FOREIGN KEY([OutTrkNumId])
REFERENCES [Log].[DimTrk] ([TrkId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimTrk2]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimTrunkCodec] FOREIGN KEY([InTrkNumId])
REFERENCES [Log].[DimTrk] ([TrkId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimTrunkCodec]
GO

ALTER TABLE [Log].[Call]  WITH CHECK ADD  CONSTRAINT [FK_Call_DimUri] FOREIGN KEY([FromUriId])
REFERENCES [Log].[DimUri] ([UriId])
GO

ALTER TABLE [Log].[Call] CHECK CONSTRAINT [FK_Call_DimUri]
GO


