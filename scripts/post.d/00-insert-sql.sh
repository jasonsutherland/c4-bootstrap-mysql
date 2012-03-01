#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

# If this is an completed ENV these files will contain the content of /var/www/[private|public] and need unpacking
user=`sudo grep -m 1 user /etc/mysql/debian.cnf| awk '{ print $3 }'`
password=`sudo grep -m 1 password /etc/mysql/debian.cnf| awk '{ print $3 }'`

for i in `ls /var/tmp/*.sql` ; do
    if [ -f ${i} ]
    then
    echo "### inserting sql ###"
       cat $i |mysql -u$user -p$password
    fi ;
done
