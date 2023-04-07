.PHONY: all build push
include ./docker/.env

APP_NAME ?= reddit
TAG ?= latest

all: build push

build:
	docker build -t $(APP_NAME)_post:$(TAG) ./src/post-py
	docker build -t $(APP_NAME)_comment:$(TAG) ./src/comment
	docker build -t $(APP_NAME)_ui:$(TAG) ./src/ui
	docker build -t $(APP_NAME)_prometheus:$(TAG) ./monitoring/prometheus

push:
	cat ./docker/docker_password.txt | docker login -u $(USERNAME) --password-stdin
	docker push $(APP_NAME)_post:$(TAG)
	docker push $(APP_NAME)_comment:$(TAG)
	docker push $(APP_NAME)_ui:$(TAG)
	docker push $(APP_NAME)_prometheus:$(TAG)
