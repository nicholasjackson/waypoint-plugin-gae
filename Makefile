PLUGIN_NAME=gae

all: protos build

protos:
	@echo ""
	@echo "Building Protos"

	protoc -I . --go_opt=paths=source_relative --go_out=. ./platform/output.proto ./release/output.proto

build:
	@echo ""
	@echo "Compiling Plugin"

	go build -o ./bin/waypoint-plugin-${PLUGIN_NAME} ./main.go 

install: build
	@echo ""
	@echo "Installing Plugin"

	cp ./bin/waypoint-plugin-${PLUGIN_NAME} ${HOME}/.config/waypoint/plugins/   