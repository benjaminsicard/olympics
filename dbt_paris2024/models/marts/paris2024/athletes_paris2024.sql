with int_athletes as (

    select * from {{ ref('int_athletes_birth_place') }}

),

int_medallists as (

    select * from {{ ref('int_medallists') }}

),

seed_cities_france as (

    select * from {{ ref('cities_france') }}

),

seed_departments_france as (

    select * from {{ ref('departments_france') }}

),

joining as (

    select
        a.athlete_name,
        a.gender,
        a.country_code,
        a.country,
        a.country_full, 
        a.disciplines,
        a.birth_date,
        a.birth_place,
        'https://olympics.com/en/paris-2024/athlete/' || lower(replace(a.athlete_name_tv, ' ', '-')) || '_' || a.athlete_code as athlete_url,
        coalesce(city.department_name, department.department_name) as department_name,
        coalesce(city.department_number, department.department_number) as department_code,
        coalesce(city.region_geojson_name, department.region_geojson_name)  as region_name,
        m.medalled_at,
        m.medal_type,
        m.medal_code,
        m.team,
        m.team_gender,
        m.discipline,
        m.event,
        m.event_type,
        m.url_event,
        a.dataset_type,
        a.dataset_year

    from int_athletes a 
    left join int_medallists m on lower(a.athlete_name) = lower(m.athlete_name) and a.dataset_year = m.dataset_year
    left join seed_cities_france city on a.birth_place = city.city_code
    left join seed_cities_france department on a.birth_place = department.department_name

),

department_cleaned as (

    select
        athlete_name,
        gender,
        coalesce(country_code, 'FRA') as country_code,
        country,
        country_full, 
        disciplines,
        birth_date,
        birth_place,
        athlete_url,
        d.department_name,
        d.department_code,
        region_name,
        medalled_at,
        medal_type,
        medal_code,
        team,
        team_gender,
        discipline,
        event,
        event_type,
        url_event,
        dataset_type,
        dataset_year
    
    from joining j
    full join seed_departments_france d on j.department_code = d.department_code -- we want minimum one row per department

),

-- eliminate duplicates because of the join on department_name in joining
eliminating_duplicates as (

    select distinct * from department_cleaned

),

metrics as (

    select 
        athlete_name,
        gender,
        country_code,
        country,
        country_full, 
        disciplines,
        birth_date,
        birth_place,
        athlete_url,
        athlete_url,
        department_name,
        department_code,
        region_name,
        dataset_type,
        dataset_year,
        sum(case when medal_code = 1 then 1 else 0 end) as gold_medal_count,
        sum(case when medal_code = 2 then 1 else 0 end) as silver_medal_count,
        sum(case when medal_code = 3 then 1 else 0 end) as bronze_medal_count,
        sum(case when medal_code in (1, 2, 3) then 1 else 0 end) as total_medal_count,

    from eliminating_duplicates
    
    group by 
        athlete_name,
        gender,
        country_code,
        country,
        country_full, 
        disciplines,
        birth_date,
        birth_place,
        athlete_url,
        department_name,
        department_code,
        region_name,
        dataset_type,
        dataset_year

)

select * from metrics -- remove duplicate from join on department_name