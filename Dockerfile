FROM python:3.9-slim

WORKDIR /code

LABEL org.opencontainers.image.source https://github.com/popsu/fastapi-tutorial

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

# Behind TLS termination proxy pass --proxy-headers like so:
# CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]
