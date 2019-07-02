USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Stage].[FillingStageTable]    Script Date: 01.07.2019 12:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [Stage].[TempTable]    Script Date: 26.06.2019 15:22:29 ******/
ALTER PROCEDURE [Stage].[FillingStageTable] AS

BEGIN

CREATE TABLE [Stage].[TempTable](
	[Id] [bigint] NULL,
	[NeededId] [bigint] NULL
) ON [PRIMARY]



DECLARE	@return_value int

EXEC	@return_value = [Log].[FillIdsCallTemp]

SELECT	'Return Value' = @return_value


DROP TABLE Stage.TempTable


END