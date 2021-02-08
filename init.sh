#!/bin/bash

protoc --proto_path=proto --go_out=./go/app/gen --go_opt=paths=source_relative \
  --go-grpc_out=./go/app/gen --go-grpc_opt=paths=source_relative \
  proto/HelloService.proto

protoc proto/HelloService.proto \
  --swift_out=./swift/helloServiceClient/data/gen --swift_opt=Visibility=Public \
  --grpc-swift_out=./swift/helloServiceClient/data/gen --grpc-swift_opt=Visibility=Public,Server=false,Client=true,TestClient=true
