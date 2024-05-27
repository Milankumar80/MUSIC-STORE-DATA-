Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that return the person who has spent the most money.


SELECT 
CUSTOMER.CUSTOMER_ID, 
CUSTOMER.FIRST_NAME, 
CUSTOMER.LAST_NAME, 
SUM(INVOICE.TOTAL) AS TOTAL 
FROM CUSTOMER
JOIN INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID 
GROUP BY CUSTOMER.CUSTOMER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME
ORDER BY TOTAL DESC
LIMIT 1