VERSION = v0.0.1

.PHONY: run
run:
	docker run -p 8090:8090 piotrzan/pocketbase:$(VERSION)

.PHONY: push
push:
	docker push piotrzan/pocketbase:$(VERSION)
