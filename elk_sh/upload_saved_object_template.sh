#!/bin/bash

# upload_saved_object_template.sh
# chmod +x upload_saved_object_template.sh
# ./upload_saved_object_template.sh


my_ip_addr=$(ip -o -4 addr show $(ip route get 8.8.8.8 | awk '{print $5; exit}') | awk '{print $4}' | cut -d '/' -f 1)

file_path=$(realpath ~/elk_sh/export.ndjson)
curl -X POST "http://$my_ip_addr:5601/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@"$file_path"
