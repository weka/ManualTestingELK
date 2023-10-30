#!/bin/bash

# run_scripts.sh
# chmod +x run_scripts.sh
# ./run_scripts.sh


# Run the "create_elasticsearch_7_repo" script
# chmod +x ~/elk_sh/create_elasticsearch_7_repo.sh
./elk_sh/create_elasticsearch_7_repo.sh

# Run the "create_kibana_7_repo" script
# chmod +x ~/elk_sh/create_kibana_7_repo.sh
./elk_sh/create_kibana_7_repo.sh

# Run the "install_java_elk_kibana" script
# chmod +x ~/elk_sh/install_java_elk_kibana.sh
./elk_sh/install_java_elk_kibana.sh


# Run the "change_elasticsearch_and_kibana_configuration" script for update elasticsearch and kibana configuration
# chmod +x ~/elk_sh/change_elasticsearch_and_kibana_configuration.sh
./elk_sh/change_elasticsearch_and_kibana_configuration.sh


# Run the "upload_saved_object_template" script
# chmod +x ~/elk_sh/upload_saved_object_template.sh
sleep 15
./elk_sh/upload_saved_object_template.sh

# Print the Kibana URL home page
my_ip_addr=$(ip -o -4 addr show $(ip route get 8.8.8.8 | awk '{print $5; exit}') | awk '{print $4}' | cut -d '/' -f 1)
echo "http://$my_ip_addr:5601/app/home#/"
