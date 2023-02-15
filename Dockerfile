# FROM python:3.9-slim
FROM python:3.9-buster

WORKDIR /code

LABEL org.opencontainers.image.source https://github.com/popsu/fastapi-tutorial
# Fix from git tag
LABEL org.opencontainers.image.revision 0000000000000000000000000000000000012345

# DD version
# https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/?tab=docker
ENV DD_SERVICE "fastapi-test"
ENV DD_VERSION "0.0.1"
LABEL com.datadoghq.tags.service="fastapi-test"
LABEL com.datadoghq.tags.version="0.0.1"

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
