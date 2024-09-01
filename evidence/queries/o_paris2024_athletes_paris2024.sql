with source as (

    select * from duckdb_paris2024.athletes_paris2024

    where dataset_type = 'olympics' and dataset_year = 'paris2024'

)

from source