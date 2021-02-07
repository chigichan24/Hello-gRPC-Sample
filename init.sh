#!/bin/bash

protoc --proto_path=proto --go_out=./go/app/gen --go_opt=paths=source_relative \
  --go-grpc_out=./go/app/gen --go-grpc_opt=paths=source_relative \
  proto/HelloService.proto
