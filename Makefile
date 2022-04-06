IMAGE := p4-tutorial
CONTAINER := p4-tutorial
WORKDIR := /home/p4/tutorials

build:
	docker build -t $(IMAGE) .

run:
	docker run \
	--name $(CONTAINER) \
	-e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v `pwd`/tutorials:$(WORKDIR) -w $(WORKDIR) \
	-it --rm --privileged $(IMAGE) bash

join:
	docker exec -it $(CONTAINER) bash
