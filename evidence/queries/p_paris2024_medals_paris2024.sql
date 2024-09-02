with source as (

    select * from duckdb_paris2024.medals_paris2024

    where dataset_type = 'paralympics' and dataset_year = 'paris2024'

)

from source