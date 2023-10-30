#!/bin/bash

# create_elasticsearch_7_repo.sh
# chmod +x create_elasticsearch_7_repo.sh
# ./create_elasticsearch_7_repo.sh


# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (with sudo)." 1>&2
    exit 1
fi

# Content for the Elasticsearch repository configuration (Elasticsearch 7.x)
repo_content="[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
"

# Write the repository configuration to /etc/yum.repos.d/elasticsearch.repo
echo "$repo_content" | sudo tee /etc/yum.repos.d/elasticsearch.repo > /dev/null

# Verify the repository configuration file
if [ -e /etc/yum.repos.d/elasticsearch.repo ]; then
    echo "Elasticsearch 7.x repository configuration created at /etc/yum.repos.d/elasticsearch.repo"
else
    echo "Failed to create Elasticsearch 7.x repository configuration." 1>&2
    exit 1
fi
