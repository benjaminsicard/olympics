with source as (

    select
        *,
        replace(trim(both '[]' from split_part(disciplines, ',', 1)), '''', '') as sport
    from duckdb_paris2024.athletes_paris2024

    where dataset_type = 'olympics' and dataset_year = 'paris2024'

)

from source