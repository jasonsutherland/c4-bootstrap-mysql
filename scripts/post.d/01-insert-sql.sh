#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

password=`sudo grep -m 2 password /etc/mysql/my.cnf | grep -v It | awk '{ print $3 }'`

for i in `ls /var/tmp/c4-bootstrap/sql/*.sql` ; do
    if [ -f ${i} ]
    then
    echo "### inserting sql ###"
       cat $i |mysql -u root
    fi ;
done
## Copy conf with generated password back over local modifications
