---
title: Medals map
queries:
  - athletes_paris2024: athletes_paris2024.sql
  - medals_paris2024: medals_paris2024.sql
  - medals_per_country_top10: medals_per_country_top10.sql
  - daily_medals_per_country_top10: daily_medals_per_country_top10.sql
  - medals_per_country_top10_sankey: medals_per_country_top10_sankey.sql
  - medals_total_paris2024: medals_total_paris2024.sql
---

<BubbleMap 
    data={medals_total_paris2024} 
    lat=latitude 
    long=longitude
    size=total_medal_count 
    value=total_medal_count 
    pointName=country
    height=700
    colorPalette={['pink','violet','blue','darkblue']}
/>