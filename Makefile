.PHONY: run run_interactive build exec remove push
VERSION = v0.0.1

run:
	docker run --name pocketbase $(ARGS) -p 8090:8090 piotrzan/pocketbase:$(VERSION)

run_interactive:
	docker run -it --rm --name pocketbase $(ARGS) -p 8090:8090 piotrzan/pocketbase:$(VERSION) sh

build:
	docker build -t piotrzan/pocketbase:$(VERSION) .

exec:
	docker exec -it pocketbase sh

remove:
	docker stop pocketbase 
	docker rm pocketbase

push:
	docker push piotrzan/pocketbase:$(VERSION)
