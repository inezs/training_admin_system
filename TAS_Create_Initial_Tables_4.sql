/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.1 		*/
/*  Created On : 14-Aug-2017 13:41:16 				*/
/*  DBMS       : SQL Server 2008 						*/
/* ---------------------------------------------------- */

/* Drop Foreign Key Constraints */

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

/* Drop Tables */

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

/* Create Tables */

CREATE TABLE [Classroom]
(
	[ClassroomID] int NOT NULL IDENTITY (1, 1),
	[ClassroomName] varchar(50) NOT NULL,
	[LocationID] int NOT NULL
)
GO

CREATE TABLE [Course]
(
	[CourseID] int NOT NULL IDENTITY (1, 1),
	[CourseName] varchar(50) NOT NULL,
	[TrainingPeriodID] int NOT NULL,
	[ClassroomID] int NOT NULL,
	[StartingDate] date NOT NULL,
	[StartTime] time(7) NOT NULL,
	[EndTime] time(7) NOT NULL,
	[Capacity] int NOT NULL,
	[OpenEnrollment] bit NOT NULL,
	[OnlineClass] bit NOT NULL
)
GO

CREATE TABLE [CourseParticipants]
(
	[CourseParticipantsID] int NOT NULL IDENTITY (1, 1),
	[UserRoleID] int NOT NULL,
	[CourseID] int NOT NULL
)
GO

CREATE TABLE [EmployeeData]
(
	[EmployeeID] int NOT NULL IDENTITY (1, 1),
	[FullName] varchar(50) NOT NULL,
	[JobFamily] varchar(50) NOT NULL,
	[Stream] varchar(50) NOT NULL,
	[ActiveEmployee] bit NOT NULL,
	[Email] varchar(100) NOT NULL,
	[AccountName] varchar(100) NOT NULL,
	[Grade] varchar(50) NOT NULL,
	[LocationID] int NOT NULL
)
GO

CREATE TABLE [Location]
(
	[LocationID] int NOT NULL IDENTITY (1, 1),
	[CityName] varchar(50) NOT NULL
)
GO

CREATE TABLE [Roles]
(
	[RoleID] int NOT NULL IDENTITY (1, 1),
	[RoleNames] varchar(50) NOT NULL
)
GO

CREATE TABLE [Trainer]
(
	[TrainerID] int NOT NULL IDENTITY (1, 1),
	[UserRoleID] int NOT NULL,
	[CourseID] int NOT NULL,
	[TrainerRank] tinyint NOT NULL    -- trainer rank specifies wether the trainer is main trainer or back up trainer
)
GO

CREATE TABLE [TrainingAchievement]
(
	[TrainingAchievementID] int NOT NULL IDENTITY (1, 1),
	[UserRoleID] int NOT NULL,
	[CourseParticipantsID] int NOT NULL,
	[Achievement] tinyint NULL
)
GO

CREATE TABLE [TrainingPeriod]
(
	[TrainingPeriodID] int NOT NULL IDENTITY (1, 1),
	[StartDate] date NOT NULL,
	[EndDate] date NOT NULL,
	[CreatorID] int NOT NULL,
	[CreatedDate] datetime NOT NULL,
	[UpdaterID] int NOT NULL,
	[UpdateDate] datetime NOT NULL
)
GO

CREATE TABLE [UserRole]
(
	[UserRoleID] int NOT NULL IDENTITY (1, 1),
	[EmployeeID] int NOT NULL,
	[RoleID] int NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [Classroom] 
 ADD CONSTRAINT [PK_Clasroom]
	PRIMARY KEY CLUSTERED ([ClassroomID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Classroom_Location] 
 ON [Classroom] ([LocationID] ASC)
GO

ALTER TABLE [Course] 
 ADD CONSTRAINT [PK_Course]
	PRIMARY KEY CLUSTERED ([CourseID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Course_Classroom] 
 ON [Course] ([ClassroomID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Course_TrainingPeriod] 
 ON [Course] ([TrainingPeriodID] ASC)
GO

ALTER TABLE [CourseParticipants] 
 ADD CONSTRAINT [PK_CourseParticipants]
	PRIMARY KEY CLUSTERED ([CourseParticipantsID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_CourseParticipants_Course] 
 ON [CourseParticipants] ([CourseID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_CourseParticipants_UserRole] 
 ON [CourseParticipants] ([UserRoleID] ASC)
GO

ALTER TABLE [EmployeeData] 
 ADD CONSTRAINT [PK_EmployeeData]
	PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_EmployeeData_Location] 
 ON [EmployeeData] ([LocationID] ASC)
GO

ALTER TABLE [Location] 
 ADD CONSTRAINT [PK_Location]
	PRIMARY KEY CLUSTERED ([LocationID] ASC)
GO

ALTER TABLE [Roles] 
 ADD CONSTRAINT [PK_Roles]
	PRIMARY KEY CLUSTERED ([RoleID] ASC)
GO

ALTER TABLE [Trainer] 
 ADD CONSTRAINT [PK_Trainer]
	PRIMARY KEY CLUSTERED ([TrainerID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Trainer_Course] 
 ON [Trainer] ([CourseID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Trainer_UserRole] 
 ON [Trainer] ([UserRoleID] ASC)
GO

ALTER TABLE [TrainingAchievement] 
 ADD CONSTRAINT [PK_TrainingAchievement]
	PRIMARY KEY CLUSTERED ([TrainingAchievementID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_TrainingAchievement_CourseParticipants] 
 ON [TrainingAchievement] ([CourseParticipantsID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_TrainingAchievement_UserRole] 
 ON [TrainingAchievement] ([UserRoleID] ASC)
GO

ALTER TABLE [TrainingPeriod] 
 ADD CONSTRAINT [PK_TrainingPeriod]
	PRIMARY KEY CLUSTERED ([TrainingPeriodID] ASC)
GO

ALTER TABLE [UserRole] 
 ADD CONSTRAINT [PK_UserRole]
	PRIMARY KEY CLUSTERED ([UserRoleID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_UserRole_EmployeeData] 
 ON [UserRole] ([EmployeeID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_UserRole_Roles] 
 ON [UserRole] ([RoleID] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [Classroom] ADD CONSTRAINT [FK_Classroom_Location]
	FOREIGN KEY ([LocationID]) REFERENCES [Location] ([LocationID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Course] ADD CONSTRAINT [FK_Course_Classroom]
	FOREIGN KEY ([ClassroomID]) REFERENCES [Classroom] ([ClassroomID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Course] ADD CONSTRAINT [FK_Course_TrainingPeriod]
	FOREIGN KEY ([TrainingPeriodID]) REFERENCES [TrainingPeriod] ([TrainingPeriodID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [CourseParticipants] ADD CONSTRAINT [FK_CourseParticipants_Course]
	FOREIGN KEY ([CourseID]) REFERENCES [Course] ([CourseID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [CourseParticipants] ADD CONSTRAINT [FK_CourseParticipants_UserRole]
	FOREIGN KEY ([UserRoleID]) REFERENCES [UserRole] ([UserRoleID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [EmployeeData] ADD CONSTRAINT [FK_EmployeeData_Location]
	FOREIGN KEY ([LocationID]) REFERENCES [Location] ([LocationID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Trainer] ADD CONSTRAINT [FK_Trainer_Course]
	FOREIGN KEY ([CourseID]) REFERENCES [Course] ([CourseID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Trainer] ADD CONSTRAINT [FK_Trainer_UserRole]
	FOREIGN KEY ([UserRoleID]) REFERENCES [UserRole] ([UserRoleID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [TrainingAchievement] ADD CONSTRAINT [FK_TrainingAchievement_CourseParticipants]
	FOREIGN KEY ([CourseParticipantsID]) REFERENCES [CourseParticipants] ([CourseParticipantsID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [TrainingAchievement] ADD CONSTRAINT [FK_TrainingAchievement_UserRole]
	FOREIGN KEY ([UserRoleID]) REFERENCES [UserRole] ([UserRoleID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [UserRole] ADD CONSTRAINT [FK_UserRole_EmployeeData]
	FOREIGN KEY ([EmployeeID]) REFERENCES [EmployeeData] ([EmployeeID]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [UserRole] ADD CONSTRAINT [FK_UserRole_Roles]
	FOREIGN KEY ([RoleID]) REFERENCES [Roles] ([RoleID]) ON DELETE No Action ON UPDATE No Action
GO

/* Create Table Comments */

EXEC sp_addextendedproperty 'MS_Description', 'Roles: Manager,  Trainer, Admin, and user', 'Schema', [dbo], 'table', [Roles]
GO

EXEC sp_addextendedproperty 'MS_Description', 'trainer rank specifies wether the trainer is main trainer or back up trainer', 'Schema', [dbo], 'table', [Trainer], 'column', [TrainerRank]
GO
