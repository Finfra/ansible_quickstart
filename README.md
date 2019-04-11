# Ansible Test Enviroment
## Setting
1. install virtualbox
2. install vagrant
3. execute this commant
```
vagrant up
```
or if u want to set the nodes count.
```
SHARE_PATH=../df NODE_COUNT=4 vagrant up
```
4. connect server 
```
vagrant ssh server-1
vagrant ssh node-0
```

5. test
```
cat /etc/hosts
ansible --version
```


* Note 1: If the subnet does not match, modify the subnet ip in the vagrant file.
* Note 2: The SHARE_PATH Option has not been tested on Windows.