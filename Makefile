.PHONY: all build push
include ./docker/.env

TAG ?= latest

all: build push

build:
	docker build -t $(USERNAME)/post:$(TAG) ./src/post-py
	docker build -t $(USERNAME)/comment:$(TAG) ./src/comment
	docker build -t $(USERNAME)/ui:$(TAG) ./src/ui
	docker build -t $(USERNAME)/prometheus:$(TAG) ./monitoring/prometheus

push:
	cat ./docker/docker_password.txt | docker login -u $(USERNAME) --password-stdin
	docker push $(USERNAME)/post:$(TAG)
	docker push $(USERNAME)/comment:$(TAG)
	docker push $(USERNAME)/ui:$(TAG)
	docker push $(USERNAME)/prometheus:$(TAG)
