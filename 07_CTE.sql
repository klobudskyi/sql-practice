WITH melomaniacs AS (

SELECT
	c.CustomerId 
	, c.FirstName
	, c.LastName
	, COUNT(DISTINCT g.GenreId) AS NumGenres
FROM InvoiceLine il
LEFT JOIN Track t 	ON il.TrackId = t.TrackId 
LEFT JOIN Genre g 	ON t.GenreId = g.GenreId 
LEFT JOIN Invoice I 	ON il.InvoiceId = i.InvoiceId
LEFT JOIN Customer c 	ON i.CustomerId = c.CustomerId 
GROUP BY 1, 2, 3
HAVING COUNT(DISTINCT g.GenreId) >= 3

)

, invoices AS (

	SELECT *
	FROM Invoice i 
	WHERE InvoiceDate BETWEEN '2009-01-01' AND '2010-01-01'  

)

SELECT *
FROM melomaniacs m
WHERE m.CustomerId IN (SELECT CustomerId FROM invoices)

-- or

-- LEFT JOIN invoices i ON m.CustomerId = i.CustomerId
-- WHERE i.CustomerId IS NULL
