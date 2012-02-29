#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

# Script to install mysql

apt-get update
#
# Install and configure Mysql
#
if $(dpkg -s mysql-server > /dev/null 2>&1) ; then 
    echo "mysql already exists, exiting"
else
        juju-log "installing mysql-server"
        #apt-get -y install -qq mysql-server
        # Generate a strong password for the mysql service, using /dev/urandom
        password=`pwgen 20 1`

        # Store the password for later use by the db-relation-changed hook for
        # this service unit. As a general note, for data that service units do
        # not need to share, simply use the machine's local file store.
        sudo echo $password > /etc/mysql/mysql.root.passwd

        echo mysql-server-5.1 mysql-server/root_password password $password | debconf-set-selections
        echo mysql-server-5.1 mysql-server/root_password_again password $password | debconf-set-selections

        echo "mysql-server settings preseeded, now installing via apt-get"
        DEBIAN_FRONTEND=noninteractive apt-get -y install -qq mysql-server
fi

