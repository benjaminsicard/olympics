with source as (

    select * from {{ source('kaggle_paris2024', 'schedules') }}

),

renamed as (

    select
     start_date as started_at,
     end_date as ended_at,
     day as scheduled_at,
     status,
     discipline,
     discipline_code,
     event,
     event_medal as medal_count,
     phase as event_phase,
     gender,
     event_type,
     venue,
     venue_code,
     location_description,
     location_code,
     'https://olympics.com' || url as url_event

    from source

)

select * from renamed
