import kaggle
import os

def download_kaggle_dataset(dataset, download_path):
    # Ensure the download path exists
    os.makedirs(download_path, exist_ok=True)
    
    # Initialize Kaggle API
    api = kaggle.api
    
    # Download the dataset
    try:
        api.dataset_download_files(dataset, path=download_path, unzip=True)
        print(f"Dataset {dataset} downloaded successfully to {download_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Define the dataset and download path
dataset = 'piterfm/paris-2024-olympic-summer-games'
download_path = '../sources/kaggle'

# Download the dataset
download_kaggle_dataset(dataset, download_path)