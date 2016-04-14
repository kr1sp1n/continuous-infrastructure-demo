.PHONY: all build clean test help

clean-machine : ## Clean up any previous machine failures
clean-machine:
	docker-machine stop test || echo "nothing to stop" && \
	docker-machine rm --force test || echo "nothing to remove"

machine       : ## Use docker-machine to create and configure 'test' environment
machine:
	docker-machine --debug create --driver virtualbox test
	eval "$(docker-machine env test)"

hello         : ## git clone hello service
hello:
	git clone git@github.com:kr1sp1n/service-hello.git build/hello

compose       : ## Use docker-compose to pull and build new images and containers
compose:
	docker-compose -p demo up -d

help          : ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
