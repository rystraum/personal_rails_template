#!/bin/bash

echo "Be sure to change this script to use proper settings (ssh address, db username, db name, etc)"

if [ ! -e ".dbpass" ]
  then
    echo "create .dbpass and leave the remote mysql password in there" && exit
fi

PASS=$(cat .dbpass)
ssh git@libro.ph "mysqldump -q -u bookstore -p$PASS bookstore" > backup.sql
rake db:drop
rake db:create
mysql -u root bookstore < backup.sql
