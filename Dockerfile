FROM python:3.9-slim
RUN mkdir /app
WORKDIR /app
RUN pwd && ls

ADD requirements.txt /app
RUN pip3 install -r requirements.txt && pip3 install gunicorn

#    && pip install 'poetry==$POETRY_VERSION'
ADD . /app

EXPOSE 5000
ENTRYPOINT ["gunicorn", "--config", "gunicorn_config.py", "app.wsgi:app"]