---
title: French athletes map
queries:
  - french_departments_paris2024_not_null: french_departments_paris2024_not_null.sql
  - athletes_paris2024_filtered_by_french_departments_area_map: athletes_paris2024_filtered_by_french_departments_area_map.sql
---

# Birth department of Paris 2024 French athletes

```sql athletes_and_medals_mapped_correctly_percent
select 
  count(*) filter (where department_code is not null) / count(*) AS athletes_mapped_correctly_percent,
  sum(total_medal_count) filter (where department_code is not null) / sum(total_medal_count) AS medals_mapped_correctly_percent
from duckdb_paris2024.athletes_paris2024
where country_code = 'FRA'
```

<BigValue 
  data={athletes_and_medals_mapped_correctly_percent} 
  value=athletes_mapped_correctly_percent
  fmt=pct
  title="French athletes mapped"
/>
<BigValue 
  data={athletes_and_medals_mapped_correctly_percent} 
  value=medals_mapped_correctly_percent
  fmt=pct
  title="French medals mapped"
/>

<Grid cols=2 gapSize=sm>

  <AreaMap 
    data={french_departments_paris2024_not_null} 
    areaCol=department_code
    geoJsonUrl='https://raw.githubusercontent.com/gregoiredavid/france-geojson/5d34ee6d0140c29f785fdb047d9329f1aab58833/departements-version-simplifiee.geojson'
    geoId=code
    value=total_medal_count
    name=french_departments_area_map
    height=500
    colorPalette={['pink', 'violet','blue','darkblue']}
    min=0
    max=10
    borderWidth=0.75
    borderColor=darkblue
    opacity=1
    selectedColor=red
    selectedBorderWidth=1
    selectedBorderColor=black
    selectedOpacity=1
    showTooltip=true
    tooltipType=hover
    tooltip={[
      {id: 'department_name', fmt: 'id', showColumnName: false},
      {id: 'total_medal_count', title: 'Medals', fmt: 'id', showColumnName: true}
    ]}
  />

  <Grid cols=2 gapSize=sm>

      <AreaMap 
        data={french_departments_paris2024_not_null} 
        areaCol=department_code
        geoJsonUrl='/geojson/guadeloupe.geojson'
        geoId=code
        value=total_medal_count
        name=french_departments_area_map
        height=100
        colorPalette={['pink', 'violet','blue','darkblue']}
        min=0
        max=10
        borderWidth=0.75
        borderColor=darkblue
        opacity=1
        selectedColor=red
        selectedBorderWidth=1
        selectedBorderColor=black
        selectedOpacity=1
        showTooltip=true
        tooltipType=hover
        tooltip={[
          {id: 'department_name', fmt: 'id', showColumnName: false},
          {id: 'total_medal_count', title: 'Medals', fmt: 'id', showColumnName: true}
        ]}
      />

      <AreaMap 
        data={french_departments_paris2024_not_null} 
        areaCol=department_code
        geoJsonUrl='/geojson/martinique.geojson'
        geoId=code
        value=total_medal_count
        name=french_departments_area_map
        height=100
        colorPalette={['pink', 'violet','blue','darkblue']}
        min=0
        max=10
        borderWidth=0.75
        borderColor=darkblue
        opacity=1
        selectedColor=red
        selectedBorderWidth=1
        selectedBorderColor=black
        selectedOpacity=1
        showTooltip=true
        tooltipType=hover
        tooltip={[
          {id: 'department_name', fmt: 'id', showColumnName: false},
          {id: 'total_medal_count', title: 'Medals', fmt: 'id', showColumnName: true}
        ]}
      />

      <AreaMap 
        data={french_departments_paris2024_not_null} 
        areaCol=department_code
        geoJsonUrl='/geojson/guyane.geojson'
        geoId=code
        value=total_medal_count
        name=french_departments_area_map
        height=100
        colorPalette={['pink', 'violet','blue','darkblue']}
        min=0
        max=10
        borderWidth=0.75
        borderColor=darkblue
        opacity=1
        selectedColor=red
        selectedBorderWidth=1
        selectedBorderColor=black
        selectedOpacity=1
        showTooltip=true
        tooltipType=hover
        tooltip={[
          {id: 'department_name', fmt: 'id', showColumnName: false},
          {id: 'total_medal_count', title: 'Medals', fmt: 'id', showColumnName: true}
        ]}
      />

      <AreaMap 
        data={french_departments_paris2024_not_null} 
        areaCol=department_code
        geoJsonUrl='/geojson/lareunion.geojson'
        geoId=code
        value=total_medal_count
        name=french_departments_area_map
        height=100
        colorPalette={['pink', 'violet','blue','darkblue']}
        min=0
        max=10
        borderWidth=0.75
        borderColor=darkblue
        opacity=1
        selectedColor=red
        selectedBorderWidth=1
        selectedBorderColor=black
        selectedOpacity=1
        showTooltip=true
        tooltipType=hover
        tooltip={[
          {id: 'department_name', fmt: 'id', showColumnName: false},
          {id: 'total_medal_count', title: 'Medals', fmt: 'id', showColumnName: true}
        ]}
      />

      <AreaMap 
        data={french_departments_paris2024_not_null} 
        areaCol=department_code
        geoJsonUrl='/geojson/mayotte.geojson'
        geoId=code
        value=total_medal_count
        name=french_departments_area_map
        height=100
        colorPalette={['pink', 'violet','blue','darkblue']}
        min=0
        max=10
        borderWidth=0.75
        borderColor=darkblue
        opacity=1
        selectedColor=red
        selectedBorderWidth=1
        selectedBorderColor=black
        selectedOpacity=1
        showTooltip=true
        tooltipType=hover
        tooltip={[
          {id: 'department_name', fmt: 'id', showColumnName: false},
          {id: 'total_medal_count', title: 'Medals', fmt: 'id', showColumnName: true}
        ]}
      />
  
  </Grid>
    
</Grid>

<DataTable data={athletes_paris2024_filtered_by_french_departments_area_map} search=true totalRow=true>

  <Column id=athlete_name align=center title="Athlete" />
  <Column id=gender align=center title="Gender" />
  <Column id=disciplines align=center title="Disciplines" />
	<Column id=gold_medal_count align=center title="Gold Medals" contentType=colorscale scaleColor=#FFD700 />
	<Column id=silver_medal_count align=center title="Silver Medals" contentType=colorscale scaleColor=#C0C0C0 />
  <Column id=bronze_medal_count align=center title="Bronze Medals" contentType=colorscale scaleColor=#CD7F32 />
	<Column id=total_medal_count align=center title="Total" />
  <Column id=athlete_url contentType=link linkLabel="Details →" />
</DataTable>