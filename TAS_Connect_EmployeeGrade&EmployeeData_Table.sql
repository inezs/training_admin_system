IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_EmployeeData_EmployeeGrade]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [EmployeeData] DROP CONSTRAINT [FK_EmployeeData_EmployeeGrade]
GO

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'EmployeeGradeID'
          AND Object_ID = Object_ID(N'EmployeeData'))
ALTER TABLE [EmployeeData] DROP COLUMN [EmployeeGradeID]
GO

ALTER TABLE [EmployeeData] ADD EmployeeGradeID int NULL

ALTER TABLE [EmployeeData] ADD CONSTRAINT [FK_EmployeeData_EmployeeGrade]
	FOREIGN KEY ([EmployeeGradeID]) REFERENCES [EmployeeGrade] ([EmployeeGradeID]) ON DELETE No Action ON UPDATE No Action
GO


--/////////////////////////////////////////////////////////////-------
DECLARE @pointer_gradename varchar(50)
DECLARE @cursor_gradename cursor 
DECLARE @current_gradeid int

SET @cursor_gradename = CURSOR FOR 
    SELECT EmployeeGradeName FROM EmployeeGrade

OPEN @cursor_gradename 
FETCH NEXT FROM @cursor_gradename INTO @pointer_gradename
SELECT @current_gradeid = EmployeeGradeID FROM EmployeeGrade WHERE EmployeeGradeName = @pointer_gradename

WHILE (@@FETCH_STATUS = 0) 
BEGIN 
	UPDATE EmployeeData SET EmployeeData.EmployeeGradeID = @current_gradeid WHERE Grade = @pointer_gradename

	FETCH NEXT FROM @cursor_gradename INTO @pointer_gradename
	SELECT @current_gradeid = EmployeeGradeID FROM EmployeeGrade WHERE EmployeeGradeName = @pointer_gradename
END 

CLOSE @cursor_gradename
DEALLOCATE @cursor_gradename