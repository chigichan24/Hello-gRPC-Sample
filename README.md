# Hello-gRPC-Sample

## tree

```
Hello-gRPC-Sample
├── go/
│   ├── app/
│   │   ├── gen/ // Copied from protoc command
│   │   └── main.go
│   └── README.md
├── swift/
│   ├── helloServiceClient/
│   │   └── data/
│   │       └── gen/ // Copied from protoc command
│   └── README.md
├── proto/
│   └── HelloSrvice.proto
├── init.sh // run protoc command
└── README.md

```

## develop

### initial

```
chmod +x init.sh && \
./init.sh
```

### update proto files

1. Remove `*.pb.*` files

2. run `./init.sh`