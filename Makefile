IMAGE := p4-tutorial
CONTAINER := p4-tutorial
WORKDIR := /home/p4/tutorials

build:
	docker build -t $(IMAGE) .

run:
	docker run \
	--name $(CONTAINER) \
	-v `pwd`/tutorials:$(WORKDIR) -w $(WORKDIR) \
	-it --rm --privileged $(IMAGE) bash

join:
	docker exec -it $(CONTAINER) bash
