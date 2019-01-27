#!/bin/bash

## Run this script with an argument of the name of the app you would like to create

read -p "What is the name of your app?" appname
echo "Creating basic Flask app with the name $appname"

mkdir $appname

echo
echo

## Prompt the user if they want to use a venv
read -n1 -p "Use a venv? [y,n]"  mkvenv
case $mkenv in
  y|Y) echo "Creating venv..." `python3 -m venv venv` ;;
  n|N) echo "Moving along..." ;;
  *) echo "Input not identified, skipping venv..." ;;
esac



