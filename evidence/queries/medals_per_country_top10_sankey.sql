with source as (

    select * from ${medals_per_country_top10}

),

pivoted as (

    select 
        country_code,
        country,
        country_full,
        'gold' as medal_type, 
        1 as medal_code,
        gold_medal_count as medal_count,
        total_medal_count
    from source

    union all

    select 
        country_code, 
        country,
        country_full,
        'silver' as medal_type, 
        2 as medal_code,
        silver_medal_count as medal_count,
        total_medal_count
    from source

    union all

    select 
        country_code, 
        country,
        country_full,
        'bronze' as medal_type, 
        3 as medal_code,
        bronze_medal_count as medal_count,
        total_medal_count
    from source

)

from pivoted order by total_medal_count desc, medal_code asc