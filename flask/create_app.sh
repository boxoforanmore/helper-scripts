#!/bin/bash

##  Prompt for the name of the app
clear
read -p "What is the name of your app? => " appname
echo "Creating basic Flask app with the name $appname"
mkdir $appname
cd $appname
echo "In directory => $appname"
echo
echo


# Create the venv and load it with the flask library
echo "Creating venv..."
echo 
python3 -m venv venv
echo
source ./venv/bin/activate
pip install --upgrade pip
pip install flask
export FLASK_APP=$appname.py
echo


## Create the scaffolding for the app
mkdir app


# Main file to run (what the flask run looks at)
echo "from app import app" >> "$appname.py"


# The launcher
echo "from flask import Flask

app = Flask(__name__)

from app import routes" >> app/__init__.py


# The router
echo "from flask import render_template
from app import app

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')" >> app/routes.py
clear


# The html files for the main page
mkdir app/templates
echo "<h1>Hello, World!</h1>" >> app/templates/index.html
clear

echo "###############################################################"
echo
echo "Enter the working directory with => 'cd $appname'"
echo 
echo "Launch virtual environment with => 'source ./venv/bin/activate'"
echo
echo "To use the flask command, begin session with: "
echo "export FLASK_APP=$appname.py"
echo 
echo "Run flask  app  with => 'flask run'"
echo
