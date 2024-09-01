with stg_athletes as (

    select * from {{ ref('stg_kaggle_o_paris2024__athletes') }}

),

stg_medals as (

    select * from {{ ref('stg_kaggle_o_paris2024__medals') }}

),

stg_teams as (

    select * from {{ ref('stg_kaggle_o_paris2024__teams') }}

),

joining as (

    select
       m.medal_type,
       m.medal_code,
       m.medalled_at,
       m.athlete_name,
       m.country_code,
       coalesce(a.country, t.country) as country,
       coalesce(a.country_full, t.country_full) as country_full,
       m.gender,
       m.discipline,
       m.event,
       m.event_type,
       m.url_event,
       m.athlete_or_team_code

    from stg_medals m
    left join stg_athletes a on m.athlete_or_team_code = a.athlete_code
    left join stg_teams t on m.athlete_or_team_code = t.team_code

)

select * from joining