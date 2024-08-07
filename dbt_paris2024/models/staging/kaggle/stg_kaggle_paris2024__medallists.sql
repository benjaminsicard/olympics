with source as (

    select * from {{ source('kaggle_paris2024', 'medallists') }}

),

renamed as (

    select
        medal_date as medalled_at,
        medal_type,
        medal_code,
        name as athlete_name,
        gender,
        country,
        country_code,
        team,
        team_gender,
        discipline,
        event,
        event_type,
        'https://olympics.com' || url_event as url_event,
        code as athlete_code

    from source

)

select * from renamed
