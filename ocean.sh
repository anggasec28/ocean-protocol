#!/bin/bash

curl -s https://data.zamzasalim.xyz/file/uploads/asclogo.sh | bash
sleep 5

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
YELLOW='\033[1;33m'
PINK='\033[1;35m'

show() {
    case $2 in
        "error")
            echo -e "${YELLOW}${BOLD}❌ $1${NORMAL}"
            ;;
        "progress")
            echo -e "${YELLOW}${BOLD}⏳ $1${NORMAL}"
            ;;
         "sukses")
            echo -e "${PINK}${BOLD}🆗 $1${NORMAL}"
            ;;   
        *)
            echo -e "${YELLOW}${BOLD}✅ $1${NORMAL}"
            ;;
    esac
}

# cek command tersedia atau tidak
check_command() {
    command -v "$1" >/dev/null 2>&1
}

# Install and update pkg
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install curl -y
clear

# Cek apakah Docker sudah terinstal
if check_command docker; then
    show "Docker sudah terinstal, melanjutkan ke langkah berikutnya..." "sukses"
else
    show "Install Docker..."
    if ! source <(wget -O - https://raw.githubusercontent.com/anggasec28/modul/refs/heads/main/docker.sh); then
        show "Gagal install Docker." "error"
        exit 1
    fi
    show "Sukses install Docker!" "sukses"
fi

# Cek apakah folder 'ocean' sudah ada, jika ada hapus dan unduh ulang repo
if [ -d "ocean" ]; then
    show "Folder 'ocean' sudah ada. Menghapus folder dan mengunduh ulang..." "progress"
    rm -rf ocean
    show "Folder 'ocean' berhasil dihapus." "sukses"
fi

# Membuat folder
mkdir ocean && \
cd ocean

# Install binary
curl -O https://raw.githubusercontent.com/oceanprotocol/ocean-node/main/scripts/ocean-node-quickstart.sh
chmod +x ocean-node-quickstart.sh
./ocean-node-quickstart.sh

# Clear RAM
clear_ram_cache() {
    show "Membersihkan RAM cache..." "progress"
    sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    show "RAM sukses dibersihkan!" "sukses"
}

# Start node
docker-compose up -d
