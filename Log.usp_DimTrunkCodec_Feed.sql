USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimTrunkCodec_Feed]    Script Date: 05.07.2019 17:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimTrunkCodec_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimTrunkCodec] ON;
   
  INSERT INTO [Log].[DimTrunkCodec] ([TrunkCodecId], [TrunkCodecName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimTrunkCodec] OFF;

END
