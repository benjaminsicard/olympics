with source as (

    select * from ${medals_paris2024}

),

date_range AS (

    select distinct 
        country_code,
        country,
        country_full,
        unnest(generate_series(
            date_trunc('day', min(medalled_at) over ()), 
            date_trunc('day', max(medalled_at) over ()), 
            interval '1 day'
        )) as medalled_at
  FROM source

),

top_selection as (

    select 
        country_code,
        total_medal_count
    
    from duckdb_paris2024.medals_total_paris2024
    order by total_medal_count desc
    limit 10

),



medals_per_day_for_top_countries as (

    select distinct
        dr.country_code,
        dr.country,
        dr.country_full,
        dr.medalled_at,
        sum(case when medal_code = 1 then 1 else 0 end) over ( 
            partition by dr.country_code order by dr.medalled_at asc
            ) as gold_medal_cumulative_count,
        sum(case when medal_code = 2 then 1 else 0 end) over ( 
            partition by dr.country_code order by dr.medalled_at asc
            ) as silver_medal_cumulative_count,
        sum(case when medal_code = 3 then 1 else 0 end) over ( 
            partition by dr.country_code order by dr.medalled_at asc
            ) as bronze_medal_cumulative_count,
        sum(case when medal_code in (1, 2, 3) then 1 else 0 end) over ( 
            partition by dr.country_code order by dr.medalled_at asc
            ) as total_medal_cumulative_count,
        top.total_medal_count

    from date_range dr
    left join source s on dr.country_code = s.country_code and dr.medalled_at = s.medalled_at
    inner join top_selection top on dr.country_code = top.country_code 

    order by 9 desc

)

from medals_per_day_for_top_countries