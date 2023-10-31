#!/bin/bash

# install_java_elk_kibana.sh
# chmod +x install_java_elk_kibana.sh
# ./install_java_elk_kibana.sh

echo install_java_elk_kibana.sh


## Update package manager repositories
# sudo apt update  # For Debian/Ubuntu
## Or
## sudo yum makecache fast  # For CentOS/Red Hat

## Install Java
echo Install Java
sudo yum install -y java-11-openjdk-devel  # For Debian/Ubuntu

## Install Elasticsearch
echo Install Elasticsearch
## sudo apt install -y elasticsearch  # For Debian/Ubuntu
## Or
sudo yum install -y elasticsearch  # For CentOS/Red Hat

## Install Logstash
# echo Install Logstash
## sudo apt install -y logstash  # For Debian/Ubuntu
## Or
## sudo yum install -y logstash  # For CentOS/Red Hat

## Install Kibana
echo Install Kibana
## sudo apt install -y kibana  # For Debian/Ubuntu
## Or
sudo yum install -y kibana  # For CentOS/Red Hat

## Start Elasticsearch, Logstash, and Kibana services
echo Start Elasticsearch and Kibana services
sudo systemctl start elasticsearch
## sudo systemctl start logstash
sudo systemctl start kibana

## Enable services to start on boot
echo Enable services to start on boot
sudo systemctl enable elasticsearch
## sudo systemctl enable logstash
sudo systemctl enable kibana


# Check if Elasticsearch is running script
echo Check if Elasticsearch is running script
curl -X GET "http://localhost:9200/"
