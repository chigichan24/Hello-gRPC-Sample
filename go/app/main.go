package main

import (
	"context"
	"crypto/sha512"
	"encoding/hex"
	"fmt"
	"log"
	"net"

	pb "local.packages/gen"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	fmt.Println("Launch app🚀")
	lis, err := net.Listen("tcp", "0.0.0.0:5300")
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	pb.RegisterHelloServiceServer(s, &server{})
	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

type server struct {
	pb.UnimplementedHelloServiceServer
}

func (*server) Hello(ctx context.Context, req *pb.HelloRequest) (*pb.HelloResponse, error) {

	name := req.GetName()
	fmt.Println("\nreturn: Hello " + name + "👋")
	res := &pb.HelloResponse{
		Hello: "Hello " + name + "👋",
	}
	return res, nil
}

func (*server) Crypto(ctx context.Context, req *pb.CryptoRequest) (*pb.CryptoResponse, error) {
	raw := req.GetValue()
	c := sha512.Sum512([]byte(raw))
	crypted := hex.EncodeToString(c[:])
	fmt.Println("\nraw value: " + raw)
	fmt.Println("crypted value: " + crypted)
	res := &pb.CryptoResponse{
		Result: crypted,
	}
	return res, nil
}
