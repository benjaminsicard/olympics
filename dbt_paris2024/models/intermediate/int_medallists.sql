with stg_medallists_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__medallists') }}

),

stg_medallists_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__medallists') }}

),

stg_union as (

    select * from stg_medallists_o_paris2024
    union all
    select * from stg_medallists_p_paris2024

)

from stg_union