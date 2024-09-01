import kaggle
import os
import shutil

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
dataset = 'piterfm/tokyo-2020-paralympics'
download_path = '../sources/kaggle/p_tokyo2020'

# Download the dataset
download_kaggle_dataset(dataset, download_path)

###########################################################
# Move Tokyo 2020 data in correct folders

# Define source and destination folders
source_folder = "../sources/kaggle/p_tokyo2020/2020_Tokyo"
destination_folder = "../sources/kaggle/p_tokyo2020"

# Ensure the destination folder exists
os.makedirs(destination_folder, exist_ok=True)

# Iterate through all items in the source folder
for item in os.listdir(source_folder):
    source_path = os.path.join(source_folder, item)
    destination_path = os.path.join(destination_folder, item)
    
    # Move the item to the destination folder
    shutil.move(source_path, destination_path)
    print(f"Moved: {item}")

print("All contents have been moved successfully.")

###########################################################
# Move Paris 2024 data in correct folders

# Define source and destination folders
source_folder = "../sources/kaggle/p_tokyo2020/2024_Paris"
destination_folder = "../sources/kaggle/p_paris2024"

# Ensure the destination folder exists
os.makedirs(destination_folder, exist_ok=True)

# Iterate through all items in the source folder
for item in os.listdir(source_folder):
    source_path = os.path.join(source_folder, item)
    destination_path = os.path.join(destination_folder, item)
    
    # Move the item to the destination folder
    shutil.move(source_path, destination_path)
    print(f"Moved: {item}")

print("All contents have been moved successfully.")