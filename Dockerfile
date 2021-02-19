# Build the project:
FROM python:3.9-slim

WORKDIR /app
# TODO: pin poetry version?
RUN pip install poetry==1.1.4
ADD poetry.lock pyproject.toml /app/
RUN poetry config virtualenvs.in-project true &&\
    poetry install --no-dev

CMD ["/bin/bash"]
