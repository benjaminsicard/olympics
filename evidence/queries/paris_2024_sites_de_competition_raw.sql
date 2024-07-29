with source as (

    select * from motherduck.paris_2024_sites_de_competition

),

datatype as (

    select
        Code_Site as site_code,
        Nom_Site as site,
        category_id as category,
        Sports as sport,
        start_date::date as started_at,
        end_date::date as ended_at,
        replace(latitude, ',', '.')::decimal as latitude,
        replace(longitude, ',', '.')::decimal as longitude
    
    from source

)

from datatype