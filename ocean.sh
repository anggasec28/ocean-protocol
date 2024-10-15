#!/bin/bash

curl -s https://raw.githubusercontent.com/anggasec28/logo/refs/heads/main/logo.sh | bash
sleep 5

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
PINK='\033[1;35m'


show() {
    case $2 in
        "error")
            echo -e "${PINK}${BOLD}❌ $1${NORMAL}"
            ;;
        "progress")
            echo -e "${PINK}${BOLD}⏳ $1${NORMAL}"
            ;;
        *)
            echo -e "${PINK}${BOLD}✅ $1${NORMAL}"
            ;;
    esac
}
