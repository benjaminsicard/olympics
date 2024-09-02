---
title: Medals alternatives viz
sidebar_position: 2
queries:
  - medals_paris2024: p_paris2024_medals_paris2024.sql
  - daily_medals_per_country_top10: p_paris2024_daily_medals_per_country_top10.sql
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
</LineChart>

