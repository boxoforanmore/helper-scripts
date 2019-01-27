#!/bin/bash

##  Prompt for the name of the app
read -p "What is the name of your app? => " appname
echo "Creating basic Flask app with the name $appname"

echo "Navigating into new app folder"
mkdir $appname
cd $appname

echo
echo

## Choose the local python path
PYTHON=$(which python3)

## Prompt the user if they want to use a venv
read -n1 -p "Use a venv? [y,n] => "  mkvenv
case $mkenv in
  y|Y)
    echo
    echo "Creating venv..."
    echo
    source $PYTHON -m venv venv
    echo
    echo "Entering venv..."
    `source ./venv/bin/activate`
    `pip install flask`
    `export FLASK_APP=$appname.py` ;;
  n|N)
    echo
    echo "Moving along without setting up a virtual environment..." ;;
esac

echo
## Create the scaffolding for the app
echo "Creating the directory environment for the app"
mkdir app
echo "from app import app" >> "$appname.py"

echo "from flask import Flask

app = Flask(__name__)

from app import routes" >> app/__init__.py

echo "from flask import render_template
from app import app

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')" >> app/routes.py

mkdir app/templates
echo "<h1>Hello, World!</h1>" >> app/templates/index.html

source venv/bin/activate
echo
echo 
echo
echo "Run flask app with: 'flask run'"
echo 
echo "To use this command in the future, begin session with: "
echo "export FLASK_APP=$appname.py"
