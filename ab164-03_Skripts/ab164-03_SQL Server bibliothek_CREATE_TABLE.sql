USE Bibliothek
GO
CREATE TABLE Autoren (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 Nachname nvarchar(50) NOT NULL,
 Vorname nvarchar(50) NOT NULL,
 Adresse nvarchar(20),
 OrtID int
);
GO
CREATE TABLE Verlage (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 Verlag nvarchar(50) NOT NULL,
 Email nvarchar(100),
 Telefonnr nvarchar(20)
);
GO
CREATE TABLE Autoren_Verlage (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 AutorID int NOT NULL,
 VerlagID int NOT NULL
);
GO
CREATE TABLE Genres (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 Genre nvarchar(50) NOT NULL,
 Fiktion bit NOT NULL
);
GO
CREATE TABLE Autoren_Genres (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 AutorID int NOT NULL,
 GenreID int NOT NULL
);
GO
CREATE TABLE Buecher (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 ISBN nchar(17),
 Titel nvarchar(50) NOT NULL,
 Erscheinungsdatum date,
 Anzahl int NOT NULL,
 AutorID int NOT NULL,
 VerlagID int NOT NULL,
 GenreID int
);
GO
CREATE TABLE Orte (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 PLZ int NOT NULL,
 Ort nvarchar(50) NOT NULL
);
GO
CREATE TABLE Kunden (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 Nachname nvarchar(50) NOT NULL,
 Vorname nvarchar(50) NOT NULL,
 Adresse nvarchar(100),
 Email nvarchar(100),
 Geburtsdatum date,
 OrtID int NOT NULL
);
GO
CREATE TABLE Ausleihen (
 ID int IDENTITY(1, 1) PRIMARY KEY,
 Datum_von datetime NOT NULL,
 Datum_bis datetime NOT NULL,
 Preis float,
 KundeID int NOT NULL,
 BuchID int NOT NULL
);
GO
