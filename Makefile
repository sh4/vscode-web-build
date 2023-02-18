DOCKER := $(shell { command -v podman || command -v docker; })

.PHONY: all clean

all:
	$(DOCKER) build --tag vscode-web-build --file Dockerfile .
	$(DOCKER) run --rm -it --name vscode-web-build -v ./:/app vscode-web-build

clean:
	git clean -xdf .
	$(DOCKER) image rm vscode-web-build
