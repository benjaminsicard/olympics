with int_medals_total as (

    select * from {{ ref('int_medals_total') }}

),

countries as (

    select * from {{ ref('countries') }}

),

enriched as (

    select 
    m.*,
    c.country,
    c.latitude,
    c.longitude,
    c.flag

    from int_medals_total m
    left join countries c on m.country_code = c.country_code_3

)

from enriched