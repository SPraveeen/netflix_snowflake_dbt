with raw_movies as 
(
select * from movielens.raw.raw_movies
)
select 
movieId as movie_id,
title,
genres 
from raw_movies