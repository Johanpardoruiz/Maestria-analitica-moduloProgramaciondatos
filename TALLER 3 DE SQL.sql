
--TALLER 3


--1. Cuántos artistas tenemos
SELECT COUNT(*) AS Total_Artistas
FROM artists;

--2. A qué artista pertenece el álbum “Voodoo Lounge”

SELECT art.Name AS Artista
FROM albums alb
JOIN artists art ON alb.ArtistId = art.ArtistId
WHERE alb.Title = 'Voodoo Lounge';


--3. Cuales son los álbumes que tiene el artista “Ozzy Osbourne”

SELECT alb.Title 
FROM albums alb
JOIN artists art ON alb.ArtistId = art.ArtistId
WHERE art.Name = 'Ozzy Osbourne';


--4. Cuantas canciones tiene el artista “Red Hot Chili Peppers”

SELECT art.Name AS Artista, COUNT(trk.TrackId) AS Total_Canciones
FROM artists art
JOIN albums alb ON art.ArtistId = alb.ArtistId
JOIN tracks trk ON alb.AlbumId = trk.AlbumId
WHERE art.Name = 'Red Hot Chili Peppers'
GROUP BY art.Name;


--5. Cuales son los 3 tracks más largos (tiempo)

SELECT trk.Name AS Track, trk.Milliseconds AS Duracion
FROM tracks trk
ORDER BY trk.Milliseconds DESC
LIMIT 3;


--6. Cual es el género de la canción que menos peso tiene (Bytes)

SELECT gen.Name AS genero, trk.Name AS Track, trk.Bytes AS Peso
FROM tracks trk
JOIN genres gen ON gen.GenreId =trk.GenreId 
ORDER BY trk.Bytes ASC 
LIMIT 1;

--7. Cual es el genero con mas canciones

SELECT gen.Name AS Genero, COUNT(trk.TrackId) AS Total_Canciones
FROM tracks trk
JOIN genres gen ON trk.GenreId = gen.GenreId
GROUP BY gen.Name
ORDER BY Total_Canciones DESC
LIMIT 1;

--8. Indicar el top 10 de los artistas con más canciones

SELECT art.Name AS Artista, COUNT(trk.TrackId) AS Total_Canciones
FROM artists art
JOIN albums alb ON art.ArtistId = alb.ArtistId
JOIN tracks trk ON alb.AlbumId = trk.AlbumId
GROUP BY art.Name
ORDER BY Total_Canciones DESC
LIMIT 10;

--9. Cuantos invoices tiene cada empleado, organizar desde el mayor al menor

SELECT enp.FirstName || " " || enp.LastName AS Nombre_empleado, COUNT(inv.InvoiceId) AS invoices
FROM employees enp
LEFT JOIN customers cus ON enp.EmployeeId = cus.SupportRepId
LEFT JOIN invoices inv ON cus.CustomerId = inv.CustomerId
GROUP BY enp.FirstName || " " || enp.LastName
ORDER BY invoices DESC;


--10. Cual es la cancion que mas existe en las playlist

SELECT trk.Name AS Nombre_cancion, COUNT(*) AS conteo
FROM playlists pla 
JOIN playlist_track pt ON pla.PlaylistId = pt.PlaylistId 
JOIN tracks trk ON pt.TrackId = trk.TrackId 
GROUP BY trk.Name
ORDER BY conteo DESC
LIMIT 1;


