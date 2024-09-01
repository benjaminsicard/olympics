with stg_athletes_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__athletes') }}

),

stg_athletes_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__athletes') }}

),

stg_union as (

    select * from stg_athletes_o_paris2024
    union all
    select * from stg_athletes_p_paris2024

)

from stg_union