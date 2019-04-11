# Ansible Test Enviroment
## Setting
1. install virtualbox
2. install vagrant
3. execute this commant
```
cd vagrant
vagrant up
```
or if u want to set the nodes count.
```
NODE_COUNT=4 vagrant up
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


* 주의 : Subnet이 맞지 않을 경우 Vagrant파일에서 Subnet ip를 수정해 주세요. 
