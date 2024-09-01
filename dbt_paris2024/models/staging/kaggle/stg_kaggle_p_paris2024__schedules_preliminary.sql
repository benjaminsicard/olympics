with source as (

    select * from {{ source('kaggle_p_paris2024', 'schedules_preliminary') }}

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
       sport_url,
       'paralympics' as dataset_type,
       'paris2024' as dataset_year


    from source

)

select * from renamed
