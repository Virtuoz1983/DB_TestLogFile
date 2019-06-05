/*
Table:  Log.DimInternalCodec

Purpose:  Dimenssion for storing data about internal codec. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimInternalCodec
     TRUNCATE TABLE Log.DimInternalCodec

     SELECT * FROM Log.DimInternalCodec
*/

CREATE TABLE [Log].[DimInternalCodec](
	[InternalCodecId] [bigint] NOT NULL, -- id
	[InternalCodecName] [varchar](200) NULL, -- Name of internal codec
 CONSTRAINT [PK_internal_codec] PRIMARY KEY CLUSTERED 
(
	[InternalCodecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


