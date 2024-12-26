#!/bin/bash

# Check if Python and pip are installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Please install it before running this script."
    exit
fi

if ! command -v pip &> /dev/null
then
    echo "pip not found. Please install it before running this script."
    exit
fi

# Create a virtual environment called "venv"
echo "Creating virtual environment 'venv'..."
python3 -m venv venv

# Activate the virtual environment
echo "Activating the virtual environment..."
source venv/bin/activate

# Install packages from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
else
    echo "requirements.txt file not found. Skipping dependency installation."
fi

# Check if Kaggle CLI is installed
if ! command -v kaggle &> /dev/null
then
    echo "Kaggle CLI not found. Please install it using 'pip install kaggle'."
    deactivate
    exit
fi

# Download the dataset from Kaggle
echo "Downloading dataset 'tunguz/big-five-personality-test'..."
kaggle datasets download tunguz/big-five-personality-test

# Check if the download was successful and extract the ZIP file
if [ -f "big-five-personality-test.zip" ]; then
    echo "Extracting big-five-personality-test.zip..."
    unzip big-five-personality-test.zip
    echo "Removing ZIP file..."
    rm big-five-personality-test.zip
else
    echo "ZIP file not found. Something went wrong with the download."
fi

# Deactivate the virtual environment
echo "Deactivating the virtual environment..."
deactivate

echo "Setup completed!"
