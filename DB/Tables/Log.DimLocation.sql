/*
Table:  Log.DimLocation

Purpose:  Dimenssion for storing location data. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            
10.06.2019  Tereschenko V.A.    Made refactoring

Sample code:

    DROP TABLE [Log].[DimLocation]

     SELECT * FROM Log.DimLocation
*/

CREATE TABLE [Log].[DimLocation](
	[LocationId]	[int] IDENTITY(1,1) NOT NULL,	-- id
	[LocationNum]	[int] NOT NULL,					-- location code
	[LocationName]	[varchar](200) NULL,			-- location name

    CONSTRAINT [PK_locations] PRIMARY KEY ([LocationId])
)

EXEC [Log].[usp_DimLocation_Feed];


