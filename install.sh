#!/bin/bash

echo "Cloning APKSniper repository..."
git clone https://github.com/CyberVansh-coder/APKSNIPER.git
cd APKSNIPER || { echo "Failed to enter directory."; exit 1; }

echo "Extracting APKSNIPER.7z file..."
if ! command -v 7z &> /dev/null
then
    echo "7z not found! Please install p7zip-full or p7zip."
    exit 1
fi

7z x APKSNIPER.7z

echo "Checking password..."
echo "PASSWORD IS -------> (PAID)"
echo "Enter password manually in 7z prompt."

cd APKSNIPER || { echo "Failed to enter APKSNIPER directory."; exit 1; }

echo "Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "Installing dependencies..."
pip install pycryptodome

echo "Making main.py executable..."
chmod +x main.py

echo "Launching APKSniper..."
python3 main.py