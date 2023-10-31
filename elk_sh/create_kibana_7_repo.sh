#!/bin/bash

# create_kibana_7_repo.sh
# chmod +x create_kibana_7_repo.sh
# ./create_kibana_7_repo.sh


echo create_kibana_7_repo.sh


# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (with sudo)." 1>&2
    exit 1
fi

# Content for the Kibana 7.x repository configuration
repo_content="[kibana]
name=Kibana repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
"

# Write the repository configuration to /etc/yum.repos.d/kibana.repo
echo "$repo_content" | sudo tee /etc/yum.repos.d/kibana.repo > /dev/null

# Verify the repository configuration file
if [ -e /etc/yum.repos.d/kibana.repo ]; then
    echo "Kibana 7.x repository configuration created at /etc/yum.repos.d/kibana.repo"
else
    echo "Failed to create Kibana 7.x repository configuration." 1>&2
    exit 1
fi
