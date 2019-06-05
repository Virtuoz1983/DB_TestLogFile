/*
Table:  Log.DimLocation

Purpose:  Dimenssion for storing location data. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimLocation
     TRUNCATE TABLE Log.DimLocation

     SELECT * FROM Log.DimLocation
*/

CREATE TABLE [Log].[DimLocation](
	[LocationId] [int] NOT NULL, -- id
	[LocationName] [varchar](200) NULL, -- location name (city)
 CONSTRAINT [PK_locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

