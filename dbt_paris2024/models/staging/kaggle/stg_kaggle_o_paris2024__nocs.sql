with source as (

    select * from {{ source('kaggle_o_paris2024', 'nocs') }}

),

renamed as (

    select
       code as country_code,
       country,
       country_long as country_full,
       tag as country_tag

    from source

)

select * from renamed
