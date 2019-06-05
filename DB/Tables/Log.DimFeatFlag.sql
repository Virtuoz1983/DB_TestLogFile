/*
Table:  Log.DimFeatFlag

Purpose:  Dimenssion for storing about feat flag. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimFeatFlag
     TRUNCATE TABLE Log.DimFeatFlag

     SELECT * FROM Log.DimFeatFlag
*/

CREATE TABLE [Log].[DimFeatFlag](
	[FeatFlagId] [bigint] NOT NULL,
	[FeatFlagName] [varchar](200) NULL,
 CONSTRAINT [PK_DimFeatFlag] PRIMARY KEY CLUSTERED 
(
	[FeatFlagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


