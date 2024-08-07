with source as (

    select * from {{ source('kaggle_paris2024', 'schedules_preliminary') }}

),

renamed as (

    select
       date_start_utc as started_at,
       date_end_utc as ended_at,
       medal as medal_count,
       venue_code,
       description as venue,
       team_1_code,
       team_1,
       team_2_code,
       team_2,
       tag,
       sport,
       sport_code,
       sport_url


    from source

)

select * from renamed
