with source as (

    select * from duckdb_paris2024.medals_total_paris2024 where country is not null

)

from source order by total_medal_count desc