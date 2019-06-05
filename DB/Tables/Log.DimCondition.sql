/*
Table:  Log.DimCondition

Purpose:  Dimenssion for storing conditions. SCD Type-1

Activities:

Date		Modified By			Comments
05.06.2019  Labunets S.O.       First design			            

Sample code:

     DROP TABLE Log.DimCondition
     TRUNCATE TABLE Log.DimCondition

     SELECT * FROM Log.DimCondition
*/

CREATE TABLE [Log].[DimCondition](
	[ConditionId] [int] NOT NULL, -- id
	[ConditionName] [varchar](200) NOT NULL, -- name of condition
 CONSTRAINT [PK_conditions] PRIMARY KEY CLUSTERED
(
	[ConditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


