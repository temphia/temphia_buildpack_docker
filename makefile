.phony: build_and_run build

WORK = ${PWD}/testdata:/work

build_and_run:
	docker build -t temphia_buildpack . && docker run -it --rm -v ${WORK}  temphia_buildpack bash

build:
	docker build -t temphia_buildpack .