#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "hello, world!"

app.config['DEBUG'] = True

if __name__ == "__main__":
    # use 0.0.0.0 to use it in container
    app.run(host='0.0.0.0')
