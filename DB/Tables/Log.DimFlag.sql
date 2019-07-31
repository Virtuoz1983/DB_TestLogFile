USE [DB_TestLogFile]
GO

/****** Object:  Table [Log].[DimFlag]    Script Date: 31.07.2019 15:57:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Log].[DimFlag](
	[FlagId] [bigint] IDENTITY(1,1) NOT NULL,
	[FlagName] [nvarchar](150) NULL,
	[FlagDateTimeStart] [datetime] NULL,
	[FlagDateTimeEnd] [datetime] NULL,
 CONSTRAINT [PK_DimFlag] PRIMARY KEY CLUSTERED 
(
	[FlagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC Log.usp_DimFlag_Feed