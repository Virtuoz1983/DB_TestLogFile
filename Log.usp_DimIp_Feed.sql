USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimIp_Feed]    Script Date: 26.07.2019 21:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Procedure: Log.InDimFeatFlagMerge

Purpose:  Procedure for inserting data about feat flags.

Activities:

Date		Modified By			Comments
26.07.2019  Labunets S.O.       Added EXISTS check

*/

ALTER PROCEDURE [Log].[usp_DimIp_Feed]
AS 
BEGIN

  SET IDENTITY_INSERT [Log].[DimIp] ON;
   
   IF EXISTS (SELECT Log.DimIp.IpId FROM Log.DimIp WHERE Log.DimIp.IpId = -1)
  UPDATE 
		log.DimIp
						SET Log.DimIp.Ip = ''
						WHERE Log.DimIp.IpId = '-1'

						ELSE

  INSERT INTO [Log].[DimIp] ([IpId], [Ip])
  VALUES (-1, '')
 
  SET IDENTITY_INSERT [Log].[DimIp] OFF;

END
