with source as (

    select * from {{ source('kaggle_o_paris2024', 'events') }}

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
        'olympics' as dataset_type,
        'paris2024' as dataset_year

    from renamed

)

select * from selection
