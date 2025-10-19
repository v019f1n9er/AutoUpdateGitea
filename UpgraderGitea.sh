#!/bin/bash

# +----------------------------------------------------------------------------------------+
# | This script is written in Bash and is designed to check for a new version of Gitea and |
# | automatically upgrade the program if a new version is found.                           |
# +----------------------------------------------------------------------------------------+

VERSION_FILE="version.txt"
NEW_VERSION=$(python3 HTML_Parser.py)

if [ -f "$VERSION_FILE" ]; then
    OLD_VERSION=$(cat "$VERSION_FILE")
else
    OLD_VERSION=""
fi

if [ "$NEW_VERSION" != "$OLD_VERSION" ]; then
    echo "A new version of Gitea has been found: $NEW_VERSION"
    systemctl stop gitea.service 
    sudo wget -O /tmp/gitea https://dl.gitea.io/gitea/"$NEW_VERSION"/gitea-"$NEW_VERSION"-linux-amd64
    sudo mv /tmp/gitea /usr/local/bin
    sudo chmod +x /usr/local/bin/gitea
    systemctl restart gitea.service
    echo "$NEW_VERSION" > "$VERSION_FILE"
else
    echo "No new versions found on Gitea"
fi
