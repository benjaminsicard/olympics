with french_athletes as (

    select * from {{ ref('athletes_paris2024') }} where country_code = 'FRA'

),

aggr as (

    select
        department_code,
        department_name,
        sum(total_medal_count) as total_medal_count
    
    from french_athletes

    group by department_code, department_name

)

from aggr