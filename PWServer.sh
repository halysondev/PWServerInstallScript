#!/bin/bash
script_version="1.9.1"

# Perfect World Server Script
# Author: Halyson Cesar
# Git: https://github.com/halysondev/PWServerInstallScript

# Script Information
remote_script_url="https://raw.githubusercontent.com/halysondev/PWServerInstallScript/main/PWServer.sh" # URL for updates
local_script_path="${BASH_SOURCE[0]}" # Path to the current script
temp_script_path="/tmp/PWServer.sh" # Temporary path for downloads
config_file="/PWServer/configure" # Configuration file path

# Load configuration from file
if [ -f "$config_file" ]; then
    source "$config_file"
fi

auto_update="${PW_AUTO_UPDATE:-true}" # Auto-update toggle (set to false to disable auto updates)

# Configuration
ServerDir="${PW_SERVER_DIR:-PWServer}" # Directory for server files and logs

PW_PORT_1="${PW_PORT_1:-29000}"
PW_PORT_2="${PW_PORT_2:-29001}"
PW_PORT_3="${PW_PORT_3:-29002}"
PW_PORT_4="${PW_PORT_4:-29003}"
PW_PORT_5="${PW_PORT_5:-29004}"
PW_PORT_6="${PW_PORT_6:-29005}"
PW_PORT_7="${PW_PORT_7:-29006}"
PW_PORT_8="${PW_PORT_8:-29007}"
PW_PORT_9="${PW_PORT_9:-29008}"
PW_PORT_10="${PW_PORT_10:-29009}"
PW_PORT_11="${PW_PORT_11:-29010}"
PW_PORT_12="${PW_PORT_12:-29011}"
PW_PORT_13="${PW_PORT_13:-29012}"
PW_PORT_14="${PW_PORT_14:-29013}"
PW_PORT_15="${PW_PORT_15:-29014}"
PW_PORT_16="${PW_PORT_16:-29015}"
PW_PORT_17="${PW_PORT_17:-29016}"
PW_PORT_18="${PW_PORT_18:-29017}"
PW_PORT_19="${PW_PORT_19:-29018}"
PW_PORT_20="${PW_PORT_20:-29019}"

PW_EXTERNAL_IP_1="${PW_EXTERNAL_IP_1:-0}"
PW_EXTERNAL_IP_2="${PW_EXTERNAL_IP_2:-0}"
PW_EXTERNAL_IP_3="${PW_EXTERNAL_IP_3:-0}"
PW_EXTERNAL_IP_4="${PW_EXTERNAL_IP_4:-0}"
PW_EXTERNAL_IP_5="${PW_EXTERNAL_IP_5:-0}"
PW_EXTERNAL_IP_6="${PW_EXTERNAL_IP_6:-0}"
PW_EXTERNAL_IP_7="${PW_EXTERNAL_IP_7:-0}"
PW_EXTERNAL_IP_8="${PW_EXTERNAL_IP_8:-0}"
PW_EXTERNAL_IP_9="${PW_EXTERNAL_IP_9:-0}"
PW_EXTERNAL_IP_10="${PW_EXTERNAL_IP_10:-0}"
PW_EXTERNAL_IP_11="${PW_EXTERNAL_IP_11:-0}"
PW_EXTERNAL_IP_12="${PW_EXTERNAL_IP_12:-0}"
PW_EXTERNAL_IP_13="${PW_EXTERNAL_IP_13:-0}"
PW_EXTERNAL_IP_14="${PW_EXTERNAL_IP_14:-0}"
PW_EXTERNAL_IP_15="${PW_EXTERNAL_IP_15:-0}"
PW_EXTERNAL_IP_16="${PW_EXTERNAL_IP_16:-0}"
PW_EXTERNAL_IP_17="${PW_EXTERNAL_IP_17:-0}"
PW_EXTERNAL_IP_18="${PW_EXTERNAL_IP_18:-0}"
PW_EXTERNAL_IP_19="${PW_EXTERNAL_IP_19:-0}"
PW_EXTERNAL_IP_20="${PW_EXTERNAL_IP_20:-0}"

PW_EXTERNAL_PORT_1="${PW_EXTERNAL_PORT_1:-0}"
PW_EXTERNAL_PORT_2="${PW_EXTERNAL_PORT_2:-0}"
PW_EXTERNAL_PORT_3="${PW_EXTERNAL_PORT_3:-0}"
PW_EXTERNAL_PORT_4="${PW_EXTERNAL_PORT_4:-0}"
PW_EXTERNAL_PORT_5="${PW_EXTERNAL_PORT_5:-0}"
PW_EXTERNAL_PORT_6="${PW_EXTERNAL_PORT_6:-0}"
PW_EXTERNAL_PORT_7="${PW_EXTERNAL_PORT_7:-0}"
PW_EXTERNAL_PORT_8="${PW_EXTERNAL_PORT_8:-0}"
PW_EXTERNAL_PORT_9="${PW_EXTERNAL_PORT_9:-0}"
PW_EXTERNAL_PORT_10="${PW_EXTERNAL_PORT_10:-0}"
PW_EXTERNAL_PORT_11="${PW_EXTERNAL_PORT_11:-0}"
PW_EXTERNAL_PORT_12="${PW_EXTERNAL_PORT_12:-0}"
PW_EXTERNAL_PORT_13="${PW_EXTERNAL_PORT_13:-0}"
PW_EXTERNAL_PORT_14="${PW_EXTERNAL_PORT_14:-0}"
PW_EXTERNAL_PORT_15="${PW_EXTERNAL_PORT_15:-0}"
PW_EXTERNAL_PORT_16="${PW_EXTERNAL_PORT_16:-0}"
PW_EXTERNAL_PORT_17="${PW_EXTERNAL_PORT_17:-0}"
PW_EXTERNAL_PORT_18="${PW_EXTERNAL_PORT_18:-0}"
PW_EXTERNAL_PORT_19="${PW_EXTERNAL_PORT_19:-0}"
PW_EXTERNAL_PORT_20="${PW_EXTERNAL_PORT_20:-0}"

PW_ALLOW_SSH_PORT_DEFAULT="${PW_ALLOW_SSH_PORT_DEFAULT:-true}"

PW_START_GAMED="${PW_START_GAMED:-true}"
PW_START_GLINKD_1="${PW_START_GLINKD_1:-true}"
PW_START_GLINKD_2="${PW_START_GLINKD_2:-true}"
PW_START_GLINKD_3="${PW_START_GLINKD_3:-true}"
PW_START_GLINKD_4="${PW_START_GLINKD_4:-true}"
PW_START_GLINKD_5="${PW_START_GLINKD_5:-false}"
PW_START_GLINKD_6="${PW_START_GLINKD_6:-false}"
PW_START_GLINKD_7="${PW_START_GLINKD_7:-false}"
PW_START_GLINKD_8="${PW_START_GLINKD_8:-false}"
PW_START_GLINKD_9="${PW_START_GLINKD_9:-false}"
PW_START_GLINKD_10="${PW_START_GLINKD_10:-false}"
PW_START_GLINKD_11="${PW_START_GLINKD_11:-false}"
PW_START_GLINKD_12="${PW_START_GLINKD_12:-false}"
PW_START_GLINKD_13="${PW_START_GLINKD_13:-false}"
PW_START_GLINKD_14="${PW_START_GLINKD_14:-false}"
PW_START_GLINKD_15="${PW_START_GLINKD_15:-false}"
PW_START_GLINKD_16="${PW_START_GLINKD_16:-false}"
PW_START_GLINKD_17="${PW_START_GLINKD_17:-false}"
PW_START_GLINKD_18="${PW_START_GLINKD_18:-false}"
PW_START_GLINKD_19="${PW_START_GLINKD_19:-false}"
PW_START_GLINKD_20="${PW_START_GLINKD_20:-false}"


PW_START_GAMEDBD="${PW_START_GAMEDBD:-true}"
PW_START_GFACTIOND="${PW_START_GFACTIOND:-true}"
PW_START_GACD="${PW_START_GACD:-true}"
PW_START_GDELIVERYD="${PW_START_GDELIVERYD:-true}"
PW_START_GAUTHD="${PW_START_GAUTHD:-true}"
PW_START_UNIQUENAMED="${PW_START_UNIQUENAMED:-true}"
PW_START_LOGSERVICE="${PW_START_LOGSERVICE:-true}"
PW_START_MONITOR="${PW_START_MONITOR:-true}"
PW_START_GAMETALKD="${PW_START_GAMETALKD:-true}"


DB_HOST="${PW_DB_HOST:-127.0.0.1}"
DB_USER="${PW_DB_USER:-root}"
DB_PASSWORD="${PW_DB_PASSWORD:-1}"
DB_NAME="${PW_DB_NAME:-pw}"

EXTERNAL_BACKUP="${PW_EXTERNAL_BACKUP:-true}"

SSH_PASS="${PW_BACKUP_SSH_PASS:-1}"
SSH_USER="${PW_BACKUP_SSH_USER:-root}"
SSH_HOST="${PW_BACKUP_SSH_HOST:-127.0.0.1}"

BACKUP_DIR="${PW_BACKUP_DIR:-/PWStorage/backup}"
LOG_DIR="${PW_BACKUP_LOG_DIR:-/PWStorage/logs}"
STORAGE_DIR="${PW_BACKUP_STORAGE_DIR:-/PWStorage}"

# Retention period in days
RETENTION_DAYS="${PW_BACKUP_RETENTION_DAYS:-5}"

SLEEP_TIME="${PW_SLEEP_TIME:-5}"

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


function StartService {
    service_name="$1"
    directory="$2"
    executable="$3"
    args="$4"
    
    log_path="/$ServerDir/logs/${directory}.log"
    echo "Starting $service_name with $executable $args" | tee -a "$log_path"

    if [[ ! -d "/$ServerDir/$directory" ]]; then
        echo "Directory /$ServerDir/$directory does not exist." | tee -a "$log_path"
        return
    fi

    if [[ ! -x "/$ServerDir/$directory/$executable" ]]; then
        echo "Executable /$ServerDir/$directory/$executable not found or is not executable." | tee -a "$log_path"
        return
    fi

    # Executar o comando separadamente, sem aspas em volta da linha completa
	cd "/$ServerDir/$directory"
    ./"$executable" $args > "$log_path" &
	cd "/$ServerDir"
	
	sleep "$SLEEP_TIME"
    
    echo "$service_name started, check $log_path for details." | tee -a "$log_path"
}

function FixConfigure {
    sed -i 's/\r$//' /$ServerDir/configure
}

function PWServerStart {
    PWServerScriptCheckVersion

	echo "Starting services..."

	FixConfigure

    if [ "$PW_START_LOGSERVICE" = "true" ]; then
		echo "Starting Log Service..."
        StartService "Log Service" "logservice" "logservice" "logservice.conf"
    fi

    if [ "$PW_START_MONITOR" = "true" ]; then
		echo "Starting Monitor..."
        StartService "Monitor" "monitor" "monitor" ""
    fi

    if [ "$PW_START_GAUTHD" = "true" ]; then
		echo "Starting Auth Service..."
        StartService "Auth Service" "gauthd" "gauthd" "gamesys.conf"
    fi

    if [ "$PW_START_UNIQUENAMED" = "true" ]; then
        StartService "Unique Name" "uniquenamed" "uniquenamed" "gamesys.conf"
    fi

    if [ "$PW_START_GAMEDBD" = "true" ]; then
        StartService "Data Base" "gamedbd" "gamedbd" "gamesys.conf"
    fi

    if [ "$PW_START_GACD" = "true" ]; then
        StartService "Anti Cheat" "gacd" "gacd" "gamesys.conf"
    fi

    if [ "$PW_START_GFACTIOND" = "true" ]; then
        StartService "Faction" "gfactiond" "gfactiond" "gamesys.conf"
    fi

    if [ "$PW_START_GDELIVERYD" = "true" ]; then
        StartService "Delivery" "gdeliveryd" "gdeliveryd" "gamesys.conf"
    fi

    if [ "$PW_START_GLINKD_1" = "true" ]; then
        StartService "Link 1" "glinkd" "glinkd" "gamesys.conf 1"
    fi

    if [ "$PW_START_GLINKD_2" = "true" ]; then
        StartService "Link 2" "glinkd" "glinkd" "gamesys.conf 2"
    fi

    if [ "$PW_START_GLINKD_3" = "true" ]; then
        StartService "Link 3" "glinkd" "glinkd" "gamesys.conf 3"
    fi

    if [ "$PW_START_GLINKD_4" = "true" ]; then
        StartService "Link 4" "glinkd" "glinkd" "gamesys.conf 4"
    fi

    if [ "$PW_START_GLINKD_5" = "true" ]; then
        StartService "Link 5" "glinkd" "glinkd" "gamesys.conf 5"
    fi

    if [ "$PW_START_GLINKD_6" = "true" ]; then
        StartService "Link 6" "glinkd" "glinkd" "gamesys.conf 6"
    fi

    if [ "$PW_START_GLINKD_7" = "true" ]; then
        StartService "Link 7" "glinkd" "glinkd" "gamesys.conf 7"
    fi

    if [ "$PW_START_GLINKD_8" = "true" ]; then
        StartService "Link 8" "glinkd" "glinkd" "gamesys.conf 8"
    fi

    if [ "$PW_START_GLINKD_9" = "true" ]; then
        StartService "Link 9" "glinkd" "glinkd" "gamesys.conf 9"
    fi

    if [ "$PW_START_GLINKD_10" = "true" ]; then
        StartService "Link 10" "glinkd" "glinkd" "gamesys.conf 10"
    fi

    if [ "$PW_START_GLINKD_11" = "true" ]; then
        StartService "Link 11" "glinkd" "glinkd" "gamesys.conf 11"
    fi

    if [ "$PW_START_GLINKD_12" = "true" ]; then
        StartService "Link 12" "glinkd" "glinkd" "gamesys.conf 12"
    fi

    if [ "$PW_START_GLINKD_13" = "true" ]; then
        StartService "Link 13" "glinkd" "glinkd" "gamesys.conf 13"
    fi

    if [ "$PW_START_GLINKD_14" = "true" ]; then
        StartService "Link 14" "glinkd" "glinkd" "gamesys.conf 14"
    fi

    if [ "$PW_START_GLINKD_15" = "true" ]; then
        StartService "Link 15" "glinkd" "glinkd" "gamesys.conf 15"
    fi

    if [ "$PW_START_GLINKD_16" = "true" ]; then
        StartService "Link 16" "glinkd" "glinkd" "gamesys.conf 16"
    fi

    if [ "$PW_START_GLINKD_17" = "true" ]; then
        StartService "Link 17" "glinkd" "glinkd" "gamesys.conf 17"
    fi

    if [ "$PW_START_GLINKD_18" = "true" ]; then
        StartService "Link 18" "glinkd" "glinkd" "gamesys.conf 18"
    fi

    if [ "$PW_START_GLINKD_19" = "true" ]; then
        StartService "Link 19" "glinkd" "glinkd" "gamesys.conf 19"
    fi

    if [ "$PW_START_GLINKD_20" = "true" ]; then
        StartService "Link 20" "glinkd" "glinkd" "gamesys.conf 20"
    fi

    if [ "$PW_START_GAMETALKD" = "true" ]; then
        StartService "Game Talk" "gametalkd" "gametalkd" "gamesys.conf"
    fi

    if [ "$PW_START_GAMED" = "true" ]; then
        StartService "Game Service" "gamed" "gs" "gs01 gs.conf gmserver.conf gsalias.conf"
    fi
}

function PWServerStop {
    PWServerScriptCheckVersion
    # Define an array of service names to be stopped
    declare -a services=("logservice" "glinkd" "gauthd" "gdeliveryd" "gacd" "gs" "gfactiond" "uniquenamed" "gamedbd" "monitor" "gametalkd")

    # Iterate through the array and stop each service
    for service in "${services[@]}"; do
        # Attempt to gracefully kill the service
        if pkill -9 "$service"; then
            echo -e "[${txtgrn} OK ${txtnrm}] Stopped ${service}"
            sleep "${SLEEP_TIME}"
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
              "accept-external: Iptables ACCEPT for external provider connections, with IP-based filtering."
              "drop-external: Iptables DROP for external provider connections, preserving SSH access."
              "clear-firewall-rules: Clears all firewall rules and sets default policies to ACCEPT."
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
    echo -e "Port 5: ${PW_PORT_5}"
    echo -e "Port 6: ${PW_PORT_6}"
    echo -e "Port 7: ${PW_PORT_7}"
    echo -e "Port 8: ${PW_PORT_8}"
    echo -e "Port 9: ${PW_PORT_9}"
    echo -e "Port 10: ${PW_PORT_10}"
    echo -e "Port 11: ${PW_PORT_11}"
    echo -e "Port 12: ${PW_PORT_12}"
    echo -e "Port 13: ${PW_PORT_13}"
    echo -e "Port 14: ${PW_PORT_14}"
    echo -e "Port 15: ${PW_PORT_15}"
    echo -e "Port 16: ${PW_PORT_16}"
    echo -e "Port 17: ${PW_PORT_17}"
    echo -e "Port 18: ${PW_PORT_18}"
    echo -e "Port 19: ${PW_PORT_19}"
    echo -e "Port 20: ${PW_PORT_20}"

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

    printf "Start GLINKD 5: "
    if [[ "${PW_START_GLINKD_5}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 6: "
    if [[ "${PW_START_GLINKD_6}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 7: "
    if [[ "${PW_START_GLINKD_7}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 8: "
    if [[ "${PW_START_GLINKD_8}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 9: "
    if [[ "${PW_START_GLINKD_9}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 10: "
    if [[ "${PW_START_GLINKD_10}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 11: "
    if [[ "${PW_START_GLINKD_11}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 12: "
    if [[ "${PW_START_GLINKD_12}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 13: "
    if [[ "${PW_START_GLINKD_13}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 14: "
    if [[ "${PW_START_GLINKD_14}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 15: "
    if [[ "${PW_START_GLINKD_15}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 16: "
    if [[ "${PW_START_GLINKD_16}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 17: "
    if [[ "${PW_START_GLINKD_17}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 18: "
    if [[ "${PW_START_GLINKD_18}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 19: "
    if [[ "${PW_START_GLINKD_19}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GLINKD 20: "
    if [[ "${PW_START_GLINKD_20}" == "true" ]]; then
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

    printf "Start MONITOR: "
    if [[ "${PW_START_MONITOR}" == "true" ]]; then
        echo -e "${txtgrn}Enabled${txtnrm}"
    else
        echo -e "${txtred}Disabled${txtnrm}"
    fi

    printf "Start GAMETALKD: "
    if [[ "${PW_START_GAMETALKD}" == "true" ]]; then
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

function detect_os_version {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        os_name=$ID
        os_version=$VERSION_ID

        if [[ "$os_name" == "debian" && "$os_version" == "11" ]]; then
            echo "Detected Debian 11"
            PWServerInstallDebian11
        elif [[ "$os_name" == "debian" && "$os_version" == "12" ]]; then
            echo "Detected Debian 12"
            PWServerInstallDebian12
        else
            echo "Unsupported OS version: $os_name $os_version"
            exit 1
        fi
    else
        echo "Cannot detect OS version. /etc/os-release not found."
        exit 1
    fi
}

function PWServerInstall {
    PWServerScriptCheckVersion
    detect_os_version
}

function PWServerInstallDebian12 {
    PWServerScriptCheckVersion

    echo "Proceeding with installation for Debian 12..."

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

    # Check if contrib and non-free-firmware repositories are already in the debian.sources
    if ! grep -q "contrib non-free-firmware" /etc/apt/sources.list.d/debian.sources; then
        echo -e "${YELLOW}Adding contrib and non-free-firmware repositories...${NO_COLOR}"
        sed -i 's/Components: main/Components: main contrib non-free-firmware/g' /etc/apt/sources.list.d/debian.sources
        apt update # Update package lists after adding new repositories
    else
        echo -e "${GREEN}contrib and non-free-firmware repositories already present.${NO_COLOR}"
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
        libjsoncpp25 libjsoncpp-dev libjsoncpp-doc
        libcurl4 libcurl4-openssl-dev
        libmariadb3 libmariadb-dev wget tar xz-utils bash
    )

    for pkg in "${packages[@]}"; do
        if ! dpkg -l | grep -qw "$pkg"; then
            apt install -y --fix-missing "$pkg"
        else
            echo -e "${GREEN}$pkg is already installed.${NO_COLOR}"
        fi
    done

     # Install UPX
    wget https://github.com/upx/upx/releases/download/v4.2.4/upx-4.2.4-amd64_linux.tar.xz
    tar -xf upx-4.2.4-amd64_linux.tar.xz
    mv upx-4.2.4-amd64_linux/upx /usr/local/bin/
    rm -r upx-4.2.4-amd64_linux upx-4.2.4-amd64_linux.tar.xz

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
        ["/PWServer/license.conf"]="/home/license.conf"
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

     # Install locales and generate locale settings
    #apt-get update && apt-get install -y locales dialog
    #rm -rf /var/lib/apt/lists/*
    #sed -i '5,$s/^# \([^ ]\)/\1/' /etc/locale.gen
    #locale-gen

    # Set locale environment variables
    #export LANG=en_US.UTF-8
    #export LANGUAGE=en_US:en
    #export LC_ALL=en_US.UTF-8

    #echo "export LANG=en_US.UTF-8" >> ~/.bashrc
    #echo "export LANGUAGE=en_US:en" >> ~/.bashrc
    #echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_NUMERIC=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_TIME=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_COLLATE=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_MONETARY=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_MESSAGES=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_PAPER=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_NAME=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_ADDRESS=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_TELEPHONE=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_MEASUREMENT=en_US.UTF-8" >> ~/.bashrc
    #echo "export LC_IDENTIFICATION=en_US.UTF-8" >> ~/.bashrc

    # Install GCC 10 for compatibility, then remove the source
    #echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
    #apt-get update
    #apt-get install -y gcc-10 g++-10
    #sed -i '/bullseye/d' /etc/apt/sources.list
    #apt-get update && apt-get clean
    #rm -rf /var/lib/apt/lists/*

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

function PWServerInstallDebian11 {
    PWServerScriptCheckVersion

    echo "Proceeding with installation for Debian 11..."

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
        ["/PWServer/license.conf"]="/home/license.conf"
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
    #PWServerScriptCheckVersion
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
    #PWServerScriptCheckVersion

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
    #PWServerScriptCheckVersion
    sleep "${SLEEP_TIME}"
	iptables -F
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_1}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_1} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_2}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_2} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_3}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_3} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_4}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_4} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_5}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_5} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_6}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_6} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_7}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_7} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_8}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_8} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_9}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_9} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_10}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_10} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_11}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_11} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_12}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_12} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_13}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_13} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_14}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_14} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_15}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_15} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_16}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_16} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_17}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_17} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_18}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_18} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_19}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_19} -j DROP
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_20}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_20} -j DROP
    fi
    
    
    
}
function PWServerAccept
{
    #PWServerScriptCheckVersion
    sleep "${SLEEP_TIME}"
	iptables -F
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_1}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_1} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_2}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_2} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_3}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_3} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_4}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_4} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_5}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_5} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_6}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_6} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_7}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_7} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_8}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_8} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_9}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_9} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_10}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_10} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_11}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_11} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_12}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_12} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_13}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_13} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_14}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_14} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_15}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_15} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_16}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_16} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_17}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_17} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_18}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_18} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_19}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_19} -j ACCEPT
    fi
    sleep "${SLEEP_TIME}"
    if [[ "${PW_PORT_20}" != "0" ]]; then
	iptables -A INPUT -p tcp --destination-port ${PW_PORT_20} -j ACCEPT  
    fi
}

function PWServerAcceptExternal {
    #PWServerScriptCheckVersion
    sleep "${SLEEP_TIME}"
    iptables -F
    sleep "${SLEEP_TIME}"
    
    # Allow SSH connections if PW_ALLOW_SSH_PORT_DEFAULT is true
    if [[ "${PW_ALLOW_SSH_PORT_DEFAULT}" == "true" ]]; then
        iptables -A INPUT -p tcp --destination-port 22 -j ACCEPT
    fi
    
    # Configure rules for each port
    for port_idx in {1..20}; do
        port_var="PW_EXTERNAL_PORT_$port_idx"
        port=${!port_var}
        
        if [[ "$port" != "0" ]]; then
            # Drop all connections to this port initially
            iptables -A INPUT -p tcp --destination-port "$port" -j DROP
            
            # For each port, check all IPs and allow ones that are > 0
            for ip_idx in {1..20}; do
                ip_var="PW_EXTERNAL_IP_$ip_idx"
                ip=${!ip_var}
                
                if [[ "$ip" != "0" ]]; then
                    iptables -I INPUT -p tcp -s "$ip" --destination-port "$port" -j ACCEPT
                    sleep "${SLEEP_TIME}"
                fi
            done
        fi
    done
}

function PWServerDropExternal {
    #PWServerScriptCheckVersion
    sleep "${SLEEP_TIME}"
    iptables -F
    sleep "${SLEEP_TIME}"
    
    # Allow SSH connections if PW_ALLOW_SSH_PORT_DEFAULT is true
    if [[ "${PW_ALLOW_SSH_PORT_DEFAULT}" == "true" ]]; then
        iptables -A INPUT -p tcp --destination-port 22 -j ACCEPT
    fi
    
    # Drop connections to configured external ports
    for port_idx in {1..20}; do
        port_var="PW_EXTERNAL_PORT_$port_idx"
        port=${!port_var}
        
        if [[ "$port" != "0" ]]; then
            # Drop all connections to this port
            iptables -A INPUT -p tcp --destination-port "$port" -j DROP
            
            # For each port, check all IPs and allow ones that are > 0
            for ip_idx in {1..20}; do
                ip_var="PW_EXTERNAL_IP_$ip_idx"
                ip=${!ip_var}
                
                if [[ "$ip" != "0" ]]; then
                    iptables -I INPUT -p tcp -s "$ip" --destination-port "$port" -j DROP
                    sleep "${SLEEP_TIME}"
                fi
            done
        fi
    done
}

function PWServerClearFirewallRules {
    #PWServerScriptCheckVersion
    echo "Clearing all firewall rules..."
    
    # Flush all rules
    iptables -F
    iptables -X
    iptables -t nat -F
    iptables -t nat -X
    iptables -t mangle -F
    iptables -t mangle -X
    
    # Set default policies to ACCEPT
    iptables -P INPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -P OUTPUT ACCEPT
    
    echo "All firewall rules cleared. All traffic is now allowed."
}

# Function to install crontab job
function InstallCrontabJob {
    local command="$1"
    local time="$2"
    (crontab -l 2>/dev/null; echo "$time $command") | crontab -
    echo -e "${txtgrn}Crontab job installed: $command at $time${txtnrm}"
}

function InstallCrontabDrop {
    InstallCrontabJob "PWServer drop-cache" "$1"
}

function InstallCrontabBackup {
    InstallCrontabJob "PWServer backup" "$1"
}

function InstallCrontabBackupSync {
    InstallCrontabJob "PWServer backup-sync" "$1"
}

function InstallCrontabBackupOld {
    InstallCrontabJob "PWServer backup-old" "$1"
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
        "accept-external")
            PWServerAcceptExternal
            ;;
        "drop-external")
            PWServerDropExternal
            ;;
        "clear-firewall-rules")
            PWServerClearFirewallRules
            ;;
        "drop-cache")
            PWServerDropCache
            ;;
        "install-crontab-drop")
            InstallCrontabDrop "$2"
            ;;
        "install-backup")
            InstallCrontabBackup "$2"
            ;;
        "install-backup-sync")
            InstallCrontabBackupSync "$2"
            ;;
        "install-backup-old")
            InstallCrontabBackupOld "$2"
            ;;
        "restart")
            echo "Restarting the server..."
            PWServerStop
            sleep "${SLEEP_TIME}" # Waiting for 5 minutes before restarting might be too long for some scenarios. Adjust as needed.
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