#!/bin/bash

## Backup the DB for later use

mysqldump -u root -p --all-databases > ../../files/var/tmp/c4-bootstrap/sql/all_dbs.sql
