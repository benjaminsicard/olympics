with source as (

    select * from {{ source('kaggle_paris2024', 'teams') }}

),

renamed as (

    select
     code as team_code,
     team,
     team_gender,
     country,
     country_full,
     country_code,
     discipline,
     disciplines_code as discipline_code,
     events as event,
     athletes as athletes_name,
     athletes_codes,
     num_athletes as athletes_count

    from source

)

select * from renamed
