USE Bibliothek
GO
-- Autoren
ALTER TABLE Autoren
  ALTER COLUMN Adresse nvarchar(100);
GO
ALTER TABLE Autoren
  ADD Email nvarchar(100),
  CONSTRAINT FK_Autoren_Ort FOREIGN KEY (OrtID)
    REFERENCES Orte(ID)
    ON DELETE SET NULL
GO
-- Autoren_Verlage
ALTER TABLE Autoren_Verlage
  ADD CONSTRAINT FK_Autoren_Verlage_Autor FOREIGN KEY (AutorID)
    REFERENCES Autoren(ID)
    ON DELETE CASCADE,
  CONSTRAINT FK_Autoren_Verlage_Verlag FOREIGN KEY (VerlagID)
    REFERENCES Verlage(ID)
    ON DELETE CASCADE
GO
-- Genres
ALTER TABLE Genres
  ADD CONSTRAINT DF_Fiktion
  DEFAULT 0 FOR Fiktion
GO
-- Autoren_Genres
ALTER TABLE Autoren_Genres
  ADD CONSTRAINT FK_Autoren_Genres_Autor FOREIGN KEY (AutorID)
    REFERENCES Autoren(ID)
    ON DELETE CASCADE,
  CONSTRAINT FK_Autoren_Genres_Genre FOREIGN KEY (GenreID)
    REFERENCES Genres(ID)
    ON DELETE CASCADE
GO
-- Buecher
ALTER TABLE Buecher
  ADD CONSTRAINT UQ_ISBN
    UNIQUE (ISBN),
  CONSTRAINT FK_Buecher_Autor FOREIGN KEY (AutorID)
    REFERENCES Autoren(ID)
    ON DELETE NO ACTION,
  CONSTRAINT FK_Buecher_Verlag FOREIGN KEY (VerlagID)
    REFERENCES Verlage(ID)
    ON DELETE NO ACTION,
  CONSTRAINT FK_Buecher_Genre FOREIGN KEY (GenreID)
    REFERENCES Genres(ID)
    ON DELETE SET NULL
GO
-- Orte
ALTER TABLE Orte
  ADD CONSTRAINT CK_PLZ
  CHECK (PLZ >= 10000 AND PLZ <= 99999)
GO
-- Kunde
ALTER TABLE Kunden
  ADD CONSTRAINT FK_Kunden_Ort FOREIGN KEY (OrtID)
    REFERENCES Orte(ID)
    ON DELETE NO ACTION
GO
-- Ausleihen
ALTER TABLE Ausleihen
  ADD CONSTRAINT CK_Datum
	CHECK (Datum_von < Datum_bis),
  CONSTRAINT FK_Ausleihen_Kunde FOREIGN KEY (KundeID)
    REFERENCES Kunden(ID)
    ON DELETE CASCADE,
  CONSTRAINT FK_Ausleihen_Buch FOREIGN KEY (BuchID)
    REFERENCES Buecher(ID)
    ON DELETE CASCADE
GO
