import os
from flask import Flask, render_template, redirect, request, session, abort
from flask_sqlalchemy import SQLAlchemy
from flaskext.mysql import MySQL
import numpy as np
from sqlalchemy import text

app = Flask(__name__)
config = {
        'host': 'localhost',
        'database': 'myUC', # we got db as an argument
        'user': 'root',
        'password': '',
        'port': '3306' # change the port to match the port your SQL server is running on
    }
DATABASE_URI = "mysql://{}:{}@127.0.0.1:{}/{}".format(config['user'], config['password'], config['port'], config['database'])
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db=SQLAlchemy(app)

@app.route('/')		
def index():
    return render_template('landing.html')

@app.route('/landing')    
def login():
    return render_template('login.html')

@app.route('/register')    
def register():
    return render_template('login.html')

@app.route('/login')    
def user():
    return render_template('register.html')
    

    
 
if __name__ == "__main__":
    app.debug = True
    
    host = os.environ.get('IP', '0.0.0.0')
    port = int(os.environ.get('PORT', 8080))
    app.logger.info("Starting flask app on %s:%s", host, port)
    
    app.run(host='0.0.0.0', port=8080)