with stg_schedules_preliminary_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__schedules_preliminary') }}

),

stg_schedules_preliminary_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__schedules_preliminary') }}

),

stg_union as (

    select * from stg_schedules_preliminary_o_paris2024
    union all
    select * from stg_schedules_preliminary_p_paris2024

)

from stg_union