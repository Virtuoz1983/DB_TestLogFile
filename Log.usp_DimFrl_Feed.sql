USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimFrl_Feed]    Script Date: 05.07.2019 17:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Log].[usp_DimFrl_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimFrl] ON;
   
  INSERT INTO [Log].[DimFrl] ([FrlId], [FrlName])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimFrl] OFF;

END
