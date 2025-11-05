.DEFAULT_GOAL := help
PWD := $(shell pwd)

help:
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

setup: ## Init
	cp -n .samples/.env .env
	cp .samples/docker-compose.init.yml docker-compose.init.yml
	cp .samples/docker-compose.yml docker-compose.yml

init: ## Init infra
	./env docker compose -f docker-compose.yml -f docker-compose.init.yml up postgres-init minio-init

run: ## Start all apps in foreground
	./env docker compose up

run-infra: ## Start all infra services in foreground
	./env docker compose up postgres redis minio

start: ## Start all apps in background
	./env docker compose up -d

start-infra: ## Start all infra services in background
	./env docker compose up -d postgres redis minio

stop: ## Stop all apps in background
	./env docker compose stop

clean: ## Cleanup
	rm -f docker-compose.yml docker-compose-init.yml .env
