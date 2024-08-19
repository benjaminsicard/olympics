with source as (

    select * from duckdb_paris2024.athletes_paris2024

    where department_code is not null
    and department_code = cast(${inputs.french_departments_area_map.department_code} as varchar)

    order by gold_medal_count desc, silver_medal_count desc, bronze_medal_count desc

)

from source