create database ramen;
use ramen;
select * from ramen_file;

-- Use the lag and lead function to find out the difference between the two stars
with comparison as (
select Brand, Stars, lead(Stars) over (order by Brand)as Previous_star,lag(Stars) over (order by Brand) as Next_star
from ramen_file
)
select brand, stars,Previous_star,Next_star
from comparison
where 
abs((Stars-Previous_star)<=1 or (Stars-Next_Star)<=1);

-- display the variety and country in 6 buckets
select Variety,Country,ntile(6) over (Order by Variety) as buckets
from ramen_file;
 
-- Create view and rank the variety in desc 
create view ramen_view as 
select variety,rank() over (Order by stars desc)
from ramen_file; 
select * from ramen_view;


-- show the value of rating that are greater than 2
select variety,Stars
from ramen_file
where stars >2;