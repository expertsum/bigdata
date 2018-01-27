film_actor = load 'sakila.film_actor' using org.apache.hive.hcatalog.pig.HCatLoader();

describe film_actor;
