#!/usr/bin/python

from flask import Flask
from waitress import serve
from os import environ
app = Flask(__name__)
app.config['COMMIT_SHA'] = environ.get('COMMIT_SHA')

@app.route('/')
def home():
    return "Success!"

@app.route('/ping')
def ping():
    return "Ok"

@app.route('/commit')
def commit():
    return app.config['COMMIT_SHA']

if __name__ == '__main__':
    serve(app)