#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
import datetime

from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    d = str(datetime.datetime.now())
    hello = "Hello! It's " + d
    return hello

app.config['DEBUG'] = False

if __name__ == "__main__":
    # use 0.0.0.0 to use it in container
    app.run(host='0.0.0.0')
