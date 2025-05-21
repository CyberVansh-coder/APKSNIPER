#!/bin/bash

echo "[*] Extracting APKSNIPER.7z file..."
if ! command -v 7z &> /dev/null; then
    echo "[!] 7z not installed! Install it with: sudo apt install p7zip-full"
    exit 1
fi

7z x APKSNIPER.7z

echo "[*] NOTE: PASSWORD IS -------> (PAID)"
echo "    Enter password manually when prompted."

cd APKSNIPER || { echo "[!] Extraction failed or folder missing."; exit 1; }

echo "[*] Creating virtual environment..."
python3 -m venv venv || { echo "[!] Python venv creation failed."; exit 1; }
source venv/bin/activate

echo "[*] Installing dependencies..."
pip install --upgrade pip
pip install pycryptodome

echo "[*] Making main.py executable..."
chmod +x main.py

echo "[*] Running APKSniper..."
python3 main.py
