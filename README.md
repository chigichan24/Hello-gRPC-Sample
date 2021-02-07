# Hello-gRPC-Sample

## tree

```
Hello-gRPC-Sample
├── go/
│   ├── app/
│   │   ├── gen/ // Copied from protoc command *.pb.go
│   │   └── main.go
│   └── README.md
├── swift/
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