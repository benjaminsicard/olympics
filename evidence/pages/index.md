---
title: Paris 2024 Olympic Games
queries:
  - athletes_paris2024: athletes_paris2024.sql
  - medals_paris2024: medals_paris2024.sql
  - medals_per_country_top10: medals_per_country_top10.sql
  - daily_medals_per_country_top10: daily_medals_per_country_top10.sql
  - medals_per_country_top10_pivoted_order_by_gold: medals_per_country_top10_pivoted_order_by_gold.sql
  - medals_per_country_top10_pivoted_order_by_total: medals_per_country_top10_pivoted_order_by_total.sql
  - medals_total_paris2024_ordered_by_gold: medals_total_paris2024_ordered_by_gold.sql
  - medals_total_paris2024_ordered_by_total: medals_total_paris2024_ordered_by_total.sql
  - medals_total_paris2024: medals_total_paris2024.sql
---

# Medal table

<Dropdown name=medals_order_by>
    <DropdownOption valueLabel="Order by Gold medals" value="gold_medal_count" />
    <DropdownOption valueLabel="Order by Total medals" value="total_medal_count" />
</Dropdown>

<DataTable data={medals_total_paris2024} search=true>
  <Column id=flag contentType=image height=30px align=center />
	<Column id=country align=center />
	<Column id=gold_medal_count align=center title="Gold Medals" contentType=colorscale scaleColor=#FFD700 />
	<Column id=silver_medal_count align=center title="Silver Medals" contentType=colorscale scaleColor=#C0C0C0 />
  <Column id=bronze_medal_count align=center title="Bronze Medals" contentType=colorscale scaleColor=#CD7F32 />
	<Column id=total_medal_count align=center title="Total" />
</DataTable>