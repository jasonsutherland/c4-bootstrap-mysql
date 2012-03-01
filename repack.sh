#!/bin/bash

password=`sudo grep -m 1 password /etc/mysql/debian.cnf| awk '{ print $3 }'`

supported_dist="Ubuntu"
supported_vers="10.04"

working_dirs=( /etc/mysql/ )
files_tmp="files/var/tmp/c4-bootstrap-mysql"
timestamp=`date --utc +%s`

function check_env {
    distro=`lsb_release -i | awk -F " " '{ print $3 }'`
    version=`lsb_release -r | awk -F " " '{ print $2 }'`
    echo "### Checking System ###"
    if [[ -n ${version} && ${version} == ${supported_vers} && ${distro} == ${supported_dist} ]]
    then
        echo "${distro} ${version} matches supported versions"
        echo "### DONE ###"
    else
        echo "### ERROR: System not Supported you need to be running ${supported_dist} ${supported_vers} ###"
        exit 0
    fi
}

function git_upload {
    read -p "write 'Have you updated your Git Repo settings' (y/N)? "
    if [[ "$REPLY" == "y" || "$REPLY" == "Y" ]]
    then
        echo "### Prepreping Git for upload ###"
        echo "git add *"
        git commit -m "${timestamp}"
        git push
    else
        echo "### ERROR: Failed to upload to Git ###"
        exit 0
    fi    
}

function suck_files {
	echo "### dumping mysql"
	for i in `mysql -uroot -p${password} --execute="SHOW Databases " --skip-column-names -s`
	do 
		mysqldump -uroot -p${password} $i > $files_tmp/${i}.sql
	done

	
    for var in "${working_dirs[@]}"
    do
        if [[ -d ${var} ]]
        then
            echo "### Pulling in content from ${var} ###"
                sudo cp -Rfp ${var} ${files_tmp}/${var}
        else
            echo "### WARNING: Directory ${var} does not exist! ###"
        fi
    done
}

check_env
suck_files
git_upload
