with int_medals as (

    select * from {{ ref('int_medals') }}

),

stg_nocs as (

    select * from {{ ref('stg_kaggle_o_paris2024__nocs') }}

),

joining as (

    select
       m.medal_type,
       m.medal_code,
       m.medalled_at,
       m.athlete_name,
       m.country_code,
       n.country,
       n.country_full,
       m.gender,
       m.discipline,
       m.event,
       m.event_type,
       m.url_event,
       m.dataset_type,
       m.dataset_year

    from int_medals m
    left join stg_nocs n on m.country_code = n.country_code

)

select * from joining