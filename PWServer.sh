#!/bin/bash
script_version="1.7.8"

# Perfect World Server Script
# Author: Halyson Cesar
# Git: https://github.com/halysondev/PWServerInstallScript

# Script Information
remote_script_url="https://raw.githubusercontent.com/halysondev/PWServerInstallScript/main/PWServer.sh" # URL for updates
local_script_path="${BASH_SOURCE[0]}" # Path to the current script
temp_script_path="/tmp/PWServer.sh" # Temporary path for downloads
auto_update="${PW_AUTO_UPDATE:-true}" # Auto-update toggle (set to false to disable auto updates)

# Configuration
ServerDir="${PW_SERVER_DIR:-PWServer}" # Directory for server files and logs

PW_PORT_1="${PW_PORT_1:-29000}"
PW_PORT_2="${PW_PORT_1:-29001}"
PW_PORT_3="${PW_PORT_1:-29002}"
PW_PORT_4="${PW_PORT_1:-29003}"

PW_START_GAMED="${PW_START_GAMED:-true}"

PW_START_GLINKD_1="${PW_START_GLINKD_1:-true}"
PW_START_GLINKD_2="${PW_START_GLINKD_2:-true}"
PW_START_GLINKD_3="${PW_START_GLINKD_3:-true}"
PW_START_GLINKD_4="${PW_START_GLINKD_4:-true}"

PW_START_GAMEDBD="${PW_START_GAMEDBD:-true}"
PW_START_GFACTIOND="${PW_START_GFACTIOND:-true}"
PW_START_GACD="${PW_START_GACD:-true}"
PW_START_GDELIVERYD="${PW_START_GDELIVERYD:-true}"
PW_START_GAUTHD="${PW_START_GAUTHD:-true}"
PW_START_UNIQUENAMED="${PW_START_UNIQUENAMED:-true}"
PW_START_LOGSERVICE="${PW_START_LOGSERVICE:-true}"


DB_HOST="${PW_DB_HOST:-10.0.0.1}"
DB_USER="${PW_DB_USER:-root}"
DB_PASSWORD="${PW_DB_PASSWORD:-1}"
DB_NAME="${PW_DB_NAME:-pw}"

EXTERNAL_BACKUP="${PW_EXTERNAL_BACKUP:-true}"

SSH_PASS="${PW_BACKUP_SSH_PASS:-1}"
SSH_USER="${PW_BACKUP_SSH_USER:-root}"
SSH_HOST="${PW_BACKUP_SSH_HOST:-10.0.0.2}"

BACKUP_DIR="${PW_BACKUP_DIR:-/PWStorage/backup}"
LOG_DIR="${PW_BACKUP_LOG_DIR:-/PWStorage/logs}"
STORAGE_DIR="${PW_BACKUP_STORAGE_DIR:-/PWStorage}"

# Retention period in days
RETENTION_DAYS="${PW_BACKUP_RETENTION_DAYS:-5}"

# Date format for backup naming
today=$(date "+%F_%H.%M")

# Color Codes for Console Output
txtred=$(tput setaf 1) # Red
txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtnrm=$(tput sgr0)    # Reset to normal

#####ENVIROMENT VARIABLES#####
# PW_AUTO_UPDATE: Auto-update toggle (set to false to disable auto updates)
# PW_SERVER_DIR: Directory for server files and logs
# PW_PORT_1: Port 1 for server
# PW_PORT_2: Port 2 for server
# PW_PORT_3: Port 3 for server
# PW_PORT_4: Port 4 for server
# PW_DB_HOST: Database host
# PW_DB_USER: Database user
# PW_DB_PASSWORD: Database password
# PW_DB_NAME: Database name
# PW_EXTERNAL_BACKUP: External backup toggle (set to true to enable external backups)
# PW_BACKUP_SSH_PASS: SSH password
# PW_BACKUP_SSH_USER: SSH user
# PW_BACKUP_SSH_HOST: SSH host
# PW_BACKUP_DIR: Backup directory
# PW_BACKUP_LOG_DIR: Backup log directory
# PW_BACKUP_STORAGE_DIR: Backup storage directory
# PW_BACKUP_RETENTION_DAYS: Retention period in days
# PW_START_GAMED: Start GAMED service
# PW_START_GLINKD_1: Start GLINKD service 1
# PW_START_GLINKD_2: Start GLINKD service 2
# PW_START_GLINKD_3: Start GLINKD service 3
# PW_START_GLINKD_4: Start GLINKD service 4
# PW_START_GAMEDBD: Start GAMEDBD service
# PW_START_GFACTIOND: Start GFACTIOND service
# PW_START_GACD: Start GACD service
# PW_START_GDELIVERYD: Start GDELIVERYD service
# PW_START_GAUTHD: Start GAUTHD service
# PW_START_UNIQUENAMED: Start UNIQUENAMED service
# PW_START_LOGSERVICE: Start LOGSERVICE service

# TO SAVE THE ENVIRONMENT VARIABLES, YOU CAN EDIT .bashrc FILE WITH NANO
# nano ~/.bashrc
# AND ADD THE FOLLOWING LINES
#PWSERVER CONFIG
#AUTO UPDATE
# export PW_AUTO_UPDATE="true"
#DIR
# export PW_SERVER_DIR="PWServer"
#EXTERNAL PORTS
# export PW_PORT_1="29000"
# export PW_PORT_2="29001"
# export PW_PORT_3="29002"
# export PW_PORT_4="29003"
#START
# export PW_START_GAMED="true"
# export PW_START_GLINKD_1="true"
# export PW_START_GLINKD_2="true"
# export PW_START_GLINKD_3="true"
# export PW_START_GLINKD_4="true"
# export PW_START_GAMEDBD="true"
# export PW_START_GFACTIOND="true"
# export PW_START_GACD="true"
# export PW_START_GDELIVERYD="true"
# export PW_START_GAUTHD="true"
# export PW_START_UNIQUENAMED="true"
# export PW_START_LOGSERVICE="true"
#BACKUP
# export PW_DB_HOST="127.0.0.1"
# export PW_DB_USER="root"
# export PW_DB_PASSWORD="1"
# export PW_DB_NAME="pw"
# export PW_EXTERNAL_BACKUP="false"
# export PW_BACKUP_SSH_PASS="1"
# export PW_BACKUP_SSH_USER="root"
# export PW_BACKUP_SSH_HOST="127.0.0.1"
# export PW_BACKUP_DIR="/PWStorage/backup"
# export PW_BACKUP_LOG_DIR="/PWStorage/logs"
# export PW_BACKUP_STORAGE_DIR="/PWStorage"
# export PW_BACKUP_RETENTION_DAYS="5"
# AND THEN RELOAD THE .bashrc FILE
# source ~/.bashrc

# to set the environment variables, you can use the export command
# example: 
#PWSERVER CONFIG
#AUTO UPDATE
# export PW_AUTO_UPDATE="true"
#DIR
# export PW_SERVER_DIR="PWServer"
#EXTERNAL PORTS
# export PW_PORT_1="29000"
# export PW_PORT_2="29001"
# export PW_PORT_3="29002"
# export PW_PORT_4="29003"
#START
# export PW_START_GAMED="true"
# export PW_START_GLINKD_1="true"
# export PW_START_GLINKD_2="true"
# export PW_START_GLINKD_3="true"
# export PW_START_GLINKD_4="true"
# export PW_START_GAMEDBD="true"
# export PW_START_GFACTIOND="true"
# export PW_START_GACD="true"
# export PW_START_GDELIVERYD="true"
# export PW_START_GAUTHD="true"
# export PW_START_UNIQUENAMED="true"
# export PW_START_LOGSERVICE="true"
#BACKUP
# export PW_DB_HOST="127.0.0.1"
# export PW_DB_USER="root"
# export PW_DB_PASSWORD="1"
# export PW_DB_NAME="pw"
# export PW_EXTERNAL_BACKUP="false"
# export PW_BACKUP_SSH_PASS="1"
# export PW_BACKUP_SSH_USER="root"
# export PW_BACKUP_SSH_HOST="127.0.0.1"
# export PW_BACKUP_DIR="/PWStorage/backup"
# export PW_BACKUP_LOG_DIR="/PWStorage/logs"
# export PW_BACKUP_STORAGE_DIR="/PWStorage"
# export PW_BACKUP_RETENTION_DAYS="5"

# or edit configuration section in the script

# Check Script Version and Handle Auto Update
function PWServerScriptCheckVersion 
{
    echo -e "${txtylw}PWServer script v${script_version}${txtnrm}"
    if [ "${auto_update}" = "true" ]; then
        echo -e "${txtcyn}Checking for updates...${txtnrm}"
        PWServerScriptAutoUpdate
    fi
}

# Auto Update Function
function PWServerScriptAutoUpdate {
    # Download the remote script to a temporary location
    curl -s -o "${temp_script_path}" -H 'Cache-Control: no-cache' "${remote_script_url}"
    
    # Check if download succeeded
    if [ ! -f "${temp_script_path}" ]; then
        echo "${txtred}Error downloading update script.${txtnrm}"
        return 1
    fi
    
    # Extract version from the downloaded script
    remote_script_version=$(grep '^script_version=' "${temp_script_path}" | cut -d '"' -f 2)
    
    # Compare versions and update if the remote version is newer
    if [[ "${remote_script_version}" != "${script_version}" ]]; then
        echo "${txtgrn}New script version found: ${remote_script_version}. Updating...${txtnrm}"
        if mv "${temp_script_path}" "${local_script_path}"; then
            chmod +x "${local_script_path}"
            echo "${txtylw}Script updated to version ${remote_script_version}. Please rerun the script to use the new version.${txtnrm}"
            exit 0
        else
            echo "${txtred}Failed to update the script.${txtnrm}"
            return 1
        fi
    else
        echo "${txtgrn}You are already using the latest version of the script: ${script_version}.${txtnrm}"
        rm -f "${temp_script_path}" # Cleanup
    fi
}


function PWServerStart {
    PWServerScriptCheckVersion
    # Check and create the log directory if it doesn't exist
    if [ ! -d "/$ServerDir/logs/" ]; then
        mkdir -p "/$ServerDir/logs/"
    fi
    
    # List of services to start, each defined by its name, directory, and executable.
    declare -A services=(
        ["Log Service"]="logservice logservice.conf"
        ["Auth"]="gauthd gamesys.conf"
        ["Unique Name"]="uniquenamed gamesys.conf"
        ["Data Base"]="gamedbd gamesys.conf"
        ["Anti Cheat"]="gacd gamesys.conf"
        ["Faction"]="gfactiond gamesys.conf"
        ["Delivery"]="gdeliveryd gamesys.conf"
        ["Link 1"]="glinkd gamesys.conf 1"
        ["Link 2"]="glinkd gamesys.conf 2"
        ["Link 3"]="glinkd gamesys.conf 3"
        ["Link 4"]="glinkd gamesys.conf 4"
        ["Game Service"]="gamed gs01 gs.conf gmserver.conf gsalias.conf"
    )
    
    # Service start flags
    declare -A service_flags=(
        ["Log Service"]="${PW_START_LOGSERVICE:-false}"
        ["Auth"]="${PW_START_GAUTHD:-false}"
        ["Unique Name"]="${PW_START_UNIQUENAMED:-false}"
        ["Data Base"]="${PW_START_GAMEDBD:-false}"
        ["Anti Cheat"]="${PW_START_GACD:-false}"
        ["Faction"]="${PW_START_GFACTIOND:-false}"
        ["Delivery"]="${PW_START_GDELIVERYD:-false}"
        ["Link 1"]="${PW_START_GLINKD_1:-false}"
        ["Link 2"]="${PW_START_GLINKD_2:-false}"
        ["Link 3"]="${PW_START_GLINKD_3:-false}"
        ["Link 4"]="${PW_START_GLINKD_4:-false}"
        ["Game Service"]="${PW_START_GAMED:-false}"
    )

    # Iterate over the service list and start each one
    for service_name in "${!services[@]}"; do
        read -r directory executable_args <<< "${services[$service_name]}"
        if [[ "${service_flags[$service_name]}" == "true" ]]; then
            echo -e "=== [${txtred} START ${txtnrm}] $service_name ==="
            log_path="/$ServerDir/logs/${service_name// /_}.log"
            cd "/$ServerDir/$directory" || { echo "Directory /$ServerDir/$directory not found."; continue; }
            ./"$directory" $executable_args > "$log_path" &
            echo "Service $service_name started, waiting for 60 seconds before starting the next service."
            sleep 300
            echo -e "=== [${txtgrn} OK ${txtnrm}] ===\n"
        fi
    done
}


function PWServerStop {
    PWServerScriptCheckVersion
    # Define an array of service names to be stopped
    declare -a services=("logservice" "glinkd" "gauthd" "gdeliveryd" "gacd" "gs" "gfactiond" "uniquenamed" "gamedbd")

    # Iterate through the array and stop each service
    for service in "${services[@]}"; do
        # Attempt to gracefully kill the service
        if pkill -9 "$service"; then
            echo -e "[${txtgrn} OK ${txtnrm}] Stopped ${service}"
            sleep 300
        else
            # If pkill fails (e.g., service not running), notify the user
            echo -e "[${txtylw} WARNING ${txtnrm}] ${service} could not be stopped or was not running."
        fi
    done
}

function PWServerHelp {
    # Check for script updates before displaying help
    PWServerScriptCheckVersion
    
    # Calculate padding for centering (assuming an average terminal width of 80 characters)
    padding="$(printf '%0.1s' ' '{1..30})"
    width=70 # Approximate width for centered text

    # Header
    printf "%*.*s %s\n" 0 $((($width-${#script_version})/2)) "$padding" "${txtylw}Help PWServer - Perfect World Server v${script_version}${txtnrm}"
    printf "%*.*s %s\n" 0 $((($width-6)/2)) "$padding" "${txtylw}Usage: PWServer [Command]${txtnrm}"
    echo

    # Available commands and their descriptions
    printf "%*.*s%s\n" 0 $((($width-${#AvailableCommands})/2)) "$padding" "${txtgrn}Available Commands:${txtnrm}"
    commands=("start: Starts the Perfect World Server. This initializes all necessary services and daemons."
              "stop: Stops the Perfect World Server. This gracefully shuts down all running services."
              "restart: Restarts the server. This is equivalent to stopping and then starting the server."
              "install: Installs necessary dependencies and prepares the server's environment."
              "drop-cache: Drops memory cache. Useful for freeing up system memory."
              "fixdb: Repairs the database by fixing any corrupted data."
              "backup: Make a Backup of Database and Sql"
              "loadbackup: Restores server data from a backup file."
              "backup-sync: Sync backup to external server."
              "backup-old: Delete old backups and logs."
              "accept: Iptables ACCEPT for GLINKD external port."
              "drop: Iptables DROP for GLINKD external port."
              "update: Checks for and applies game updates (CPW)."
              "update-script: Checks for updates to this script and updates it if necessary."
              "pwadmin start: Starts the PWAdmin service, enabling administrative functions."
              "pwadmin stop: Stops the PWAdmin service."
              "showconfig: Displays the current configuration settings.")

    for cmd in "${commands[@]}"; do
        echo -e "   ${txtcyn}${cmd%%:*}${txtnrm} ${cmd#*:}"
    done

    # Instructions for additional help
    echo
    printf "%*.*s%s\n" 0 $((($width-74)/2)) "$padding" "For more information on a specific command, type '${txtcyn}PWServer [Command] --help${txtnrm}'."
}

function PWServerShowConfig {
    echo -e "${txtylw}Current Script Configuration:${txtnrm}"
    printf "Auto Update Script: "
    if [[ "${auto_update}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    echo -e "Server Directory: ${ServerDir}"
    echo -e "Port 1: ${PW_PORT_1}"
    echo -e "Port 2: ${PW_PORT_2}"
    echo -e "Port 3: ${PW_PORT_3}"
    echo -e "Port 4: ${PW_PORT_4}"

    printf "Start GAMED: "
    if [[ "${PW_START_GAMED}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 1: "
    if [[ "${PW_START_GLINKD_1}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 2: "
    if [[ "${PW_START_GLINKD_2}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 3: "
    if [[ "${PW_START_GLINKD_3}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 4: "
    if [[ "${PW_START_GLINKD_4}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GAMEDBD: "
    if [[ "${PW_START_GAMEDBD}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GFACTIOND: "
    if [[ "${PW_START_GFACTIOND}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GACD: "
    if [[ "${PW_START_GACD}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GDELIVERYD: "
    if [[ "${PW_START_GDELIVERYD}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GAUTHD: "
    if [[ "${PW_START_GAUTHD}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start UNIQUENAMED: "
    if [[ "${PW_START_UNIQUENAMED}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start LOGSERVICE: "
    if [[ "${PW_START_LOGSERVICE}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "External Backup: "
    if [[ "${EXTERNAL_BACKUP}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    echo -e "Backup Retention Days: ${RETENTION_DAYS}"
}





function PWAdminStart {
    PWServerScriptCheckVersion
    echo -e "=== [${txtred} START ${txtnrm}] PWAdmin Service ==="
    # Ensure the working directory exists and the script is executable
    if [ -d "/$ServerDir/pwadmin" ] && [ -x "/$ServerDir/pwadmin/pwadmin" ]; then
        # Attempt to start the PWAdmin service
        cd "/$ServerDir/pwadmin"; ./pwadmin start &
        
        # If successful, print an OK message
        echo -e "=== [${txtgrn} OK ${txtnrm}] ===\n"
    else
        # If the directory doesn't exist or the script is not executable, print an error message
        echo -e "=== [${txtred} ERROR ${txtnrm}] PWAdmin Service directory does not exist or pwadmin is not executable ===\n"
    fi
}

function PWAdminStop {
    PWServerScriptCheckVersion
    echo -e "=== [${txtred} STOP ${txtnrm}] PWAdmin Service ==="
    
    # Ensure the working directory exists and the script is executable
    if [ -d "/$ServerDir/pwadmin" ] && [ -x "/$ServerDir/pwadmin/pwadmin" ]; then
        # Attempt to stop the PWAdmin service
        cd "/$ServerDir/pwadmin"; ./pwadmin stop &
        
        # If successful, print an OK message
        echo -e "=== [${txtgrn} OK ${txtnrm}] ===\n"
    else
        # If the directory doesn't exist or the script is not executable, print an error message
        echo -e "=== [${txtred} ERROR ${txtnrm}] PWAdmin Service directory does not exist or pwadmin is not executable ===\n"
    fi
}


function PWServerFixDB {
    PWServerScriptCheckVersion
    # Ensure the fix directory doesn't already exist to prevent overwriting
    if [ -d "/PWStorage/gamedb/dbdata.fix" ]; then
        echo -e "${txtred}The fix directory already exists. Please remove it before attempting a fix.${txtnrm}"
        return 1 # Exit the function with an error status
    fi

    echo -e "${txtylw}Creating directory for fixed database files...${txtnrm}"
    mkdir -p /PWStorage/gamedb/dbdata.fix

    echo -e "${txtylw}Starting database repair process...${txtnrm}"
    # Iterate through each database file and apply the repair tool
    ls /PWStorage/gamedb/dbdata/ | while read -r dbfile; do
        echo -e "${txtcyn}Repairing ${dbfile}...${txtnrm}"
        /PWServer/gamedbd/dbtool -r -s "/PWStorage/gamedb/dbdata/${dbfile}" -d "/PWStorage/gamedb/dbdata.fix/${dbfile}"
    done

    # Verify the repair was successful before proceeding
    if [ "$(ls -A /PWStorage/gamedb/dbdata.fix)" ]; then
        echo -e "${txtylw}Removing original database files...${txtnrm}"
        rm -fr /PWStorage/gamedb/dbdata
        rm -fr /PWStorage/gamedb/dblogs/*

        echo -e "${txtylw}Replacing original database with fixed version...${txtnrm}"
        mv /PWStorage/gamedb/dbdata.fix /PWStorage/gamedb/dbdata
        echo -e "${txtgrn}Database repair completed successfully.${txtnrm}"
    else
        echo -e "${txtred}Database repair failed or no files were repaired.${txtnrm}"
        # Optionally, clean up the empty fix directory
        rm -r /PWStorage/gamedb/dbdata.fix
        return 1 # Exit the function with an error status
    fi
}

function PWServerLoadBackup {
    PWServerScriptCheckVersion
    # Remove surrounding spaces that break the command
    FileCount=$(find /PWServer/ -type f -name "*.tar.bz2" | wc -l)
    
    if [ "$FileCount" -eq 1 ]; then
        # Ensure server is stopped before proceeding
        PWServerStop

        # Correctly assigning the found backup file path
        BackupFile=$(find /PWServer/ -type f -name "*.tar.bz2")
        
        echo "Restoring from backup file: $BackupFile"
        
        # Extracting the backup file to /PWStorage/
        tar -xvjf "$BackupFile" -C /PWStorage/
        
        # Dynamically determining the backup directory's name
        BackupDir=$(basename "$BackupFile" ".tar.bz2")

        # Ensuring critical directories are safely removed before moving restored ones
        echo "Cleaning existing database and name database directories..."
        rm -rf /PWStorage/gamedb /PWStorage/namedb
        
        # Moving restored databases into place
        echo "Restoring databases from backup..."
        mv "/PWStorage/$BackupDir-storage/gamedb/" /PWStorage/
        mv "/PWStorage/$BackupDir-storage/namedb/" /PWStorage/

        # Cleaning up the extracted backup directory
        rm -rf "/PWStorage/$BackupDir-storage"

        # Attempting to fix the database post-restoration
        PWServerFixDB
    else
        echo "${txtred}Error: Please ensure there is exactly one backup file in /PWServer/${txtnrm}"
    fi
}


function PWServerUpdate {
    PWServerScriptCheckVersion
    # Navigate to the update directory
    cd "/$ServerDir/Update/" || { echo "${txtred}Failed to change directory to /$ServerDir/Update/. Exiting.${txtnrm}"; return 1; }

    # Extract numeric part of version for comparison
    OldVersion=$(sed 's/[^0-9]*//g' < CPW/element/version)

    # Attempt to fetch new updates
    if ./creator new; then
        # Re-check version after attempting update
        NewVersion=$(sed 's/[^0-9]*//g' < CPW/element/version)

        # Compare old and new versions
        if [[ "$OldVersion" != "$NewVersion" ]]; then
            # If versions differ, an update was found and applied
            ./creator cup "$OldVersion"
            chmod -R 0755 CPW/  # Setting directory permissions recursively

            echo -e "${txtgrn}Update completed successfully to version: $NewVersion${txtnrm}"
        else
            # No update was found or applied
            echo "${txtylw}No updates were found. You are already using the latest version: $OldVersion${txtnrm}"
        fi
    else
        # Update attempt failed
        echo "${txtred}An error occurred while checking for or applying updates.${txtnrm}"
    fi
}


function PWServerInstall {
    PWServerScriptCheckVersion
    # Define color codes
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    NO_COLOR='\033[0m' # No Color

    echo -e "${YELLOW}Checking for required setups...${NO_COLOR}"

    # Add i386 architecture if not already added
    if dpkg --print-foreign-architectures | grep -qv i386; then
        echo -e "${YELLOW}Adding i386 architecture...${NO_COLOR}"
        dpkg --add-architecture i386
    else
        echo -e "${GREEN}i386 architecture already added.${NO_COLOR}"
    fi

    echo -e "${YELLOW}Updating and upgrading packages...${NO_COLOR}"
    apt update && apt upgrade -y

    # Check if contrib and non-free repositories are already in the sources.list
    if ! grep -q "contrib non-free" /etc/apt/sources.list; then
        echo -e "${YELLOW}Adding contrib and non-free repositories...${NO_COLOR}"
        sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
        apt update # Update package lists after adding new repositories
    else
        echo -e "${GREEN}contrib and non-free repositories already present.${NO_COLOR}"
    fi

    echo -e "${YELLOW}Installing necessary packages...${NO_COLOR}"
    # Define necessary packages in an array
    packages=(
        libxml-dom-perl libxml2-dev libssl-dev libpcre3-dev
        libstdc++5 build-essential gcc-multilib g++-multilib libstdc++6 libgcc1
        zlib1g libncurses5 mc screen htop mono-complete exim4 p7zip* libpcap-dev
        curl wget ipset net-tools tzdata ntpdate
        make gcc g++ libssl-dev libcrypto++-dev libpcre3 libpcre3-dev
        libtesseract-dev libx11-dev gcc-multilib libc6-dev
        build-essential gcc-multilib g++-multilib libtemplate-plugin-xml-perl libxml2-dev
        php libapache2-mod-php php-cli php-fpm php-json php-pdo php-zip php-gd php-mbstring
        php-curl php-xml php-pear php-bcmath php-cgi php-mysqli php-common php-phpseclib php-mysql php-bcmath php-ssh2 php-imagick
        libdb++-dev libdb-dev libdb5.3 libdb5.3++ libdb5.3++-dev
        libdb5.3-dbg libdb5.3-dev libmysqlcppconn-dev dos2unix
        nano git mariadb-client mariadb-server mariadb-common
        libjsoncpp24 libjsoncpp-dev libjsoncpp-doc
        libcurl4 libcurl4-openssl-dev
        libmariadb3 libmariadb-dev upx dos2unix
    )

    for pkg in "${packages[@]}"; do
        if ! dpkg -l | grep -qw "$pkg"; then
            apt install -y --fix-missing "$pkg"
        else
            echo -e "${GREEN}$pkg is already installed.${NO_COLOR}"
        fi
    done

    # Check if /PWServer directory exists
    if [ ! -d "/PWServer" ]; then
        echo -e "${YELLOW}Creating /PWServer directory and adjusting permissions...${NO_COLOR}"
        mkdir /PWServer && chmod -R 0755 /PWServer
    else
        echo -e "${GREEN}/PWServer directory already exists. Skipping creation.${NO_COLOR}"
    fi

    # Create symbolic links if they don't exist
    echo -e "${YELLOW}Creating symbolic links...${NO_COLOR}"
    declare -A links=(
        ["/PWServer/gamed/license"]="/home/license"
        ["/PWServer/gamed/libtask.so"]="/lib/libtask.so"
        ["/PWServer/gamed/libskill.so"]="/lib/libskill.so"
    )

    for src in "${!links[@]}"; do
        dest="${links[$src]}"
        if [ ! -L "$dest" ]; then
            ln -s "$src" "$dest"
            echo -e "${GREEN}Created link $dest -> $src${NO_COLOR}"
        else
            echo -e "${GREEN}Link $dest already exists. Skipping.${NO_COLOR}"
        fi
    done

    echo -e "${YELLOW}Cleaning up packages that are no longer required...${NO_COLOR}"
    apt autoremove -y

    echo -e "${YELLOW}Setting up script for future use...${NO_COLOR}"
    script_dest="/PWServer/PWServer.sh"
    cp -f "$0" "$script_dest" && chmod +x "$script_dest"
    echo -e "${GREEN}Script copied to $script_dest.${NO_COLOR}"

    # Create a symbolic link to this script in /usr/bin for easy access
    ln -sf "$script_dest" /usr/bin/PWServer
    echo -e "${GREEN}Symbolic link to script created in /usr/bin/PWServer.${NO_COLOR}"
}


function PWServerDropCache {
    PWServerScriptCheckVersion
    # Ensure the script is run with root privileges
    if [ "$(id -u)" != "0" ]; then
        echo "This function needs to be run as root."
        return 1
    fi

    echo "Dropping caches..."
    # Flush filesystem buffers by calling sync
    # sync
    # Drop caches without affecting swap or other kernel entities
    echo 3 > /proc/sys/vm/drop_caches

    echo "Cache dropped successfully."
}

# Function to perform backup
function PWServerBackup {
    PWServerScriptCheckVersion
    backup_path="${STORAGE_DIR}/${today}-storage"
    backup_file="${BACKUP_DIR}/${today}.tar"
    remote_backup_path="${SSH_HOST}:${BACKUP_DIR}/${today}.tar.bz2"

    # Create backup directory
    mkdir -p "${backup_path}"
    chmod -R 0777 "${backup_path}"

    # Copy database and name database
    cp -R "${STORAGE_DIR}/gamedb" "${backup_path}/gamedb/"
    cp -R "${STORAGE_DIR}/namedb" "${backup_path}/namedb/"

    # Dump MySQL database
    mysqldump -h"${DB_HOST}" -u"${DB_USER}" -p"${DB_PASSWORD}" -x -e -B --routines "${DB_NAME}" > "${backup_path}/pw.sql"

    # Create a tarball of the backup directory
    tar -cf "${backup_file}" -C "${STORAGE_DIR}" "$(basename "${backup_path}")"
    bzip2 "${backup_file}"

    # Remove the uncompressed backup directory
    rm -rf "${backup_path}"

    # Only perform SSH transfer if external backup is enabled
    if [[ "${EXTERNAL_BACKUP}" == "true" ]]; then
        echo "Transferring backup to external server..."
        sshpass -p "${SSH_PASS}" scp "${backup_file}.bz2" "${SSH_USER}@${remote_backup_path}"
    fi

    # Clean up old backups and logs
    find "${BACKUP_DIR}" -type f -mtime +${RETENTION_DAYS} -exec rm {} \;
    find "${LOG_DIR}" -type f -mtime +${RETENTION_DAYS} -exec rm {} \;
}

function PWServerBackupSync {
    PWServerScriptCheckVersion

    if [[ "${EXTERNAL_BACKUP}" == "true" ]]; then
        echo "sync backup to external server..."
        sshpass -p "${SSH_PASS}" rsync -Ppruvah "${BACKUP_DIR}/" "${SSH_USER}@${SSH_HOST}:${BACKUP_DIR}/"
    fi
    
}

function PWServerDeleteOldBackup {
    find "${BACKUP_DIR}" -type f -mtime +${RETENTION_DAYS} -exec rm {} \;
    find "${LOG_DIR}" -type f -mtime +${RETENTION_DAYS} -exec rm {} \;
}

function PWServerDrop
{
    PWServerScriptCheckVersion
    sleep 30
	iptables -F
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_1} -j DROP
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_2} -j DROP
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_3} -j DROP
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_4} -j DROP
    sleep 30
}
function PWServerAccept
{
    PWServerScriptCheckVersion
    sleep 30
	iptables -F
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_1} -j ACCEPT
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_2} -j ACCEPT
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_3} -j ACCEPT
    sleep 30
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_4} -j ACCEPT
    sleep 30
}

function main {
    case $1 in
        "pwadmin")
            case $2 in
                "start")
                    PWAdminStart
                    ;;
                "stop")
                    PWAdminStop
                    ;;
                *)
                    echo "Invalid 'pwadmin' command. Usage: $0 pwadmin {start|stop}"
                    ;;
            esac
            ;;
        "start")
            PWServerStart
            ;;
        "stop")
            PWServerStop
            ;;
        "install")
            PWServerInstall
            ;;
        "fixdb")
            PWServerFixDB
            ;;
        "loadbackup")
            PWServerLoadBackup
            ;;
        "backup")
            PWServerBackup
            ;;
        "backup-sync")
            PWServerBackupSync
            ;;
        "backup-old")
            PWServerDeleteOldBackup
            ;;
        "update")
            PWServerUpdate
            ;;
        "accept")
            PWServerAccept
            ;;
        "drop")
            PWServerDrop
            ;;
        "drop-cache")
            PWServerDropCache
            ;;
        "restart")
            echo "Restarting the server..."
            PWServerStop
            sleep 300 # Waiting for 5 minutes before restarting might be too long for some scenarios. Adjust as needed.
            PWServerStart
            ;;
        "update-script")
            PWServerScriptAutoUpdate
            ;;
        "showconfig")
            PWServerShowConfig
            ;;
        *)
            PWServerHelp
            ;;
    esac
}

# Ensure the script is executed with necessary arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided. Usage: $0 {command}"
	PWServerHelp
    exit 1
fi

# Call main function with all supplied arguments
main "$@"