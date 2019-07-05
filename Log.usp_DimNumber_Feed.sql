USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimNumber_Feed]    Script Date: 05.07.2019 17:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimNumber_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimNumber] ON;
   
  INSERT INTO [Log].[DimNumber] ([NumberId], [Number])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimNumber] OFF;

END
