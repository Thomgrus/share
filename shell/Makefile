#####################################
##            VARIABLES            ##
#####################################



#####################################
##              BUILD              ##
#####################################



#####################################
##               TEST              ##
#####################################

build-integration-%:
	@docker build -f $*.dockerfile -t $*-integration .

test-%: ## Test the script init-%.sh
	@echo "Test script init-$*.sh with $* docker image"
	@docker run --rm -it -e LOCAL=/usr/src/app -v $$PWD:/usr/src/app -w /usr/src/app $* sh init-$*.sh

#####################################
##               HELP              ##
#####################################

.PHONY: help
help:
	@grep -E '^[%a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
