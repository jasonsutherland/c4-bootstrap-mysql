#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

password=`sudo grep -m 1 password /etc/mysql/my.cnf| awk '{ print $3 }'`

for i in `ls /var/tmp/*.sql` ; do
    if [ -f ${i} ]
    then
    echo "### inserting sql ###"
       cat $i |mysql -u root -p${password}
    fi ;
done
