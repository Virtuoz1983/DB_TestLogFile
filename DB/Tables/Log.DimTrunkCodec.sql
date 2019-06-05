/*
Table:  Log.Log.DimTrunkCodec

Purpose:  Dimenssion for storing data abuut trunk codec. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.Log.DimTrunkCodec
     TRUNCATE TABLE Log.Log.DimTrunkCodec

     SELECT * FROM Log.Log.DimTrunkCodec
*/

CREATE TABLE [Log].[DimTrunkCodec](
	[TrunkCodecId] [bigint] NOT NULL, -- id
	[TrunkCodecName] [varchar](200) NULL, -- name of trunk codec
 CONSTRAINT [PK_DimTrunkCodec] PRIMARY KEY CLUSTERED 
(
	[TrunkCodecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


