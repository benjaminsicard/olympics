with stg_medals_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__medals') }}

),

stg_medals_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__medals') }}

)

stg_union as (

    select * from stg_medals_o_paris2024
    union all
    select * from stg_medals_p_paris2024

)

from stg_union