# Modern data stack

- mage.ai for orchestration and scheduling
- dbt for transformation
- motherduck as the datawarehouse
- evidence for the viz

# Data sources
- Kaggle olympic dataset

# List of commands I used to setup the project

## Mage.ai

Install mage.ai with Docker: docker pull mageai/mageai:latest

Deploy mage to AWS ECS with Terraform:

## dbt

## Motherduck

## Evidence.dev

# Commands executed

- `python -m venv paris2024`
- `source paris2024/bin/activate`
- `pip install -r requirements.txt`
- `cd scripts && python kaggle_dataset_downloader.py`
- `cd ../evidence/sources/duckdb && duckdb paris2024.duckdb < ../../../scripts/paris2024_duckdb_init.sql`