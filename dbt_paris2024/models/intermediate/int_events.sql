with stg_events_o_paris2024 as (

    select * from {{ ref('stg_kaggle_o_paris2024__events') }}

),

stg_events_p_paris2024 as (

    select * from {{ ref('stg_kaggle_p_paris2024__events_preliminary') }}

)

stg_union as (

    select * from stg_events_o_paris2024
    union all
    select * from stg_events_p_paris2024

)

from stg_union