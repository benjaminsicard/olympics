with source as (

    select * from duckdb_paris2024.french_departments_paris2024 where department_name is not null

)

from source