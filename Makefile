NAME=alesium/openldap
VERSION=1.0
DOCKER_BUILD ?= docker build

.PHONY:
build:
	$(DOCKER_BUILD) -t $(NAME):$(VERSION) .

.PHONY:
tag:
	docker tag $(NAME):$(VERSION) ghcr.io/$(NAME):$(VERSION)
	docker tag $(NAME):$(VERSION) ghcr.io/$(NAME):main

.PHONY:
push: tag
	docker push ghcr.io/$(NAME):$(VERSION)
	docker push ghcr.io/$(NAME):main