.phony: build_and_run

WORK = ${PWD}/testdata:/work

build_and_run:
	docker build -t temphia_buildpack .
	docker run -it --rm -v ${WORK}  temphia_buildpack cat work/apple.txt

build:
	docker build -t temphia_buildpack .