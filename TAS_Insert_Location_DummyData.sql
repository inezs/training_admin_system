DELETE FROM [Location];
SET IDENTITY_INSERT[Location] ON;
INSERT INTO [Location](LocationID, CityName)VALUES(1, "Bali");
INSERT INTO [Location](LocationID, CityName)VALUES(2, "Bandung");
INSERT INTO [Location](LocationID, CityName)VALUES(3, "Yogyakarta");
INSERT INTO [Location](LocationID, CityName)VALUES(4, "Jakarta");
SET IDENTITY_INSERT [Location] OFF