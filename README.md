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
- Kaggle Paris 2024 Olympic dataset: https://www.kaggle.com/datasets/piterfm/paris-2024-olympic-summer-games/data
- Kaggle Tokyo 2020 + Paris 2024 Paralympic dataset: https://www.kaggle.com/datasets/piterfm/tokyo-2020-paralympics/data

# Commands to setup the project

- `python -m venv paris2024`
- `source paris2024/bin/activate`
- `pip install -r requirements.txt`
- `npm install @evidence-dev/duckdb`

# Commands to run the project

We're assuming that the project paris2024 lives in ~/Documents/projects

- `cd ~/Documents/projects/paris2024/scripts && python kaggle_dataset_downloader_o_paris2024.py && python kaggle_dataset_downloader_p_tokyo2020.py`
- `cd ~/Documents/projects/paris2024 && duckdb evidence/sources/duckdb/paris2024.duckdb < scripts/paris2024_duckdb_init.sql`
- `cd ~/Documents/projects/paris2024/dbt_paris2024 && dbt seed && dbt run`
- `cd ~/Documents/projects/paris2024/evidence && npm run sources && npm run dev`