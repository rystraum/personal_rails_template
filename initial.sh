#!/bin/bash

if [ -z $1 ] 
  then 
    echo "You have to pass in a name" && exit
fi

echo "changing Template to $1"
find . -name "*" -type f -print | xargs sed -i "s/Template/$1/g"
