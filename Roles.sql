DELETE FROM [Roles];
SET IDENTITY_INSERT[Roles] ON;
INSERT INTO [Roles](RoleID, RoleNames) VALUES (1,"Administrator");
INSERT INTO [Roles](RoleID, RoleNames) VALUES (2,"Manager");
INSERT INTO [Roles](RoleID, RoleNames) VALUES (3,"Trainer");
INSERT INTO [Roles](RoleID, RoleNames) VALUES (4,"User");
SET IDENTITY_INSERT[Roles] OFF;
