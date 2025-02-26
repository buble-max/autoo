#!/bin/bash
#SlowDNS @PowerMX
# Definir variables para colores de texto
IP=$(curl -s -4 icanhazip.com)
HOST=`hostname`;
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
GRAY='\033[1;37m'
WHITE='\033[1;37m'
# Definir variables para colores de fondo
BG_RED='\033[0;41m'
BG_GREEN='\033[0;42m'
BG_YELLOW='\033[0;43m'
BG_BLUE='\033[0;44m'
BG_PURPLE='\033[0;45m'
BG_CYAN='\033[0;46m'
BG_GRAY='\033[0;47m'
# Resetear colores
RESET='\033[0m'
slowdns () {
tput reset
echo -e "${GRAY}[${RED}-${GRAY}]${RED} ───────────────── /// ────────────────── ${YELLOW}"
figlet -p -f slant SlowDNS
echo -e "${GRAY}[${RED}-${GRAY}]${RED} ────────── Mod SlowDNS Masbro ───────── ${YELLOW}"
echo -e "${GRAY}[${RED}-${GRAY}]${RED} ──          Create: RIfki          ── ${YELLOW}"
echo -e "${GRAY}[${RED}-${GRAY}]${RED} ──              @rifkimaulana._._              ── ${YELLOW}"
echo -e "${GRAY}[${RED}-${GRAY}]${RED} ───────────────── /// ────────────────── ${RESET}"
echo -e "${YELLOW}SERVER IP: ${WHITE}$IP\033[0m "
echo -e "${YELLOW}HOSTNAME: ${WHITE}$HOST\033[0m "
archivo="/etc/slowdns/infons"
if [ -e "$archivo" ]; then
    echo -ne "${YELLOW}YOUR NS: ${WHITE} " && cat /etc/slowdns/infons
    echo -ne "${YELLOW}YOUR PUBLIC KEY:\033[0m " && cat /root/server.pub
else
    echo -e "${RED}Not Installed\033[0m"
fi
echo -e "${GRAY}[${RED}-${GRAY}]${RED} ───────────────── /// ────────────────── ${YELLOW}"
    echo -e "${YELLOW}[${GREEN}01${YELLOW}]${WHITE} | Install SlowDNS SSH"
    echo -e "${YELLOW}[${GREEN}02${YELLOW}]${WHITE} | Install SlowDNS SSL"
    echo -e "${YELLOW}[${GREEN}03${YELLOW}]${WHITE} | Install SlowDNS DROPBEAR"
    echo -e "${YELLOW}[${GREEN}04${YELLOW}]${WHITE} | Install SlowDNS SOCKS"
    echo -e "${YELLOW}[${GREEN}05${YELLOW}]${WHITE} | Install SlowDNS Custom Service"
    echo -e "${YELLOW}[${GREEN}06${YELLOW}]${WHITE} | See information"
    echo -e "${YELLOW}[${GREEN}07${YELLOW}]${WHITE} | Start SlowDNS"
    echo -e "${YELLOW}[${GREEN}08${YELLOW}]${WHITE} | RESTART SlowDNS"
    echo -e "${YELLOW}[${GREEN}09${YELLOW}]${WHITE} | STOP SlowDNS"
    echo -e "${YELLOW}[${GREEN}10${YELLOW}]${WHITE} | Remove SlowDNS"
    echo -e "${YELLOW}[${GREEN}11${YELLOW}]${WHITE} | Update/Reinstall"
    echo -e "${YELLOW}[${GREEN}12${YELLOW}]${WHITE} | Remove Script"
    echo -e "${YELLOW}[${GREEN}00${YELLOW}]${WHITE} | EXIT"
    echo ""
    echo -ne "${YELLOW}What do you want to do?:\0033[m " && read option
    case $option in
    1) Option1 ;;
    2) Option2 ;;
    3) Option3 ;;
    4) Option4 ;;
    5) Option5 ;;
    6) Option6 ;;
    7) Option7 ;;
    8) Option8 ;;
    9) Option9 ;;
    10) Option10 ;;
    11) Option11 ;;
    12) Option12 ;;
    0) Sair ;;
    *) "Invalid option" ; echo ; slowdns ;;
    esac
    }

Option1 () {
    clear
    bash /etc/slowdns/slowdns-ssh
    slowdns
}

Option2 () {
    clear
    bash /etc/slowdns/slowdns-ssl
    slowdns
}

Option3 () {
    clear
    bash /etc/slowdns/slowdns-drop
    slowdns
}

Option4 () {
    clear
    bash /etc/slowdns/slowdns-socks
}

Option5 () {
    clear
    bash /etc/slowdns/slowdns-customservice
    slowdns
}


Option6 () {
    clear
    bash /etc/slowdns/slowdns-info
}

Option7 () {
    clear
    bash /etc/slowdns/startdns
    echo -e "\033[1;33m › PRESS ENTER TO CONTINUE\033[0m"
    read -p " "
    slowdns
}

Option8 () {
    clear
    bash /etc/slowdns/restartdns
    echo -e "\033[1;33m › PRESS ENTER TO CONTINUE\033[0m"
    read -p " "
    slowdns
}

Option9 () {
    clear
    bash /etc/slowdns/stopdns
    echo -e "\033[1;33m › PRESS ENTER TO CONTINUE\033[0m"
    read -p " "
    slowdns
}

Option10 () {
     clear
    bash /etc/slowdns/stopdns
    bash /etc/slowdns/remove-slow
    echo -e "\033[1;33m › PRESS ENTER TO CONTINUE\033[0m"
    read -p " "
    menu
}

Option11 () {
    clear
    wget https://raw.githubusercontent.com/powermx/dnstt/main/update
    chmod +x update
    bash update
}

Option12 () {
     clear
    bash /etc/slowdns/remove-slow
    echo -e "\033[0;31mSlowDNS Manager Uninstalled!\033[0m"
    sleep 3
    rm /bin/slowdns
    echo -e "\033[1;33m › PRESS ENTER TO CONTINUE\033[0m"
    read -p " "
    menu
}

Sair() {
    clear
    menu
}
clear
slowdns

