image := neosapience/kustomize

build:
	docker build -t ${image} .

push:
	docker push ${image}

sh:
	docker run --rm -it ${image} bash

ls:
	docker image ls ${image}