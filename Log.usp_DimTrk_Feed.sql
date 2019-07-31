USE [DB_TestLogFile]
GO
/****** Object:  StoredProcedure [Log].[usp_DimTrk_Feed]    Script Date: 31.07.2019 16:15:22 ******/
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

ALTER PROCEDURE [Log].[usp_DimTrk_Feed]
AS 
BEGIN

 
  SET IDENTITY_INSERT [Log].[DimTrk] ON;

  IF EXISTS (SELECT Log.DimTrk.TrkId FROM Log.DimTrk WHERE Log.DimTrk.TrkId = -1)
  UPDATE 
		log.DimTrk
						SET Log.DimTrk.TrkCode = '',
							Log.DimTrk.TrkName = '',
							Log.DimTrk.TrkNum = ''
						WHERE Log.DimTrk.TrkId = '-1'

						ELSE
   
  INSERT INTO [Log].[DimTrk] ([TrkId], [TrkCode], [TrkNum], [TrkName])
  VALUES (-1, '', '', '')
 
  SET IDENTITY_INSERT [Log].[DimTrk] OFF;

END
