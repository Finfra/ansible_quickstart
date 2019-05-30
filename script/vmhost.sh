#!/bin/bash
echo "
LANG=en_US.utf-8
LC_ALL=en_US.utf-8
">/etc/environment

# install package
yum install -y tree
yum install -y net-tools

# enable login by password

x=$(cat /etc/ssh/sshd_config|grep "^PasswordAuthentication yes")
if [ ${#x} -eq 0 ]; then
    echo "PasswordAuthentication yes">>/etc/ssh/sshd_config
    cat /etc/ssh/sshd_config | sed 's/^PasswordAuthentication no/PasswordAuthentication yes/g' > /tmp/sshd_config
    rm  -f  /etc/ssh/sshd_config
    cp -rf /tmp/sshd_config /etc/ssh/sshd_config
    systemctl restart sshd
fi


