################################## Builder ###################################
FROM python:3.9-slim AS builder

WORKDIR /app
RUN pip install poetry==1.1.4
ADD poetry.lock pyproject.toml /app/
RUN poetry config virtualenvs.in-project true &&\
    poetry install --no-dev

################################ Application #################################
FROM python:3.9-slim
ENV TINI_VERSION v0.19.0
ENV GUNICORN_USER hello

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

RUN useradd --create-home ${GUNICORN_USER}
USER ${GUNICORN_USER}
WORKDIR /app
ADD . /app/
COPY --from=builder /app/.venv /app/.venv

ENTRYPOINT ["/bin/tini", "--"]
CMD ["/app/.venv/bin/gunicorn", "app.wsgi:app"]
