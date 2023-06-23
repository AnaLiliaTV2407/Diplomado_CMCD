SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Invoice
INNER JOIN Customer ON Customer.CustomerId = Invoice.CustomerId;

----Ejercicio 1
SELECT *
FROM Customer;


SELECT*
FROM Track;


----Ejercicio 2
SELECT Name,UnitPrice
FROM Track
WHERE UnitPrice > 0.99;

---Ejercicio 3
SELECT Album.Title AS Album_Title, Artist.Name AS Artis_Name, COUNT(Track.AlbumId) AS Num_Tracks
FROM Album
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId
INNER JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Album.Title, Artist.Name
ORDER BY Num_Tracks DESC;

---Ejercicio 4
SELECT *
FROM Invoice;

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId, SUM(Invoice.Total) AS Total_facturas
FROM Customer
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId
ORDER BY Total_facturas ASC;

---Ejercicio 5
SELECT a.Name, COUNT(b.TrackId) as Num_canciones
From Genre a
INNER JOIN Track b ON GenreId = b.GenreId
group by a.Name
ORDER BY Num_canciones desc
