#!/bin/bash
# https://www.tecmint.com/configure-ldap-client-to-connect-external-authentication/ 
#with some addition and modification to work on
#installing ldap packages
sudo apt update && sudo apt install -y libnss-ldap libpam-ldap ldap-utils nscd
#configuring ldap  nss(name server switch)
sudo auth-client-config -t nss -p lac_ldap
# we don't have to do it
#sudo pam-auth-update
#not needed for automation
#vim /etc/pam.d/su
#add account file to line
echo "account sufficient pam_succeed_if.so uid = 0 use_uid quiet" >> /etc/pam.d/su
vim /etc/ldap/ldap.conf
#change the base and URI to ur local name and address
getent passwd # on shell
