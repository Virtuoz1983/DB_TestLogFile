USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimLocation_Feed]    Script Date: 05.07.2019 17:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimLocation_Feed]
As 
BEGIn

 
  SET IDENTITY_INSERT [Log].[DimLocation] ON;
   
  INSERT INTO [Log].[DimLocation] ([LocationId], [LocationNum])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimLocation] OFF;

END
