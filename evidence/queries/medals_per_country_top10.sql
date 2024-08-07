with source as (

    select * from ${medals_paris2024}

),

added_metrics as (

    select 
        country_code,
        country,
        country_full,
        sum(case when medal_code = 1 then 1 else 0 end) as gold_medal_count,
        sum(case when medal_code = 2 then 1 else 0 end) as silver_medal_count,
        sum(case when medal_code = 3 then 1 else 0 end) as bronze_medal_count,
        count(*) as total_medal_count
    
    from source
    group by 1, 2, 3

)

from added_metrics order by total_medal_count desc limit 10