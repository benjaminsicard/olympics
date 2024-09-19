---
title: Relative age effect
sidebar_position: 3
queries:
  - o_paris2024_athletes_paris2024: o_paris2024_athletes_paris2024.sql
---

<!-- TODO: add a filter or filter by default on MALE athletes -->

```sql sport_dropdown
select distinct sport from ${o_paris2024_athletes_paris2024}
```
<Dropdown
    data={sport_dropdown} 
    name=sport
    value=sport
    title="Select a Sport"
>
    <DropdownOption value="%" valueLabel="All Sports"/>
</Dropdown>

```sql country_dropdown
select distinct country from ${o_paris2024_athletes_paris2024}
```
<Dropdown
    data={country_dropdown} 
    name=country
    value=country
    title="Select a Country"
>
    <DropdownOption value="%" valueLabel="All Countries"/>
</Dropdown>

# Athletes and medals by sport and country

```sql athletes_count_by_sport
select 
  sport,
  count(*) as athletes_count
from ${o_paris2024_athletes_paris2024}
group by sport
order by athletes_count desc
limit 10
```

<BarChart 
    data={athletes_count_by_sport}
    x=sport
    y=athletes_count
/>

```sql athletes_and_medals_by_sport_and_country
select 
  country,
  sport,
  count(*) as athletes_count,
  sum(total_medal_count) as total_medal_count
from ${o_paris2024_athletes_paris2024}
where sport like '${inputs.sport.value}' and country like '${inputs.country.value}'
group by country, sport
order by athletes_count desc, total_medal_count desc
```

<BarChart 
    data={athletes_and_medals_by_sport_and_country}
    x=country
    y=athletes_count
    y2=total_medal_count
/>

<DataTable data={athletes_and_medals_by_sport_and_country}>
	<Column id=country align=center />
	<Column id=sport align=center />
	<Column id=athletes_count align=center title="athletes" contentType=colorscale />
  <Column id=total_medal_count align=center title="medals" contentType=colorscale />
</DataTable>

# Histograms

```sql raw_data_filtered_by_sport
select *
from ${o_paris2024_athletes_paris2024}
where sport like '${inputs.sport.value}' and country like '${inputs.country.value}'
```

## Generic RAE
<Histogram 
    data={raw_data_filtered_by_sport} 
    x=birth_date 
    xAxisTitle="Birth date"
/>

# Bar charts

## RAE by birth month

```sql bar_chart_by_birth_month
with source as (
  select 
    date_part('month', birth_date) as birth_date_part,
    count(*) as athletes_count,
    sum(total_medal_count) as total_medal_count
  from ${o_paris2024_athletes_paris2024}
  where sport like '${inputs.sport.value}' and country like '${inputs.country.value}'
  group by birth_date_part
)
select
  *,
  case 
    when birth_date_part = 1 then 'January'
    when birth_date_part = 2 then 'February'
    when birth_date_part = 3 then 'March'
    when birth_date_part = 4 then 'April'
    when birth_date_part = 5 then 'May'
    when birth_date_part = 6 then 'June'
    when birth_date_part = 7 then 'July'
    when birth_date_part = 8 then 'August'
    when birth_date_part = 9 then 'September'
    when birth_date_part = 10 then 'October'
    when birth_date_part = 11 then 'November'
    when birth_date_part = 12 then 'December'
  end as birth_date_part_plain,
from source
order by birth_date_part asc
```

<BarChart 
    data={bar_chart_by_birth_month}
    x=birth_date_part_plain
    y=athletes_count
    y2=total_medal_count
    sort=false
/>

## RAE by birth quarter

```sql bar_chart_by_birth_quarter
with source as (
  select 
    date_part('quarter', birth_date) as birth_date_part,
    count(*) as athletes_count,
    sum(total_medal_count) as total_medal_count
  from ${o_paris2024_athletes_paris2024}
  where sport like '${inputs.sport.value}' and country like '${inputs.country.value}'
  group by birth_date_part
)
select
  *,
  case 
    when birth_date_part = 1 then 'Q1'
    when birth_date_part = 2 then 'Q2'
    when birth_date_part = 3 then 'Q3'
    when birth_date_part = 4 then 'Q4'
  end as birth_date_part_plain,
from source
order by birth_date_part asc
```

<BarChart 
    data={bar_chart_by_birth_quarter}
    x=birth_date_part_plain
    y=athletes_count
    y2=total_medal_count
    sort=false
/>

```sql pie_chart_by_birth_quarter
select 
  birth_date_part_plain as name,
  athletes_count as value
from ${bar_chart_by_birth_quarter}
order by birth_date_part_plain asc
```

<ECharts config={{
        tooltip: {
            formatter: '{b}: {c} ({d}%)'
        },
        series: [
        {
          type: 'pie',
          data: [...pie_chart_by_birth_quarter],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
        }
      ]
      }}
/>

## RAE by sport & birth quarter (sports with more than 1000 athletes)

```sql bar_chart_by_birth_quarter_and_sport
with source as (
  select 
    date_part('quarter', birth_date) as birth_date_part,
    sport,
    count(*) as athletes_count,
  from ${o_paris2024_athletes_paris2024}
  where sport like '${inputs.sport.value}' and country like '${inputs.country.value}'
  group by 1, 2
)
select
  *,
  case 
    when birth_date_part = 1 then 'Q1'
    when birth_date_part = 2 then 'Q2'
    when birth_date_part = 3 then 'Q3'
    when birth_date_part = 4 then 'Q4'
  end as birth_date_part_plain,
from source
order by birth_date_part asc
```

<BarChart 
    data={bar_chart_by_birth_quarter_and_sport}
    x=birth_date_part_plain
    y=athletes_count
    sort=false
    series=sport
    type=grouped
/>

# Calendar heatmap

```sql athletes_count_by_birth_day
with source as (
  select 
    date_part('month', birth_date) as birth_date_month,
    date_part('day', birth_date) as birth_date_day,
    count(*) as athletes_count,
    sum(total_medal_count) as total_medal_count
  from ${o_paris2024_athletes_paris2024}
  where sport like '${inputs.sport.value}' and country like '${inputs.country.value}'
  group by birth_date_month, birth_date_day
)
select 
  cast('2024-' || birth_date_month || '-' || birth_date_day as date) as birth_date,
  athletes_count,
  total_medal_count
from source

```

<CalendarHeatmap 
    data={athletes_count_by_birth_day}
    date=birth_date
    value=athletes_count
    title="Calendar Heatmap"
    subtitle="Daily Sales"
    yearLabel=false
/>

# Analytics

## Monthly deviation from average and median

```sql month_deviation_from_avg_median
with avg_median as (
  select avg(athletes_count) as avg_athletes_count,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY athletes_count) AS median_athletes_count
  from ${bar_chart_by_birth_month}
),
join_avg as (
  select 
    b.*,
    m.avg_athletes_count,
    m.median_athletes_count
  from ${bar_chart_by_birth_month} b
  join avg_median m on 1=1
),
deviation_from_min as (
  select 
    *,
    (athletes_count - avg_athletes_count) / avg_athletes_count as deviation_from_avg,
    (athletes_count - median_athletes_count) / median_athletes_count as deviation_from_median
  from join_avg
)
select *
from deviation_from_min
```

<BarChart 
    data={month_deviation_from_avg_median}
    x=birth_date_part_plain
    y={['deviation_from_avg','deviation_from_median']}
    yFmt=pct
    type=grouped
    sort=false
    chartAreaHeight=300
/>

## Quarterly deviation from average and median

```sql quarter_deviation_from_avg_median
with avg_median as (
  select avg(athletes_count) as avg_athletes_count,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY athletes_count) AS median_athletes_count
  from ${bar_chart_by_birth_quarter}
),
join_avg as (
  select 
    b.*,
    m.avg_athletes_count,
    m.median_athletes_count
  from ${bar_chart_by_birth_quarter} b
  join avg_median m on 1=1
),
deviation_from_min as (
  select 
    *,
    (athletes_count - avg_athletes_count) / avg_athletes_count as deviation_from_avg,
    (athletes_count - median_athletes_count) / median_athletes_count as deviation_from_median
  from join_avg
)
select *
from deviation_from_min
```

<BarChart 
    data={quarter_deviation_from_avg_median}
    x=birth_date_part_plain
    y={['deviation_from_avg','deviation_from_median']}
    yFmt=pct
    type=grouped
    sort=false
    chartAreaHeight=300
/>

