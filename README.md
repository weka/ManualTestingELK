# Instructions

---

### From Local Laptop:

#### Step 1 - create a new dir and clone the repo from github:
```
pdsh -R ssh -w '<HOSTNAME>' "mkdir -p ~/ManualTestingELK && git clone https://github.com/weka/ManualTestingELK.git ~/ManualTestingELK"
```

###
#### Step 2 - set permissions:
```
pdsh -R ssh -w '<HOSTNAME>' "chmod -R +x ~/ManualTestingELK/elk_sh/"
```
*pdsh -R ssh -w 'ELK-ManualTest-0' "chmod -R +x ~/ManualTestingELK/elk_sh/"*

#

---

### From Remote Server:
#### Step 1 - change directory:
```
cd ~/ManualTestingELK
```

###
#### Step 2 - execute the script:
```
./elk_sh/run_scripts.sh
```

#

---

### Debugging (From Remote Server):
#### Check if elasticsearch is up:
```
```
my_ip_addr=$(ip -o -4 addr show $(ip route get 8.8.8.8 | awk '{print $5; exit}') | awk '{print $4}' | cut -d '/' -f 1)
curl -X GET "http://$my_ip_addr:9200/"
```

###
