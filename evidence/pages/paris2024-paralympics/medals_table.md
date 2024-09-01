---
title: Medals table
sidebar_position: 1
---

# Medal table

```sql medals_total_paris2024
with source as (

    select * from duckdb_paris2024.medals_total_paris2024 
    where country is not null
    and dataset_type = 'paralympics' and dataset_year = 'paris2024'

)

from source order by ${inputs.medals_order_by.value} desc, gold_medal_count desc, silver_medal_count desc, bronze_medal_count desc
```

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