.phony: build_and_run build

WORK = ${PWD}/testdata:/work

build_and_run:
	docker build -t temphia_buildpack .
	docker run -it --rm -v ${WORK}  temphia_buildpack cat apple.txt

build:
	docker build -t temphia_buildpack .