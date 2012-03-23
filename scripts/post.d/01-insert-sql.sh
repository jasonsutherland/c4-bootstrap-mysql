#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

## Copy conf with generated password back over local modifications
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.old
cp /etc/mysql/my.cnf.bootstrap /etc/mysql/my.cnf

for i in `ls /var/tmp/c4-bootstrap/sql/*.sql` ; do
    if [ -f ${i} ]
    then
    echo "### inserting sql ###"
       cat $i |mysql -u root
    fi ;
done
## Copy conf with generated password back over local modifications
