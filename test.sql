// actors => roles => movies => movies.movies_genres

SELECT sub.name, actors.first_name, actors.last_name
  FROM (
        select movies.id, movies.name
        from actors inner join
        roles on actors.id = roles.actor_id
        inner join movies
        on roles.movie_id = movies.id
        inner join movies_genres
        on movies.id = movies_genres.movie_id
        where actors.first_name = 'Kevin'
        and actors.last_name = 'Bacon'
        and movies_genres.genre = 'Drama'
       ) sub
inner join roles
on sub.id = roles.movie_id
inner join actors
on roles.actor_id = actors.id
where actors.first_name <> 'Kevin'
and actors.last_name <> 'Bacon'
limit 10;

