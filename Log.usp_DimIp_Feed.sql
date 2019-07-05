USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimIp_Feed]    Script Date: 05.07.2019 17:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimIp_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimIp] ON;
   
  INSERT INTO [Log].[DimIp] ([IpId], [Ip])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimIp] OFF;

END
