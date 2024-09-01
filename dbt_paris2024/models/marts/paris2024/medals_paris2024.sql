with int_athletes as (

    select * from {{ ref('int_athletes') }}

),

int_medals as (

    select * from {{ ref('int_medals') }}

),

int_teams as (

    select * from {{ ref('int_teams') }}

),

joining as (

    select
       m.medal_type,
       m.medal_code,
       m.medalled_at,
       m.athlete_name,
       m.country_code,
       coalesce(a.country, t.country) as country,
       coalesce(a.country_full, t.country_long) as country_full,
       m.gender,
       m.discipline,
       m.event,
       m.event_type,
       m.url_event,
       m.athlete_or_team_code,
       m.dataset_type,
       m.dataset_year

    from int_medals m
    left join int_athletes a on m.athlete_or_team_code = a.athlete_code
    left join int_teams t on m.athlete_or_team_code = t.team_code

)

select * from joining