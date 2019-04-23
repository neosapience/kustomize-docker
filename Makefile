image := neosapience/kustomize

build:
	docker build -t ${image} .

push:
	docker push ${image}
