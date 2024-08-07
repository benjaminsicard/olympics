# Modern data stack infrastructure

## Actual implementation
- python script to fetch the kaggle dataset
- duckdb as the datawarehouse
- dbt for transformation
- evidence for the app

## Target implementation
- mage.ai / dlthub / dagster / prefect / kestra for the EL and orchestration
- motherduck as the datawarehouse for collaboration
- dbt for transformation
- evidence for the viz

# Data sources
- Kaggle olympic dataset: https://www.kaggle.com/datasets/piterfm/paris-2024-olympic-summer-games/data

# Commands to setup the project

- `python -m venv paris2024`
- `source paris2024/bin/activate`
- `pip install -r requirements.txt`
- `npm install @evidence-dev/duckdb`

# Commands to run the project

We're assuming that the project paris2024 lives in ~/Documents/projects

- `cd ~/Documents/projects/paris2024/scripts && python kaggle_dataset_downloader.py`
- `cd ~/Documents/projects/paris2024 && duckdb evidence/sources/duckdb/paris2024.duckdb < scripts/paris2024_duckdb_init.sql`
- `cd ~/Documents/projects/paris2024/dbt_paris2024 && dbt seed && dbt run`
- `cd ~/Documents/projects/paris2024/evidence && npm run sources && npm run dev`