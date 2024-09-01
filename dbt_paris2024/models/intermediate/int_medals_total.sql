with stg_medals_total_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__medals_total') }}

),

stg_medals_total_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__medals_total') }}

)

stg_union as (

    select * from stg_medals_total_o_paris2024
    union all
    select * from stg_medals_total_p_paris2024

)

from stg_union