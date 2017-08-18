IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[EmployeeGrade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [EmployeeGrade]
GO