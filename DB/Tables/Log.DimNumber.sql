/*
Table:  Log.DimNumber

Purpose:  Dimenssion for storing numbers. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimNumber
     TRUNCATE TABLE Log.DimNumber

     SELECT * FROM Log.DimNumber
*/
CREATE TABLE [Log].[DimNumber](
	[NumberId] [int] IDENTITY(1,1) NOT NULL, -- id
	[Number] [bigint] NULL, -- calling or dialed number
 CONSTRAINT [PK_numbers] PRIMARY KEY CLUSTERED 
(
	[NumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


