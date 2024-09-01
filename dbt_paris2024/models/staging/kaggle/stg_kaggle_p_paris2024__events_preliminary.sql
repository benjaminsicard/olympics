with source as (

    select * from {{ source('kaggle_p_paris2024', 'events_preliminary') }}

),

renamed as (

    select
        event,
        tag,
        sport,
        sport_code,
        sport_url

    from source

),

selection as (

    select
        event,
        sport,
        sport_code,
        sport_url,
        'paralympics' as dataset_type,
        'paris2024' as dataset_year

    from renamed

)

select * from selection
