#!/bin/bash

curl -s https://data.zamzasalim.xyz/file/uploads/asclogo.sh
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
# cek command tersedia or tidak
check_command() {
    command -v "$1" >/dev/null 2>&1
}
# Install and update pkg
sudo apt-get update && sudo apt get upgrade -y
sudo apt install curl -y
clear

show "Install Docker..."
if ! source <(wget -O - https://raw.githubusercontent.com/anggasec28/modul/refs/heads/main/docker.sh); then
    show "Gagal install Docker." "error"
    exit 1
fi
show "Sukses install Docker!" "sukses"

# membuat folder
mkdir ocean && \
cd ocean

# clear ram
clear_ram_cache() {
    show "Membersihkan RAM cache..." "proses"
    sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    show "RAM sukses dibersihkan!"
}

# install binary
curl -O https://raw.githubusercontent.com/oceanprotocol/ocean-node/main/scripts/ocean-node-quickstart.sh
chmod +x ocean-node-quickstart.sh
./ocean-node-quickstart.sh

# start node
docker-compose up -d
