/* q1. Find how much amount spent by each customer on artists? 
write a query to return customer name, artist name and total spent */

	WITH Best_selling_artist as ( 
	Select 
    artist.artist_id as artist_id, 
    artist.name as artist_name, 
	sum( invoice_line.unit_price * invoice_line.quantity) 
	from invoice_line
	join 
		track on track.track_id = invoice_line.track_id
	join 	
		album1 on album1.album_id = track.album_id
	join 
		artist on artist.artist_id = album1.artist_id
	GROUP BY 1,2
	ORDER BY 3 DESC 
	LIMIT 1 
	)

	SELECT 
    C.CUSTOMER_ID, 
    C.FIRST_NAME, 
    C.last_name, 
    BSA.ARTIST_NAME,
	SUM(IL.UNIT_PRICE * IL.QUANTITY) AS AMOUNT_SPENT  
	FROM INVOICE AS I
	
    JOIN 
		CUSTOMER AS C ON C.CUSTOMER_ID = I.CUSTOMER_ID
	JOIN 
		INVOICE_LINE AS IL ON IL.INVOICE_ID = I.INVOICE_ID
	JOIN
		TRACK AS T ON T.TRACK_ID = IL.TRACK_ID
    JOIN
		album1 AS AL ON AL.album_id = T.album_id
    JOIN
		artist AS A ON A.artist_id = AL.artist_id
	JOIN
		Best_selling_artist AS BSA ON BSA.ARTIST_ID = A.ARTIST_ID
	GROUP BY 1,2,3,4
	ORDER BY AMOUNT_SPENT DESC 
    