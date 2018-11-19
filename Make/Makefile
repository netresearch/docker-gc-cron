.PHONY: all docker-image docker-image-nc build build_nc

all: version_build
	make build
	make latest
	make show-images
	echo "=== DONE ==="
	echo "if build succeeded you should now commit your changes, run make push"

include Make/push.mk
include Make/version.mk

show-images:
	docker images ${PROJECT}
	docker images ${REGISTRY}/${PROJECT}

build:
	docker build -t ${PROJECT}:b${BUILD} .

dev: create-dev-dockerfile build-dev

build_nc:
	docker build --no-cache=true -t ${PROJECT}:b${BUILD} .

dev-nc: create-dev-dockerfile build-dev-nocache

create-dev-dockerfile:
	cp Dockerfile Dockerfile.dev
	perl -i~ -0777pe's{#[^\n]*\n}{}g;' Dockerfile.dev
	perl -i~ -0777pe's{ \\\n *&& }{\nRUN }g;' Dockerfile.dev
	perl -i~ -0777pe's{\nRUN cd }{\nWORKDIR }g;' Dockerfile.dev

build-dev:
	docker build -t ${PROJECT}:dev -f Dockerfile.dev .
	rm Dockerfile.dev

build-dev-nocache:
	docker build --no-cache -t ${PROJECT}:dev -f Dockerfile.dev .
	rm Dockerfile.dev
