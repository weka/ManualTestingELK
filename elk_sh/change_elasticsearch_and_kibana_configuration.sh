#!/bin/bash

# change_elasticsearch_and_kibana_configuration.sh
# chmod +x change_elasticsearch_and_kibana_configuration.sh
# ./change_elasticsearch_and_kibana_configuration.sh


my_ip_addr=$(ip -o -4 addr show $(ip route get 8.8.8.8 | awk '{print $5; exit}') | awk '{print $4}' | cut -d '/' -f 1)

# Elasticsearch Configuration
echo Elasticsearch Configuration
sudo systemctl stop elasticsearch
sed -i 's/#network.host: 192.168.0.1/network.host: '"$my_ip_addr"'/g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#discovery.seed_hosts: \["host1", "host2"\]/discovery.seed_hosts: \["127.0.0.1", "\[::1\]", "'"$my_ip_addr"'" \]/g' /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch

# Kibana Configuration
echo Kibana Configuration
sudo systemctl stop kibana
sed -i 's/#server.host: "localhost"/server.host: "'"$my_ip_addr"'"/g' /etc/kibana/kibana.yml
sed -i "s/#elasticsearch.hosts: \[\"http:\/\/localhost:9200\"\]/elasticsearch.hosts: \[\"http:\/\/$my_ip_addr:9200\"\]/g" /etc/kibana/kibana.yml
sudo systemctl start kibana

# Check Elasticsearch and Kibana Status
echo Check Elasticsearch and Kibana Status
#sudo systemctl status elasticsearch
systemctl status elasticsearch | tail -n+1
curl -X GET "http://$my_ip_addr:9200/"
#sudo systemctl status kibana
sudo systemctl status kibana | tail -n+1
