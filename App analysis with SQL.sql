--Part A.Exploratory Data Analysis(EDA)
--- 1.Check if there is anything missing in important columns 
select count(*) as missing_value 
from AppleStore
where track_name is null or price is null or user_rating is null or prime_genre is null or lang_num is null

select count(*) as missing_value 
from appleStore_description
where app_desc is null or track_name is null


--- 2.Change column type 
alter table AppleStore
alter column price FLOAT;
alter table AppleStore
alter column user_rating FLOAT;
alter table AppleStore
alter column lang_num int;
alter table AppleStore
alter column rating_count_tot int;


--- 3.Overview of apps' ratings
select max(user_rating) as Max_rating,
       min(user_rating) as Min_rating,
       AVG(user_rating) as Avg_rating
from AppleStore


--Part B.Data Analysis
--- 1.Compare average ratings between free app and paid app
select case 
           when price >0 then 'Paid'
           else 'Free'
       end as App_Type,
       AVG(user_rating) as Avg_Rating
from AppleStore 
group by 
        CASE
        WHEN price > 0 THEN 'Paid'
        ELSE 'Free'
        END


--- 2.Find out whether apps with more supported language have higher rating 
select case
           when lang_num <= 10 then '<=10 languages'
           when lang_num between 11 and 20 then '11-20 languages'
           else '>20 languages'
        end as language_category, 
        Avg(user_rating)
from AppleStore
group by case
         when lang_num <= 10 then '<=10 languages'
         when lang_num between 11 and 20 then '11-20 languages'
         else '>20 languages'
         end  
order by Avg(user_rating) desc


--- 3.Find out top 5 lowest-rated genres
select top 5 prime_genre,
        AVG(user_rating) as Avg_Rating
from AppleStore 
group by prime_genre
order by AVG(user_rating ) ASC


--- 4.Find out top 5 highest-rated genres
select top 5 prime_genre,
        AVG(user_rating) as Avg_Rating
from AppleStore 
group by prime_genre
order by AVG(user_rating ) desc



--- 5.Is there correlation between App description and rating
select case 
       when LEN(b.app_desc)<500 then 'short'
       when LEN(b.app_desc) between 500 and 1000 then 'medium'
       else 'long'
       end as desroption_length,
       avg(user_rating) as avg_user_rating
from AppleStore as A
JOIN appleStore_description as B
on a.id = b.id
group by case
         when LEN(b.app_desc)<500 then 'short'
         when LEN(b.app_desc) between 500 and 1000 then 'medium'
         else 'long'
         end 
order by avg(user_rating);


--- 6.Find out the app with highest rank for each genre
select prime_genre,
       track_name,
       user_rating
from (
       select user_rating,
       track_name,
       prime_genre,
       rank() over (partition by prime_genre order by user_rating desc, rating_count_tot desc) as rank
       from AppleStore
     ) as a
where a.rank =1 