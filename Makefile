IMAGE := p4-tutorial
WORKDIR := /home/p4/tutorials

build:
	docker build -t $(IMAGE) .

run:
	docker run -v `pwd`/tutorials:$(WORKDIR) -w $(WORKDIR) \
	-it --rm --privileged $(IMAGE)
