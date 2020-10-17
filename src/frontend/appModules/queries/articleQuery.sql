select title, count from wikiData 
where title like concat('%', (select actor1name from (select 
    actor1name, nummentions from eventsxgeog where 
    actor1geo_fullname='{0}'   and 
    extract(year from dateadded) = {1} 
    union
    select 
    actor2name, nummentions from eventsxgeog where 
    actor2geo_fullname = '{0}'  and 
    extract(year from dateadded) = {1} 
    order by nummentions desc limit 1) as stats),'%') 
and year = {1} order by count desc limit 5;
