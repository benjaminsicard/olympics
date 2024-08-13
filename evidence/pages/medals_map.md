---
title: Medals map
queries:
  - athletes_paris2024: athletes_paris2024.sql
  - medals_paris2024: medals_paris2024.sql
  - medals_per_country_top10: medals_per_country_top10.sql
  - daily_medals_per_country_top10: daily_medals_per_country_top10.sql
  - medals_per_country_top10_pivoted_order_by_gold: medals_per_country_top10_pivoted_order_by_gold.sql
  - medals_per_country_top10_pivoted_order_by_total: medals_per_country_top10_pivoted_order_by_total.sql
  - medals_total_paris2024_ordered_by_gold: medals_total_paris2024_ordered_by_gold.sql
  - medals_total_paris2024_ordered_by_total: medals_total_paris2024_ordered_by_total.sql
---

<BubbleMap 
    data={medals_total_paris2024_ordered_by_gold} 
    lat=latitude 
    long=longitude
    size=total_medal_count 
    value=total_medal_count 
    pointName=country
    height=700
    colorPalette={['pink','violet','blue','darkblue']}
/>