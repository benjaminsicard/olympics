with int_athletes as (

    select * from {{ ref('int_athletes') }}

),

exclude_france as (

    select * from int_athletes where country_code != 'FRA'

),

france_only as (

    select * from int_athletes where country_code = 'FRA'

),

clean_france_birth_place as (

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
        dataset_type,
        dataset_year,
        LOWER(
        TRIM(
            -- Step 4: Remove characters inside () at the end of the city name
            REGEXP_REPLACE(
                REPLACE (
                    REPLACE(
                    -- Step 2: Remove everything after a comma
                        REPLACE(
                            -- Step 1: Replace '-' with ' '
                            CASE 
                                -- Step 3: Replace "SAINT" with "ST" if it's the first word
                                when lower(birth_place) in ('lyon', 'paris', 'marseille') then birth_place || ' 01'
                                WHEN lower(birth_place) LIKE '%saint%' THEN REPLACE(lower(birth_place), 'saint', 'st')
                                ELSE birth_place
                            END,
                            '-', ' '
                        ),
                        ',', ''
                    ),
                    '''', ' '
                ),
                '\([^)]*\)', ''
            )
        )
    ) AS birth_place
    
    from france_only

),

exclude_france_selection as (

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
        dataset_type,
        dataset_year
    
    from exclude_france

),

union_athletes as (

    select * from exclude_france_selection
    union all
    select * from clean_france_birth_place

)

from union_athletes