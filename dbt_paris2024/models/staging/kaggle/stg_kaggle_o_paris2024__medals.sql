with source as (

    select * from {{ source('kaggle_paris2024', 'medals') }}

),

renamed as (

    select
       medal_type,
       medal_code,
       medal_date as medalled_at,
       name as athlete_name,
       country_code,
       gender,
       discipline,
       event,
       event_type,
       'https://olympics.com' || url_event as url_event,
       code as athlete_or_team_code

    from source

)

select * from renamed
