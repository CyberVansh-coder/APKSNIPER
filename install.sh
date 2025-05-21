#!/bin/bash

echo "[*] Cloning APKSniper from GitHub..."
git clone https://github.com/CyberVansh-coder/APKSNIPER.git || { echo "[!] Clone failed!"; exit 1; }

cd APKSNIPER || { echo "[!] Cannot find APKSNIPER folder."; exit 1; }

# Check 7z installed
if ! command -v 7z &> /dev/null; then
    echo "[!] 7z not found! Install using: sudo apt install p7zip-full"
    exit 1
fi

# Extracting 7z archive
echo "[*] Extracting APKSNIPER.7z..."
7z x APKSNIPER.7z

echo "[*] NOTE: PASSWORD IS -------> (PAID)"
echo "      Manually enter password if prompted"

# Second CD after extraction
cd APKSNIPER || { echo "[!] Second-level APKSNIPER folder not found."; exit 1; }

# Python virtual environment
echo "[*] Setting up Python environment..."
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install pycryptodome

# Fix missing module
if [ ! -f modules/smali_injector.py ]; then
    echo "[*] Creating missing module: modules/smali_injector.py"
    mkdir -p modules
    cat <<EOF > modules/smali_injector.py
def inject_smali_loader(smali_dir):
    print(f"[+] Injecting smali loader into directory: {smali_dir}")
    # Yahan aap actual smali code injection ka logic likh sakte hain
    return True
EOF
fi

# Ensure __init__.py
touch modules/__init__.py

# Permissions and run
chmod +x main.py
echo "[*] Running APKSniper..."
python3 main.py
