with source as (

    select * from {{ source('kaggle_o_paris2024', 'athletes') }}

),

renamed as (

    select
        code as athlete_code,
        name as athlete_name,
        name_short as athlete_name_short,
        name_tv as athlete_name_tv,
        gender,
        function,
        country_code,
        country,
        country_full,
        nationality,
        nationality_full,
        nationality_code,
        height,
        weight,
        disciplines,
        events,
        birth_date,
        birth_place,
        birth_country,
        residence_place,
        residence_country,
        nickname,
        hobbies,
        occupation,
        education,
        family,
        lang,
        coach,
        reason,
        hero,
        influence,
        philosophy,
        sporting_relatives,
        ritual,
        other_sports

    from source

),

selection as (

    select
        athlete_code,
        athlete_name,
        athlete_name_tv,
        gender,
        country_code,
        country,
        country_full, 
        disciplines,
        events,
        birth_date,
        birth_place,
        'olympics' as dataset_type,
        'paris2024' as dataset_year

    from renamed

)

select * from selection
