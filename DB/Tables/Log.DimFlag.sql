/*
Table:  Log.DimFlag

Purpose:  Dimenssion for storing flag info. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimFlag
     TRUNCATE TABLE Log.DimFlag

     SELECT * FROM Log.DimFlag
*/

CREATE TABLE [Log].[DimFlag](
	[FlagId] [bigint] NOT NULL, -- id
	[FlagName] [varchar](200) NULL, -- information about flag
 CONSTRAINT [PK_DimFlag] PRIMARY KEY CLUSTERED 
(
	[FlagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


