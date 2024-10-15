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

show "Install Node..."
if ! source <(wget -O - https://raw.githubusercontent.com/anggasec28/modul/refs/heads/main/node.sh); then
    show "Gagal install Node." "error"
    exit 1
fi
show "Sukses install Node!" "sukses"

# membuat folder
show "Installing PM2" "progress"
npm install -g pm2

# clone github
show "Installing Repo Github"
git clone https://github.com/oceanprotocol/ocean-node.git

clear_ram_cache() {
    show "Membersihkan RAM cache..." "proses"
    sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    show "RAM sukses dibersihkan!"
}

#start
npm run envSetup
pm2 start npm --name "ocean" -- run start
