DOCKER_IMAGE=louisun/chalkist
TAG=v.1.0.0

.PHONY: build

build:
	docker build -t ${DOCKER_IMAGE}:${TAG} .

run:
	docker run --rm -p 2051:8080 ${DOCKER_IMAGE}:${TAG}

push:
	docker push ${DOCKER_IMAGE}:${TAG}