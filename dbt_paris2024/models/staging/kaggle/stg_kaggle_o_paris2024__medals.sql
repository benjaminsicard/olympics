with source as (

    select * from {{ source('kaggle_o_paris2024', 'medals') }}

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
       code as athlete_or_team_code,
       'olympics' as dataset_type,
       'paris2024' as dataset_year

    from source

)

select * from renamed
