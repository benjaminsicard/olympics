import os
from kaggle.api.kaggle_api_extended import KaggleApi
from kaggle_auth import USERNAME, KEY, DATASET

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(*args, **kwargs):
    """
    Template code for loading data from any source.

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your data loading logic here

    return {}


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'



class KaggleDataExtractor:
    def __init__(self, username: str, key: str):
        self.username = username
        self.key = key

    def authenticate(self) -> None:
        os.environ['KAGGLE_USERNAME'] = self.username
        os.environ['KAGGLE_KEY'] = self.key

    def download_dataset(self, dataset, path) -> None:
        api = KaggleApi()
        api.authenticate()
        api.dataset_download_files(dataset, path=path, unzip=True)
        






import os
from kaggle.api.kaggle_api_extended import KaggleApi
from mage_ai.data_preparation.decorators import data_loader

@data_loader
def download_kaggle_dataset(dataset: str, path: str) -> None:
    """
    Downloads a dataset from Kaggle and unzips it to the specified path.
    
    Args:
        dataset (str): The Kaggle dataset identifier (e.g., 'zillow/zecon').
        path (str): The local path where the dataset will be downloaded and unzipped.
    """
    # Create the destination folder if it does not exist
    if not os.path.exists(path):
        os.makedirs(path)

    # Authenticate and download the dataset
    api = KaggleApi()
    api.authenticate()
    api.dataset_download_files(dataset, path=path, unzip=True)

    print(f'Dataset {dataset} downloaded and unzipped to {path}')




