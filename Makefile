.PHONY: clean, build, push

build:
	docker build --force-rm --build-arg VCS_REF=`git rev-parse --short HEAD` . -t bryanhuntesl/thumbs

push: build
	docker push bryanhuntesl/thumbs

run: build
	docker run -p8080:8080 bryanhuntesl/thumbs
  
 
