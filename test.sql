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

select actors.first_name, actors.last_name, actors.id
from actors inner join
roles on actors.id = roles.actor_id
inner join movies
on roles.movie_id = movies.id
where movies.year < 1900
INTERSECT
select actors.first_name, actors.last_name, actors.id
from actors inner join
roles on actors.id = roles.actor_id
inner join movies
on roles.movie_id = movies.id
where movies.year > 2000
order by actors.id;

select actors.first_name, actors.last_name, movies.name, roles.role, movies.year, COUNT (distinct roles.role) as count
from actors inner join
roles on actors.id = roles.actor_id
inner join movies
on roles.movie_id = movies.id
where movies.year > 1990
group by actors.id, movies.id
having count >=5
limit 10;

select count (*), sub.year
from
(select movies.id, movies.year
from actors inner join
roles on actors.id = roles.actor_id
inner join movies
on roles.movie_id = movies.id
where actors.gender <> 'M'
and actors.gender <> null
group by movies.id
) sub
group by sub.year
limit 10;
