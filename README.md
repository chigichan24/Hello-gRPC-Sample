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
├── Makefile // run protoc command
└── README.md
```

## develop

### initial

```
make init
```

### update proto files

```
make update
```

#### When go files only

```
make update-go
```

#### When swift files only

```
make update-swift
```