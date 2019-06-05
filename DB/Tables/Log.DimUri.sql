/*
Table:  Log.Log.DimUri

Purpose:  Dimenssion for storing uri data. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.Log.DimUri
     TRUNCATE TABLE Log.Log.DimUri

     SELECT * FROM Log.Log.DimUri
*/

CREATE TABLE [Log].[DimUri](
	[UriId] [int] IDENTITY(1,1) NOT NULL, -- id 
	[UriName] [varchar](200) NOT NULL, -- name of uri
 CONSTRAINT [PK_Uri] PRIMARY KEY CLUSTERED 
(
	[UriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


