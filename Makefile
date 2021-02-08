.DEFAULT_GOAL := help
SHELL=/bin/bash

.PHONY: help
help:
	@echo "Usage: "
	@echo "	make init		...	init proto files all"
	@echo "	make update		...	update proto generated files"
	@echo "	make update-go		...	update .go files only"
	@echo "	make update-swift	...	update .swift files only"
	@echo "	make clean-go		...	delete .go files which related in proto generated"
	@echo "	make clean-swift	... 	delete .swift files which related in proto generated"
	@echo ""

.PHONY: update-go update-swift
init: update-go update-swift

.PHONY: init
update: init

.PHONY: clean-go
update-go: clean-go
	protoc --proto_path=proto --go_out=./go/app/gen --go_opt=paths=source_relative \
  --go-grpc_out=./go/app/gen --go-grpc_opt=paths=source_relative \
  proto/HelloService.proto

.PHONY: clean-swift
update-swift: clean-swift
	protoc proto/HelloService.proto \
  --swift_out=./swift/helloServiceClient/data/gen --swift_opt=Visibility=Public \
  --grpc-swift_out=./swift/helloServiceClient/data/gen --grpc-swift_opt=Visibility=Public,Server=false,Client=true,TestClient=true

clean-go:
	rm -rf ./go/app/gen/*.go

clean-swift:
	rm -rf ./swift/helloServiceClient/data/gen/*

