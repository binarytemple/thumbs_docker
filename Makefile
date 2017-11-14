#@phony build ,push

build:
	docker build --force-rm --build-arg VCS_REF=`git rev-parse --short HEAD` . -t bryanhuntesl/thumbs

push: build
	docker push bryanhuntesl/thumbs

run:
	docker run bryanhuntesl/thumbs
  
 
