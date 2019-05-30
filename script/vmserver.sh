#!/bin/bash



# install package
yum install -y ansible
yum install -y git
yum -y install vim-enhanced
echo "alias vi=vim">>/etc/profile
echo 'autocmd FileType yaml setlocal ai ts=2 sw=2 et' >>/etc/vimrc
