# Perfect World Server Install Script

## Overview

This script is designed to manage and automate the installation and operation of a Perfect World server. It simplifies tasks such as starting, stopping, and updating server components, managing backups, and configuring network settings.

### Features

- **Auto-update**: Automatically checks for and installs updates to the script.
- **Server management**: Provides commands to start, stop, and restart the server.
- **Backup and restore**: Supports creating backups of server data and restoring from them.
- **External backup synchronization**: Allows syncing backups to an external server.
- **Database management**: Includes utilities for database repair and cache management.
- **Network configuration**: Tools for configuring firewall rules to manage server access.

## Installation

To use this script, clone it from the GitHub repository:

```bash
git clone https://github.com/halysondev/PWServerInstallScript.git   \
chmod +x PWServer.sh    \
./PWServer.sh install
````
## Usage
Before running the script, configure the necessary environment variables according to your server setup. This can be done by editing your .bashrc file or exporting them directly in your terminal session.

## Basic Commands
**Start the server:**
````bash
PWServer start
````
**Stop the server:**
````bash
PWServer stop
````
**Restart the server:**
````bash
PWServer restart
````
**Backup server data:**
````bash
PWServer backup
````
**Show commands:**
````bash
PWServer help
````

## Environment Variables
The script supports numerous environment variables for extensive customization and control over the server and backup configurations. Here are a few important ones:

PW_AUTO_UPDATE: Enable or disable automatic script updates.

PW_SERVER_DIR: Directory for server files and logs.

PW_PORT_1 to PW_PORT_4: Port configurations for server services.

PW_DB_HOST, PW_DB_USER, PW_DB_PASSWORD, PW_DB_NAME: Database configurations.

PW_EXTERNAL_BACKUP: Toggle external backup functionality.

PW_BACKUP_DIR, PW_BACKUP_LOG_DIR, PW_BACKUP_STORAGE_DIR: Directories for backups, logs, and storage.

For a full list and explanation of the environment variables, refer to the script comments.

## Contributing
Contributions to the Perfect World Server script are welcome. Please follow the standard fork-and-pull request workflow. If you have any suggestions, bug reports, or contributions, please submit them via GitHub issues or pull requests.

## License
This project is open-sourced under the MIT License. See the LICENSE file for more details.

## Acknowledgments
Thanks to all the contributors and users of the PWServerInstallScript.
Perfect World community for the invaluable feedback and support.
For more information and updates, visit the project repository on GitHub.