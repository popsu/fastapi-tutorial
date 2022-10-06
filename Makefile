.DEFAULT_GOAL := help

DOCKER_IMAGE := ghcr.io/popsu/fastapi-tutorial
DOCKER_TAG := latest
DOCKER_FULL=${DOCKER_IMAGE}:${DOCKER_TAG}

LOCAL_PORT := 8080


.PHONY: help
help: ## This help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build docker image
	docker build -t ${DOCKER_FULL} .

run: ## Run
	docker run -p 8080:80 ${DOCKER_FULL}

run-force: build run ## Build and run
