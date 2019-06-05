/*
Table:  Log.Log.DimTrk

Purpose:  Dimenssion for storing data about trunks . SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.Log.DimTrk
     TRUNCATE TABLE Log.Log.DimTrk

     SELECT * FROM Log.Log.DimTrk
*/

CREATE TABLE [Log].[DimTrk](
	[TrkId] [bigint] IDENTITY(1,1) NOT NULL, -- id
	[TrkCode] [int] NULL, -- code of trunk (4 numbers)
	[TrkNum] [int] NULL, -- number of trunk (2 numbers)
	[TrkName] [varchar](200) NULL, -- name of trunk
 CONSTRAINT [PK_trks] PRIMARY KEY CLUSTERED 
(
	[TrkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


