#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

# If this is an completed ENV these files will contain the content of /var/www/[private|public] and need unpacking

for i in `ls /var/tmp/*.sql` ; do
    if [ -f ${i} ]
    then
    echo "### inserting sql ###"
       cat $i |mysql -uroot -p `cat /root/mysql.root.passwd`
    fi ;
done
