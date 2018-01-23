film = load '/user/maria_dev/sqoop/sakila/film' using PigStorage(',') as (film_id, release_year, language_id, length, rating, last_update);

film_hours = foreach film generate film_id, release_year, language_id, length/60.0 as hours, rating;

film_hours_sorted = order film_hours by hours desc;

film_hours_sorted_top100 = limit film_hours_sorted 100;

dump film_hours_sorted_top100;
