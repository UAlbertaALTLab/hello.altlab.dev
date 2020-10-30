FROM python:3.9-slim
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app
RUN pip3 install -r requirements.txt

#    && pip install 'poetry==$POETRY_VERSION'
ADD . /app

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

EXPOSE 5000
ENTRYPOINT ["gunicorn", "--config", "/entrypoint.sh", "gunicorn_config.py", "app.wsgi:app"]