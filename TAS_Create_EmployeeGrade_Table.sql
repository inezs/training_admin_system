IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_EmployeeData_EmployeeGrade]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Classroom] DROP CONSTRAINT [FK_EmployeeData_EmployeeGrade]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[EmployeeGrade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [EmployeeGrade]
GO

CREATE TABLE [EmployeeGrade]
(
	[EmployeeGradeID] int NOT NULL IDENTITY (1, 1),
	[EmployeeGradeName] varchar(50) NOT NULL
)
GO

ALTER TABLE [EmployeeGrade] 
 ADD CONSTRAINT [PK_EmployeeGrade]
	PRIMARY KEY CLUSTERED ([EmployeeGradeID] ASC)
GO