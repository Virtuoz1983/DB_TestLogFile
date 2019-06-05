/*
Table:  Log.DimIp

Purpose:  Dimenssion for storing IP data. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimIp
     TRUNCATE TABLE Log.DimIp

     SELECT * FROM Log.DimIp
*/

CREATE TABLE [Log].[DimIp](
	[IpId] [int] IDENTITY(1,1) NOT NULL, -- id
	[Ip] [varchar](200) NULL, -- ip
 CONSTRAINT [PK_IPs] PRIMARY KEY CLUSTERED 
(
	[IpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


