with country_seed as (

    select * from {{ ref('country_codes') }}

),

enriched as (

    select
        country,
        country_code_2,
        country_code_3,
        replace(latitude, '"', '')::decimal as latitude,
        replace(longitude, '"', '')::decimal as longitude,
        case
            when country_code_2 = 'AIN' then 'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2024/07/31/17224381097100.jpg'
            when country_code_2 = 'EOR' then 'https://flaglog.com/img/refugeenation2016.png'
            else 'https://flaglog.com/codes/standardized-rectangle-120px/' || country_code_2 || '.png' 
        end as flag

    from country_seed

)

from enriched