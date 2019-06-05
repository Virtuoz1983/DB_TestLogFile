
/*
Table:  Log.DimFrl

Purpose:  Dimenssion for storing Frl data. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimFrl
     TRUNCATE TABLE Log.DimFrl

     SELECT * FROM Log.DimFrl
*/



CREATE TABLE [Log].[DimFrl]
(
	[FrlId]    int			 NOT NULL,   -- id
	[FrlName]  NVARCHAR(200) NOT NULL,   -- Frl name

	CONSTRAINT [PK_frls] PRIMARY KEY CLUSTERED ([FrlId])
) 