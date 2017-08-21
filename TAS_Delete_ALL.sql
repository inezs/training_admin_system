--DROP Constraints that used to make EmployeeGrade
IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_EmployeeData_EmployeeGrade]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [EmployeeData] DROP CONSTRAINT [FK_EmployeeData_EmployeeGrade]
GO

--DROP EmployeeGrade Table
IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'EmployeeGradeID'
          AND Object_ID = Object_ID(N'EmployeeData'))
ALTER TABLE [EmployeeData] DROP COLUMN [EmployeeGradeID]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[EmployeeGrade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [EmployeeGrade]
GO

--DROP CONSTRAINTS OF INITIAL TABLES
IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Classroom_Location]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Classroom] DROP CONSTRAINT [FK_Classroom_Location]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Course_Classroom]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Course] DROP CONSTRAINT [FK_Course_Classroom]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Course_TrainingPeriod]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Course] DROP CONSTRAINT [FK_Course_TrainingPeriod]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_CourseParticipants_Course]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [CourseParticipants] DROP CONSTRAINT [FK_CourseParticipants_Course]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_CourseParticipants_UserRole]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [CourseParticipants] DROP CONSTRAINT [FK_CourseParticipants_UserRole]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_EmployeeData_Location]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [EmployeeData] DROP CONSTRAINT [FK_EmployeeData_Location]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Trainer_Course]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Trainer] DROP CONSTRAINT [FK_Trainer_Course]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Trainer_UserRole]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Trainer] DROP CONSTRAINT [FK_Trainer_UserRole]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_TrainingAchievement_CourseParticipants]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [TrainingAchievement] DROP CONSTRAINT [FK_TrainingAchievement_CourseParticipants]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_TrainingAchievement_UserRole]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [TrainingAchievement] DROP CONSTRAINT [FK_TrainingAchievement_UserRole]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_UserRole_EmployeeData]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [UserRole] DROP CONSTRAINT [FK_UserRole_EmployeeData]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_UserRole_Roles]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [UserRole] DROP CONSTRAINT [FK_UserRole_Roles]
GO

/* DROP TABLES INITIALS */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Classroom]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Classroom]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Course]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Course]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[CourseParticipants]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [CourseParticipants]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[EmployeeData]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [EmployeeData]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Location]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Location]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Roles]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Roles]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Trainer]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Trainer]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[TrainingAchievement]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [TrainingAchievement]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[TrainingPeriod]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [TrainingPeriod]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[UserRole]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [UserRole]
GO