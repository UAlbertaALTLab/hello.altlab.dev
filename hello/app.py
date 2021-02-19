import datetime

from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return f"Hello! It's {datetime.datetime.now():%A, %B %d, %Y}\n"


if __name__ == "__main__":
    # use 0.0.0.0 to use it in container
    app.config["DEBUG"] = True
    app.run(host="0.0.0.0")
