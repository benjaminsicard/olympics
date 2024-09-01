with stg_schedules_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__schedules') }}

),

stg_schedules_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__schedules') }}

),

stg_union as (

    select * from stg_schedules_o_paris2024
    union all
    select * from stg_schedules_p_paris2024

)

from stg_union