DELETE FROM [EmployeeGrade];
SET IDENTITY_INSERT[EmployeeGrade] ON;

INSERT INTO [EmployeeGrade](EmployeeGradeID, EmployeeGradeName) VALUES(1, 'JP');
INSERT INTO [EmployeeGrade](EmployeeGradeID, EmployeeGradeName) VALUES(2, 'PG');
INSERT INTO [EmployeeGrade](EmployeeGradeID, EmployeeGradeName) VALUES(3, 'AP');
INSERT INTO [EmployeeGrade](EmployeeGradeID, EmployeeGradeName) VALUES(4, 'AN');

SET IDENTITY_INSERT [EmployeeGrade] OFF