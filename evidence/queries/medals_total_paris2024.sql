with source as (

    select * from duckdb_paris2024.medals_total_paris2024 where country is not null

)

from source order by ${inputs.medals_order_by.value} desc, gold_medal_count desc, silver_medal_count desc, bronze_medal_count desc