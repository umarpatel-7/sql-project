use music_company;
# Q1. who is the senior most employee based on job title?
select * from employee
order by levels desc
limit 1 ;

# Q2. which countries have the most invoices?
select count(*),billing_country from invoice
group by billing_country
order by 1 desc;

# Q3. what are top 3 values of total invoice?
select total from invoice
order by total desc
limit 3 ;

/* Q4. which city has the best customer? we would like to throw a promotional music festival in the city 
 we made the most money. write a query that returns one city that has the highest sum of invoice total.
 Return both the city name and sum of total invoice */
select billing_city,sum(total) as invoice_total from invoice
group by billing_city
order by invoice_total desc
limit 1;

/* Q5. who is the best customer? The customer who  spends the most money will be declared the best customer.
 write a query that returns the person who spends the most money. */
Select customer.customer_id, customer.first_name, customer.last_name,sum(invoice.total) as total 
from customer
join invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id,customer.first_name, customer.last_name
order by total desc limit 1; 

/* Q6. write a query to return email, first name, last name,& genre of al rock music listeners.
Return your list ordered alphabetically by email staring with A */
select distinct email,first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id IN(
select track_id from track 
join genre on track.genre_id = genre.genre_id
where genre.name LIKE 'Rock')
order by email;

/* Q7. Lest's invite the artists who have written the most rock music in our dataset
write a query that returns the artist name, total count of the top 10 rock brands */
select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id, artist.name
order by number_of_songs desc
limit 10;


