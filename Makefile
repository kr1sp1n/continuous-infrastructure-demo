.PHONY: all build clean test help

clean-machine : ## Clean up any previous machine failures
clean-machine:
	docker-machine stop test || echo "nothing to stop" && \
	docker-machine rm test   || echo "nothing to remove"

help          : ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
