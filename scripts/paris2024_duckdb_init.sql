set timezone = 'UTC';
-- drop table first
drop schema if exists kaggle_o_paris2024 cascade;
drop schema if exists kaggle_p_paris2024 cascade;

-- create schema
create schema kaggle_o_paris2024;
create schema kaggle_p_paris2024;

-- OLYMPICS DATASET

-- create table
CREATE TABLE kaggle_o_paris2024.athletes (
    code VARCHAR PRIMARY KEY,
    name TEXT,
    name_short TEXT,
    name_tv TEXT,
    gender TEXT,
    function TEXT,
    country_code TEXT,
    country TEXT,
    country_full TEXT,
    nationality TEXT,
    nationality_full TEXT,
    nationality_code TEXT,
    height DECIMAL,
    weight DECIMAL,
    disciplines TEXT,
    events TEXT,
    birth_date DATE,
    birth_place TEXT,
    birth_country TEXT,
    residence_place TEXT,
    residence_country TEXT,
    nickname TEXT,
    hobbies TEXT,
    occupation TEXT,
    education TEXT,
    family TEXT,
    lang TEXT,
    coach TEXT,
    reason TEXT,
    hero TEXT,
    influence TEXT,
    philosophy TEXT,
    sporting_relatives TEXT,
    ritual TEXT,
    other_sports TEXT
);

CREATE TABLE kaggle_o_paris2024.events (
    event TEXT,
    tag TEXT,
    sport TEXT,
    sport_code TEXT,
    sport_url TEXT
);

CREATE TABLE kaggle_o_paris2024.medallists (
    medal_date DATE,
    medal_type TEXT,
    medal_code INT,
    name TEXT,
    gender TEXT,
    country TEXT,
    country_code TEXT,
    nationality TEXT,
    team TEXT,
    team_gender TEXT,
    discipline TEXT,
    event TEXT,
    event_type TEXT,
    url_event TEXT,
    birth_date DATE,
    code TEXT
);

CREATE TABLE kaggle_o_paris2024.medals (
    medal_type TEXT,
    medal_code INT,
    medal_date DATE,
    name TEXT,
    country_code TEXT,
    gender TEXT,
    discipline TEXT,
    event TEXT,
    event_type TEXT,
    url_event TEXT,
    code TEXT
);

CREATE TABLE kaggle_o_paris2024.medals_total (
    country_code TEXT,
    gold_medal INT,
    silver_medal INT,
    bronze_medal INT,
    total INT
);

CREATE TABLE kaggle_o_paris2024.schedules_preliminary (
    date_start_utc TIMESTAMP WITH TIME ZONE,
    date_end_utc TIMESTAMP WITH TIME ZONE,
    estimated BOOLEAN,
    estimated_start BOOLEAN,
    start_text TEXT,
    medal TEXT,
    venue_code TEXT,
    description TEXT,
    venue_code_other TEXT,
    discription_other TEXT,
    team_1_code TEXT,
    team_1 TEXT,
    team_2_code TEXT,
    team_2 TEXT,
    tag TEXT,
    sport TEXT,
    sport_code TEXT,
    sport_url TEXT
);

CREATE TABLE kaggle_o_paris2024.schedules (
    start_date TIMESTAMP WITH TIME ZONE,
    end_date TIMESTAMP WITH TIME ZONE,
    day DATE,
    status TEXT,
    discipline TEXT,
    discipline_code TEXT,
    event TEXT,
    event_medal DECIMAL,
    phase TEXT,
    gender TEXT,
    event_type TEXT,
    venue TEXT,
    venue_code TEXT,
    location_description TEXT,
    location_code TEXT,
    url TEXT
);

CREATE TABLE kaggle_o_paris2024.teams (
    code TEXT,
    team TEXT,
    team_gender TEXT,
    country TEXT,
    country_full TEXT,
    country_code TEXT,
    discipline TEXT,
    disciplines_code TEXT,
    events TEXT,
    athletes TEXT,
    coaches TEXT,
    athletes_codes TEXT,
    num_athletes DECIMAL,
    coaches_codes TEXT,
    num_coaches DECIMAL
);

CREATE TABLE kaggle_o_paris2024.torch_route (
    title TEXT,
    city TEXT,
    date_start TIMESTAMP WITH TIME ZONE,
    date_end TIMESTAMP WITH TIME ZONE,
    tag TEXT,
    url TEXT,
    stage_number DECIMAL
);

CREATE TABLE kaggle_o_paris2024.venues (
    venue TEXT,
    sports TEXT[],
    date_start TIMESTAMP WITH TIME ZONE,
    date_end TIMESTAMP WITH TIME ZONE,
    tag TEXT,
    url TEXT
);

-- executed from evidence/sources/duckdb
-- copy csv file into table
copy kaggle_o_paris2024.athletes from 'sources/kaggle/o_paris2024/athletes.csv';
copy kaggle_o_paris2024.events from 'sources/kaggle/o_paris2024/events.csv';
copy kaggle_o_paris2024.medallists from 'sources/kaggle/o_paris2024/medallists.csv';
copy kaggle_o_paris2024.medals_total from 'sources/kaggle/o_paris2024/medals_total.csv';
copy kaggle_o_paris2024.medals from 'sources/kaggle/o_paris2024/medals.csv';
copy kaggle_o_paris2024.schedules_preliminary from 'sources/kaggle/o_paris2024/schedules_preliminary.csv';
copy kaggle_o_paris2024.schedules from 'sources/kaggle/o_paris2024/schedules.csv';
copy kaggle_o_paris2024.teams from 'sources/kaggle/o_paris2024/teams.csv';
copy kaggle_o_paris2024.torch_route from 'sources/kaggle/o_paris2024/torch_route.csv';
copy kaggle_o_paris2024.venues from 'sources/kaggle/o_paris2024/venues.csv';

-- PARALYMPICS DATASET

-- create table
CREATE TABLE kaggle_p_paris2024.athletes (
    code VARCHAR PRIMARY KEY,
    name TEXT,
    name_short TEXT,
    name_tv TEXT,
    gender TEXT,
    function TEXT,
    country_code TEXT,
    country TEXT,
    country_full TEXT,
    nationality TEXT,
    nationality_full TEXT,
    nationality_code TEXT,
    height DECIMAL,
    weight DECIMAL,
    disciplines TEXT,
    events TEXT,
    birth_date DATE,
    birth_place TEXT,
    birth_country TEXT,
    residence_place TEXT,
    residence_country TEXT,
    nickname TEXT,
    hobbies TEXT,
    occupation TEXT,
    education TEXT,
    family TEXT,
    lang TEXT,
    coach TEXT,
    reason TEXT,
    hero TEXT,
    influence TEXT,
    philosophy TEXT,
    sporting_relatives TEXT,
    ritual TEXT,
    other_sports TEXT
);

CREATE TABLE kaggle_p_paris2024.events_preliminary (
    event TEXT,
    tag TEXT,
    sport TEXT,
    sport_code TEXT,
    sport_url TEXT
);

CREATE TABLE kaggle_p_paris2024.medallists (
    medal_date DATE,
    medal_type TEXT,
    medal_code INT,
    name TEXT,
    gender TEXT,
    country TEXT,
    country_code TEXT,
    nationality TEXT,
    team TEXT,
    team_gender TEXT,
    discipline TEXT,
    event TEXT,
    event_type TEXT,
    url_event TEXT,
    birth_date DATE,
    code TEXT
);

CREATE TABLE kaggle_p_paris2024.medals (
    medal_type TEXT,
    medal_code INT,
    medal_date DATE,
    name TEXT,
    country_code TEXT,
    gender TEXT,
    discipline TEXT,
    event TEXT,
    event_type TEXT,
    url_event TEXT,
    code TEXT
);

CREATE TABLE kaggle_p_paris2024.medals_total (
    country_code TEXT,
    gold_medal INT,
    silver_medal INT,
    bronze_medal INT,
    total INT
);

CREATE TABLE kaggle_p_paris2024.schedules_preliminary (
    date_start_utc TIMESTAMP WITH TIME ZONE,
    date_end_utc TIMESTAMP WITH TIME ZONE,
    estimated BOOLEAN,
    estimated_start BOOLEAN,
    start_text TEXT,
    medal TEXT,
    venue_code TEXT,
    description TEXT,
    venue_code_other TEXT,
    discription_other TEXT,
    team_1_code TEXT,
    team_1 TEXT,
    team_2_code TEXT,
    team_2 TEXT,
    tag TEXT,
    sport TEXT,
    sport_code TEXT,
    sport_url TEXT
);

CREATE TABLE kaggle_p_paris2024.schedules (
    start_date TIMESTAMP WITH TIME ZONE,
    end_date TIMESTAMP WITH TIME ZONE,
    day DATE,
    status TEXT,
    discipline TEXT,
    discipline_code TEXT,
    event TEXT,
    event_medal DECIMAL,
    phase TEXT,
    gender TEXT,
    event_type TEXT,
    venue TEXT,
    venue_code TEXT,
    location_description TEXT,
    location_code TEXT,
    url TEXT
);

CREATE TABLE kaggle_p_paris2024.teams (
    code TEXT,
    team TEXT,
    team_gender TEXT,
    country TEXT,
    country_full TEXT,
    country_code TEXT,
    discipline TEXT,
    disciplines_code TEXT,
    events TEXT,
    athletes TEXT,
    coaches TEXT,
    athletes_codes TEXT,
    num_athletes DECIMAL,
    coaches_codes TEXT,
    num_coaches DECIMAL
);

CREATE TABLE kaggle_p_paris2024.torch_route (
    title TEXT,
    city TEXT,
    date_start TIMESTAMP WITH TIME ZONE,
    date_end TIMESTAMP WITH TIME ZONE,
    tag TEXT,
    url TEXT,
    stage_number DECIMAL
);

CREATE TABLE kaggle_p_paris2024.venues (
    venue TEXT,
    sports TEXT[],
    date_start TIMESTAMP WITH TIME ZONE,
    date_end TIMESTAMP WITH TIME ZONE,
    tag TEXT,
    url TEXT
);

-- executed from evidence/sources/duckdb
-- copy csv file into table
copy kaggle_p_paris2024.athletes from 'sources/kaggle/o_paris2024/athletes.csv';
copy kaggle_p_paris2024.events_preliminary from 'sources/kaggle/o_paris2024/events_preliminary.csv';
copy kaggle_p_paris2024.medallists from 'sources/kaggle/o_paris2024/medallists.csv';
copy kaggle_p_paris2024.medals_total from 'sources/kaggle/o_paris2024/medals_total.csv';
copy kaggle_p_paris2024.medals from 'sources/kaggle/o_paris2024/medals.csv';
copy kaggle_p_paris2024.schedules_preliminary from 'sources/kaggle/o_paris2024/schedules_preliminary.csv';
copy kaggle_p_paris2024.schedules from 'sources/kaggle/o_paris2024/schedules.csv';
copy kaggle_p_paris2024.teams from 'sources/kaggle/o_paris2024/teams.csv';
copy kaggle_p_paris2024.torch_route from 'sources/kaggle/o_paris2024/torch_route.csv';
copy kaggle_p_paris2024.venues from 'sources/kaggle/o_paris2024/venues.csv';