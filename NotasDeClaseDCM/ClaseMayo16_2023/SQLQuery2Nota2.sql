


SELECT Title, Artist
FROM Album;

USE Chinook;

SELECT *
FROM Album;

Select name FROm sys.tables;

SELECT Top 5*
FROM Artist
WHERE ArtistId=10;

SELECT*
FROM Artist
WHERE ArtistId=10;

SELECT COUNT(*) AS TotalTracks
FROM Track;

SELECT *
FROM Invoice;


SELECT SUM(Total) as Ventas
FROM Invoice;

SELECT *
FROM Track;

SELECT AVG(Milliseconds) as Duracion
FROM Track;

SELECT Min(Milliseconds) as Minimo_Track, Max(Milliseconds) as Max_Track
FROM Track;

SELECT GenreId, COUNT(*) AS TotalTrack
FROM Track
GROUP BY GenreId
ORDER BY TotalTrack DESC;

SELECT AlbumId, AVG(Milliseconds) as Duration
FROM Track
GROUP BY AlbumId
HAVING AVG(Milliseconds) > 231636;
--where antes de group by

---Filtrar a resultado que voy a tener 
SELECT AlbumId, GenreId, AVG(Milliseconds) as Duration
FROM Track
WHERE GenreId = 1
GROUP BY AlbumId, GenreId
HAVING AVG(Milliseconds) > 231636;

SELECT Track.TrackId, Track.Name, Album.Title
FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId; --Ambos que tengan igual ID 1=1, 2=2

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Customer
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId;

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Invoice
RIGHT JOIN Customer ON Customer.CustomerId = Invoice.CustomerId;

SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId =al.AlbumId
JOIN Artist ar ON al.ArtistId =ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock';  ---canciones de rock

CREATE VIEW canciones AS (
SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId =al.AlbumId
JOIN Artist ar ON al.ArtistId =ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId);
--WHERE g.Name = 'Rock';  ---canciones de rock

SELECT *
FROM canciones;

