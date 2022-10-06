# FastAPI dockerized

Initial code and dockerfile skeleton from https://fastapi.tiangolo.com/deployment/docker/

## Instructions

Build:

```shell
make build
```

Run (exposed on port 8080):

```shell
make run
```

Push (to ghcr.io):

```shell
# login to ghcr.io using $GITHUB_GHCR_PAT as token
make ghcr-login
make push
```
