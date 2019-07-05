USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimUri_Feed]    Script Date: 05.07.2019 17:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimUri_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimUri] ON;
   
  INSERT INTO [Log].[DimUri] ([UriId], [UriName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimUri] OFF;

END
