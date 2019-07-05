USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimInternalCodec_Feed]    Script Date: 05.07.2019 17:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimInternalCodec_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimInternalCodec] ON;
   
  INSERT INTO [Log].[DimInternalCodec] ([InternalCodecId], [InternalCodecName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimInternalCodec] OFF;

END
