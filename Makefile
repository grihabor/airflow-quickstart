.PHONY: all
all: up

.PHONY: update-constraints
update-constraints:
	pip-compile \
		--verbose \
		--resolver=backtracking \
		--strip-extras \
		--no-emit-index-url \
		-o constraints.txt \
		requirements.txt 

.PHONY: build
build:
	docker compose build base

.PHONY: up
up: build
	docker compose --profile flower up -d 

.PHONY: down
down:
	docker compose --profile flower down
