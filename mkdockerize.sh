#!/bin/bash

if [ "$1" == "produce" ];
then echo "This will produce the website";
elif [ "$1" == "serve" ];
then "This will serve the website"
else
exit
fi
