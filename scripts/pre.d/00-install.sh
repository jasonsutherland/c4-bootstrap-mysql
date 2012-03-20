#!/bin/bash
#### DON NOT EDIT THIS SCRIPT CREATE NEW SCRIPTS AS DESCRIBED IN THE DOCS ####

# Script to install mysql

apt-get update
apt-get -y install pwgen
#
# Install and configure Mysql
#
if $(dpkg -s mysql-server > /dev/null 2>&1) ; then 
    echo "mysql already exists, exiting"
else
        echo "installing mysql-server"
        #apt-get -y install -qq mysql-server
        # Generate a strong password for the mysql service, using /dev/urandom
        password=`pwgen -s 20 1`

		#store for use in the install script
        echo mysql-server-5.1 mysql-server/root_password password $password | debconf-set-selections
        echo mysql-server-5.1 mysql-server/root_password_again password $password | debconf-set-selections

        echo "mysql-server settings preseeded, now installing via apt-get"
        DEBIAN_FRONTEND=noninteractive apt-get -y install -qq mysql-server
fi

