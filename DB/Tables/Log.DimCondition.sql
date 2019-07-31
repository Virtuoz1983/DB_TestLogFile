USE [DB_TestLogFile]
GO

/****** Object:  Table [Log].[DimCondition]    Script Date: 31.07.2019 15:56:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [Log].[DimCondition](
	[ConditionId] [int] IDENTITY(1,1) NOT NULL,
	[ConditionCode] [varchar](50) NULL,
	[ConditionName] [varchar](200) NULL,
 CONSTRAINT [PK_conditions] PRIMARY KEY CLUSTERED 
(
	[ConditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC Log.usp_DimCondition_Feed