with source as (

    select * from {{ source('kaggle_p_paris2024', 'medals_total') }}

),

renamed as (

    select
       country_code,
       gold_medal as gold_medal_count,
       silver_medal as silver_medal_count,
       bronze_medal as bronze_medal_count,
       total as total_medal_count,
       'paralympics' as dataset_type,
       'paris2024' as dataset_year

    from source

)

select * from renamed
