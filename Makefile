.PHONY: all build clean test help

clean-machine : ## Clean up any previous machine failures
clean-machine:
	docker-machine stop test && \
	docker-machine rm --force test

machine       : ## Use docker-machine to create and configure 'test' environment
machine:
	docker-machine --debug create --driver virtualbox test
	eval "$(docker-machine env test)"

help          : ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
