from flask import Flask, render_template, json
from flask_mysqldb import MySQL
import os
import db_connector as db


# Configuration

app = Flask(__name__)

host = 'classmysql.engr.oregonstate.edu'
user = 'cs340_yourosid'
pswd = 'yourdbpassword'
dtbs = 'cs340_yourosid'

app.config['MYSQL_HOST'] = host
app.config['MYSQL_USER'] = user
app.config['MYSQL_PASSWORD'] = pswd
app.config['MYSQL_DB'] = dtbs
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

db_connection = db.connect_to_database(host, user, pswd, dtbs)

# Routes 

@app.route('/', methods=['POST', 'GET'])
def index():
    return render_template("index.j2")

@app.route('/facilities', methods=['POST', 'GET'])
def facilities():
    return render_template("facilities.j2")

@app.route('/technologies', methods=['POST', 'GET'])
def technologies():
    return render_template("technologies.j2")

@app.route('/facilitytechnologies', methods=['POST', 'GET'])
def facilitytechnologies():
    return render_template("facilitytechnologies.j2")

@app.route('/fueltypes', methods=['POST', 'GET'])
def fueltypes():
    return render_template("fueltypes.j2")

@app.route('/fuelusages', methods=['POST', 'GET'])
def fuelusages():
    return render_template("fuelusages.j2")

@app.route('/regions', methods=['POST', 'GET'])
def regions():
    return render_template("regions.j2")

# Listener

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 6353))
    app.run(port=port, debug=True)
