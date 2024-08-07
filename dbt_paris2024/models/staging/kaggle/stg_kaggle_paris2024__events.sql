with source as (

    select * from {{ source('kaggle_paris2024', 'events') }}

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
        sport_url

    from renamed

)

select * from selection
