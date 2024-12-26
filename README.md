# Project Setup Guide

## Quick Setup (Automated)

Run the automated setup script:
```bash
chmod +x setup.sh
./setup.sh
```

## Manual Setup

1. Install Python3 and pip
2. Create and activate virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```


4. Download dataset:
```bash
kaggle datasets download tunguz/big-five-personality-test
unzip big-five-personality-test.zip
rm big-five-personality-test.zip
```

5. Deactivate environment when done:
```bash
deactivate
```

## Requirements
- Python3
- pip

## Troubleshooting
- Ensure Python3 and pip are installed
- Verify Kaggle API credentials are configured
- Check internet connection for dataset download