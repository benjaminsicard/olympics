---
title: Medals map
sidebar_position: 4
queries:
  - medals_total_paris2024: o_paris2024_medals_total_paris2024.sql
---

<Dropdown name=medals_order_by>
    <DropdownOption valueLabel="Order by Gold medals" value="gold_medal_count" />
    <DropdownOption valueLabel="Order by Total medals" value="total_medal_count" />
</Dropdown>

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