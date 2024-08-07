with stg_athletes as (

    select * from {{ ref('stg_kaggle_paris2024__athletes') }}

),

stg_medallists as (

    select * from {{ ref('stg_kaggle_paris2024__medallists') }}

),

joining as (

    select
        a.athlete_name,
        a.gender,
        a.country_code,
        a.country,
        a.country_full, 
        a.disciplines,
        a.birth_date,
        m.medalled_at,
        m.medal_type,
        m.medal_code,
        m.team,
        m.team_gender,
        m.discipline,
        m.event,
        m.event_type,
        m.url_event

    from stg_athletes a 
    left join stg_medallists m on a.athlete_code = m.athlete_code

),

metrics as (

    select 
        athlete_name,
        gender,
        country_code,
        country,
        country_full, 
        disciplines,
        birth_date,
        sum(case when medal_code = 1 then 1 else 0 end) as gold_medal_count,
        sum(case when medal_code = 2 then 1 else 0 end) as silver_medal_count,
        sum(case when medal_code = 3 then 1 else 0 end) as bronze_medal_count,
        count(*) as medal_count

)

select * from joining