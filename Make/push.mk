.PHONY: push stable latest

push:
	docker push ${REGISTRY}/${PROJECT}

latest:
	docker tag ${PROJECT}:b${BUILD} ${REGISTRY}/${PROJECT}:latest

stable:
	docker tag ${REGISTRY}/${PROJECT}:`cat VERSION` ${REGISTRY}/${PROJECT}:stable
