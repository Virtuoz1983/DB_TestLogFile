USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimTrk_Feed]    Script Date: 05.07.2019 17:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimTrk_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimTrk] ON;
   
  INSERT INTO [Log].[DimTrk] ([TrkId], [TrkCode], [TrkNum], [TrkName])
  VALUES (-1, '', '', '')
 
  SET IDENTITY_INSERT [Log].[DimTrk] OFF;

END
