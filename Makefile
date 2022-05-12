NAME=alesium/openldap
VERSION=1.0

.PHONY:
build:
	docker build -t $(NAME):$(VERSION) .

.PHONY:
tag:
	docker tag $(NAME):$(VERSION) $(NAME):latest
