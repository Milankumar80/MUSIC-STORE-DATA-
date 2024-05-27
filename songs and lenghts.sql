Q. Return all the  track name that have a song length longer than the avg song length.
Return the name and millisecond for each track. Order by the song length with the longest song listed first.

Select * from track 

Select name, milliseconds
from track
where milliseconds > ( select avg(milliseconds) from track)
order by milliseconds desc;