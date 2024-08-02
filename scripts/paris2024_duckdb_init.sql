set timezone = 'UTC';
-- drop table first
drop table if exists athletes;
drop table if exists events;
drop table if exists medallists;
drop table if exists medals_total;
drop table if exists medals;
drop table if exists schedules_preliminary;
drop table if exists schedules;
drop table if exists teams;
drop table if exists torch_route;
drop table if exists venues;
drop schema if exists kaggle_paris2024;

create schema kaggle_paris2024;

-- create table
CREATE TABLE athletes (
    code INT PRIMARY KEY,
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

CREATE TABLE events (
    event TEXT,
    tag TEXT,
    sport TEXT,
    sport_code TEXT,
    sport_url TEXT
);

CREATE TABLE medallists (
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
    code INT
);

CREATE TABLE medals (
    medal_type TEXT,
    medal_code INTEGER,
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

CREATE TABLE medals_total (
    country_code TEXT,
    gold_medal DECIMAL,
    silver_medal DECIMAL,
    bronze_medal DECIMAL,
    total DECIMAL
);

CREATE TABLE schedules_preliminary (
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

CREATE TABLE schedules (
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

CREATE TABLE teams (
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

CREATE TABLE torch_route (
    title TEXT,
    city TEXT,
    date_start TIMESTAMP WITH TIME ZONE,
    date_end TIMESTAMP WITH TIME ZONE,
    tag TEXT,
    url TEXT,
    stage_number DECIMAL
);

CREATE TABLE venues (
    venue TEXT,
    sports TEXT[],
    date_start TIMESTAMP WITH TIME ZONE,
    date_end TIMESTAMP WITH TIME ZONE,
    tag TEXT,
    url TEXT
);

-- executed from evidence/sources/duckdb
-- copy csv file into table
copy athletes from '../../../sources/kaggle/athletes.csv';
copy events from '../../../sources/kaggle/events.csv';
copy medallists from '../../../sources/kaggle/medallists.csv';
copy medals_total from '../../../sources/kaggle/medals_total.csv';
copy medals from '../../../sources/kaggle/medals.csv';
copy schedules_preliminary from '../../../sources/kaggle/schedules_preliminary.csv';
copy schedules from '../../../sources/kaggle/schedules.csv';
copy teams from '../../../sources/kaggle/teams.csv';
copy torch_route from '../../../sources/kaggle/torch_route.csv';
copy venues from '../../../sources/kaggle/venues.csv';