USE Bibliothek;
-- Autoren
ALTER TABLE Autoren
  MODIFY COLUMN Adresse VARCHAR(100),
  ADD Email VARCHAR(100),
  ADD CONSTRAINT FK_Autoren_Ort FOREIGN KEY (OrtID)
    REFERENCES Orte(ID)
    ON DELETE SET NULL;
-- Autoren_Verlage
ALTER TABLE Autoren_Verlage
  ADD CONSTRAINT FK_Autoren_Verlage_Autor FOREIGN KEY (AutorID)
    REFERENCES Autoren(ID)
    ON DELETE CASCADE,
  ADD CONSTRAINT FK_Autoren_Verlage_Verlag FOREIGN KEY (VerlagID)
    REFERENCES Verlage(ID)
    ON DELETE CASCADE;
-- Genres
ALTER TABLE Genres
  ALTER Fiktion SET DEFAULT 0;
-- Autoren_Genres
ALTER TABLE Autoren_Genres
  ADD CONSTRAINT FK_Autoren_Genres_Autor FOREIGN KEY (AutorID)
    REFERENCES Autoren(ID)
    ON DELETE CASCADE,
  ADD CONSTRAINT FK_Autoren_Genres_Genre FOREIGN KEY (GenreID)
    REFERENCES Genres(ID)
    ON DELETE CASCADE;
-- Buecher
ALTER TABLE Buecher
  ADD CONSTRAINT UQ_ISBN
    UNIQUE (ISBN),
  ADD CONSTRAINT FK_Buecher_Autor FOREIGN KEY (AutorID)
    REFERENCES Autoren(ID)
    ON DELETE NO ACTION,
  ADD CONSTRAINT FK_Buecher_Verlag FOREIGN KEY (VerlagID)
    REFERENCES Verlage(ID)
    ON DELETE NO ACTION,
  ADD CONSTRAINT FK_Buecher_Genre FOREIGN KEY (GenreID)
    REFERENCES Genres(ID)
    ON DELETE SET NULL;
-- Orte
ALTER TABLE Orte
  ADD CONSTRAINT CK_PLZ
  CHECK (PLZ >= 10000 AND PLZ <= 99999);
-- Kunde
ALTER TABLE Kunden
  ADD CONSTRAINT FK_Kunden_Ort FOREIGN KEY (OrtID)
    REFERENCES Orte(ID)
    ON DELETE NO ACTION;
-- Ausleihen
ALTER TABLE Ausleihen
  ADD CONSTRAINT CK_Datum
    CHECK (Datum_von < Datum_bis),
  ADD CONSTRAINT FK_Ausleihen_Kunde FOREIGN KEY (KundeID)
    REFERENCES Kunden(ID)
    ON DELETE CASCADE,
  ADD CONSTRAINT FK_Ausleihen_Buch FOREIGN KEY (BuchID)
    REFERENCES Buecher(ID)
    ON DELETE CASCADE;
