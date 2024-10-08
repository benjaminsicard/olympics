---
title: Medals alternatives viz
sidebar_position: 3
queries:
  - athletes_paris2024: o_paris2024_athletes_paris2024.sql
  - medals_paris2024: o_paris2024_medals_paris2024.sql
  - medals_per_country_top10: o_paris2024_medals_per_country_top10.sql
  - daily_medals_per_country_top10: o_paris2024_daily_medals_per_country_top10.sql
  - medals_per_country_top10_pivoted_order_by_gold: o_paris2024_medals_per_country_top10_pivoted_order_by_gold.sql
  - medals_per_country_top10_pivoted_order_by_total: o_paris2024_medals_per_country_top10_pivoted_order_by_total.sql
---

# Daily cumulative medals count - top 10 countries

<LineChart
  data={daily_medals_per_country_top10}
  x=medalled_at
  y=total_medal_cumulative_count
  series=country
  yAxisTitle="medals"
  yAxisLabels=true
  labels=true
  labelSize=11
  labelPosition=above
  markers=true
  markerShape=circle
  markerSize=8
  chartAreaHeight=500 
  colorPalette={
        [
        '#0072BB',
        '#FFD700',
        '#000000',
        '#00A651',
        '#FF3D00',
        '#A4C8E1',
        '#F9E79F',
        '#7D7D7D',
        '#B2E0B2',
        '#FFB3B3',
        ]
    }
>
<ReferenceArea xMin='2024-08-02' xMax='2024-08-03' label="Athletics start" color=yellow/>
</LineChart>

# Country to medal type flow

<SankeyDiagram 
    data={medals_per_country_top10_pivoted_order_by_gold} 
    sourceCol= country
    targetCol = medal_type
    valueCol= medal_count
    linkLabels=value
    nodeLabels=full
    linkColor=source
    chartAreaHeight=500
    colorPalette={
        [
        '#0072BB',
        '#FFD700',
        '#C0C0C0',
        '#CD7F32',
        '#FFD700',
        '#000000',
        '#00A651',
        '#FF3D00',
        '#A4C8E1',
        '#F9E79F',
        '#7D7D7D',
        '#B2E0B2',
        '#FFB3B3',
        ]
    }
/>

# Let's try some horizontal bar charts

## Stacked per country - top 10

<BarChart 
    data={medals_per_country_top10_pivoted_order_by_gold}
    x=country
    y=medal_count
    series=medal_type
    swapXY=true
    labels=true
    sort=false
    fillOpacity=1
    chartAreaHeight=500
    colorPalette={
        [
        '#FFD700',
        '#C0C0C0',
        '#CD7F32',
        ]
    }
/>

## Stacked 100% per country - top 10

<BarChart 
    data={medals_per_country_top10_pivoted_order_by_gold}
    x=country
    y=medal_count
    series=medal_type
    swapXY=true
    type=stacked100
    labels=true
    sort=false
    fillOpacity=1
    chartAreaHeight=500
    colorPalette={
        [
        '#FFD700',
        '#C0C0C0',
        '#CD7F32',
        ]
    }
/>

## Stacked per medal type - top 10 countries

<BarChart 
    data={medals_per_country_top10_pivoted_order_by_gold}
    x=medal_type
    y=medal_count
    series=country
    swapXY=true
    labels=true
    sort=false
    fillOpacity=1
    chartAreaHeight=500
    colorPalette={
        [
        '#0072BB',
        '#FFD700',
        '#000000',
        '#00A651',
        '#FF3D00',
        '#A4C8E1',
        '#F9E79F',
        '#7D7D7D',
        '#B2E0B2',
        '#FFB3B3',
        ]
    }
/>

## Stacked 100% per medal type - top 10 countries

<BarChart 
    data={medals_per_country_top10_pivoted_order_by_gold}
    x=medal_type
    y=medal_count
    series=country
    swapXY=true
    type=stacked100
    labels=true
    sort=false
    fillOpacity=1
    chartAreaHeight=500
    colorPalette={
        [
        '#0072BB',
        '#FFD700',
        '#000000',
        '#00A651',
        '#FF3D00',
        '#A4C8E1',
        '#F9E79F',
        '#7D7D7D',
        '#B2E0B2',
        '#FFB3B3',
        ]
    }
/>