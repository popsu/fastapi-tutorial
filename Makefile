.DEFAULT_GOAL := help

# Change these 2 if different user and/or repository
GITHUB_USERNAME := popsu
DOCKER_IMAGE := ghcr.io/popsu/fastapi-tutorial

DOCKER_TAG := $(shell ./version.sh)
DOCKER_IMAGETAG := ${DOCKER_IMAGE}:${DOCKER_TAG}

LOCAL_PORT := 8080

.PHONY: help
help: ## This help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build docker image
	docker build -t ${DOCKER_IMAGETAG} .

run: ## Run
	docker run --rm -p 8080:80 ${DOCKER_IMAGETAG}

ghcr-login: ## Login to ghcr.io using $GITHUB_GHCR_PAT as token
	@echo ${GITHUB_GHCR_PAT} | docker login ghcr.io \
		-u ${GITHUB_USERNAME} --password-stdin

push: ## Push Docker image to GitHub Container Registry
	docker push ${DOCKER_IMAGETAG}
