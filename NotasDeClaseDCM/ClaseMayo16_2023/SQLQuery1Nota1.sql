CREATE DATABASE myMusic;

CREATE TABLE Album(
		AlbumID INT PRIMARY KEY,
        Title VARCHAR(255),
        Artist VARCHAR(255),
        ReleaseYear INT,
        Genre VARCHAR(255),
        Label VARCHAR(255)

);

INSERT INTO Album (AlbumID, Title, Artist, ReleaseYear, Genre, Label) VALUES
(1, 'Holi', 'Crayoli', 2023, 'Pop','Record1');

SELECT *
FROM Album;

SELECT Title, Artist
FROM Album;
