# Perfect World Server Installation & Management Script

<div align="center">
  
![Version](https://img.shields.io/badge/version-1.8.9-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
  
</div>

## 📋 Overview

This script provides a comprehensive solution for setting up, managing, and maintaining Perfect World servers. It automates common tasks and provides a consistent interface for server operations.

## ✨ Features

- **Server Management**: Start, stop, and restart server components with a single command
- **Auto-Updates**: Automatically keep the management script up-to-date
- **Database Management**: Tools for backup, restoration, and repair
- **External Backup**: Support for synchronizing backups to remote servers
- **Network Configuration**: Easy firewall management for server ports
- **Multi-service Support**: Configure and control up to 20 GlinkD instances

## 🚀 Quick Start

```bash
git clone https://github.com/halysondev/PWServerInstallScript.git
cd PWServerInstallScript
chmod +x PWServer.sh
./PWServer.sh install
```

## 📝 Configuration

The script uses environment variables for configuration, which can be set in a `configure` file located at `/PWServer/configure`.

### Configure File Explanation

The `configure` file contains all settings for your server, including:

- **Script Settings**: Auto-update behavior
- **Directory Settings**: Server directory locations
- **Port Configuration**: External ports for server services
- **Service Control**: Enable/disable individual services
- **Backup Settings**: Database credentials and backup locations

Here's a sample configuration:

```bash
#PWSERVER CONFIG
export PW_AUTO_UPDATE="true" # Auto-update toggle (set to false to disable auto updates)
#DIR
export PW_SERVER_DIR="PWServer" # Directory for server files and logs
#EXTERNAL PORTS
export PW_PORT_1="29000"
export PW_PORT_2="29001"
export PW_PORT_3="29002"
export PW_PORT_4="29003"
export PW_PORT_5="29004"
export PW_PORT_6="29005"
export PW_PORT_7="29006"
export PW_PORT_8="29007"
export PW_PORT_9="29008"
export PW_PORT_10="29009"
export PW_PORT_11="29010"
export PW_PORT_12="29011"
export PW_PORT_13="29012"
export PW_PORT_14="29013"
export PW_PORT_15="29014"
export PW_PORT_16="29015"
export PW_PORT_17="29016"
export PW_PORT_18="29017"
export PW_PORT_19="29018"
export PW_PORT_20="29019"
#START
export PW_START_GAMED="false"
export PW_START_GLINKD_1="false"
export PW_START_GLINKD_2="false"
export PW_START_GLINKD_3="false"
export PW_START_GLINKD_4="false"
export PW_START_GLINKD_5="false"
export PW_START_GLINKD_6="false"
export PW_START_GLINKD_7="false"
export PW_START_GLINKD_8="false"
export PW_START_GLINKD_9="false"
export PW_START_GLINKD_10="false"
export PW_START_GLINKD_11="false"
export PW_START_GLINKD_12="false"
export PW_START_GLINKD_13="false"
export PW_START_GLINKD_14="false"
export PW_START_GLINKD_15="false"
export PW_START_GLINKD_16="false"
export PW_START_GLINKD_17="false"
export PW_START_GLINKD_18="false"
export PW_START_GLINKD_19="false"
export PW_START_GLINKD_20="false"
export PW_START_GAMEDBD="false"
export PW_START_GFACTIOND="false"
export PW_START_GACD="false"
export PW_START_GDELIVERYD="false"
export PW_START_GAUTHD="false"
export PW_START_UNIQUENAMED="false"
export PW_START_LOGSERVICE="false"
export PW_START_MONITOR="false"
export PW_START_GAMETALKD="false"
#BACKUP
export PW_DB_HOST="127.0.0.1"
export PW_DB_USER="root"
export PW_DB_PASSWORD="1"
export PW_DB_NAME="pw"
export PW_EXTERNAL_BACKUP="false"
export PW_BACKUP_SSH_PASS="1"
export PW_BACKUP_SSH_USER="root"
export PW_BACKUP_SSH_HOST="127.0.0.1"
export PW_BACKUP_DIR="/PWStorage/backup"
export PW_BACKUP_LOG_DIR="/PWStorage/logs"
export PW_BACKUP_STORAGE_DIR="/PWStorage"
export PW_BACKUP_RETENTION_DAYS="5"
export PW_SLEEP_TIME="1"
```

### Server Port Configuration

The script manages network ports for server connections. Important points:

- Each GLINKD instance requires its own port
- Setting a port to `0` will prevent the firewall rules from being applied to that port
- When a port is set to `0`, the corresponding `drop` and `accept` commands will ignore that port

## 🛠️ Command Reference

### Basic Commands

| Command | Description |
|---------|-------------|
| `./PWServer.sh start` | Start the server and all enabled services |
| `./PWServer.sh stop` | Stop all running server services |
| `./PWServer.sh restart` | Restart the server (equivalent to stop followed by start) |
| `./PWServer.sh install` | Install dependencies and prepare the environment |
| `./PWServer.sh help` | Display available commands and their descriptions |

### Maintenance Commands

| Command | Description |
|---------|-------------|
| `./PWServer.sh drop-cache` | Clear system memory cache |
| `./PWServer.sh fixdb` | Repair and optimize the database |
| `./PWServer.sh backup` | Create a backup of the database and server files |
| `./PWServer.sh loadbackup` | Restore server from a backup |
| `./PWServer.sh backup-sync` | Synchronize backups to external server |
| `./PWServer.sh backup-old` | Remove old backup files based on retention period |

### Network Commands

| Command | Description |
|---------|-------------|
| `./PWServer.sh accept` | Apply ACCEPT firewall rules to all GLINKD ports |
| `./PWServer.sh drop` | Apply DROP firewall rules to all GLINKD ports |

### Update Commands

| Command | Description |
|---------|-------------|
| `./PWServer.sh update` | Check for and apply game updates |
| `./PWServer.sh update-script` | Update the management script to the latest version |

### Admin Commands

| Command | Description |
|---------|-------------|
| `./PWServer.sh pwadmin start` | Start the PWAdmin service |
| `./PWServer.sh pwadmin stop` | Stop the PWAdmin service |
| `./PWServer.sh showconfig` | Display the current configuration settings |

## 🔧 Advanced Usage

### Custom Service Configuration

You can customize which services start with the server by editing the corresponding variables in the `configure` file:

```bash
export PW_START_GAMED="true"      # Enable or disable the main game service
export PW_START_GLINKD_1="true"   # Enable or disable GLINKD instance 1
# ... and so on for other services
```

### Backup Management

The script provides comprehensive backup functionality:

```bash
# Create a full backup
./PWServer.sh backup

# Sync backups to external server (requires SSH configuration)
./PWServer.sh backup-sync

# Clean up old backups according to retention policy
./PWServer.sh backup-old
```

### Firewall Management

To manage access to your server ports:

```bash
# Allow connections to all configured GLINKD ports
./PWServer.sh accept

# Block connections to all configured GLINKD ports
./PWServer.sh drop
```

## 📊 Troubleshooting

### Common Issues

1. **Services not starting**: Check the log files in `/{PW_SERVER_DIR}/logs/` for error messages
2. **Database connection problems**: Verify DB credentials in the configure file
3. **Permission issues**: Ensure proper permissions for script execution and server directories

### Log Files

Service logs are stored in `/{PW_SERVER_DIR}/logs/` and can be examined for troubleshooting.

## 🤝 Contributing

Contributions to improve this script are welcome. Please feel free to submit issues or pull requests to the GitHub repository.

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👏 Acknowledgments

- Thanks to all contributors to the Perfect World Server Install Script
- Perfect World community for their feedback and support

---

<div align="center">
  <strong>Made with ❤️ by Halyson Cesar</strong><br>
  <a href="https://github.com/halysondev/PWServerInstallScript">GitHub Repository</a>
</div>