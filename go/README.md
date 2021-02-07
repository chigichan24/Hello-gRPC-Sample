# Hello👋 Service Server

## example

```
% evans --port 5300 -r                                                                                             
  ______
 |  ____|
 | |__    __   __   __ _   _ __    ___
 |  __|   \ \ / /  / _. | | '_ \  / __|
 | |____   \ V /  | (_| | | | | | \__ \
 |______|   \_/    \__,_| |_| |_| |___/

 more expressive universal gRPC client


pb.HelloService@127.0.0.1:5300> call Hello
name (TYPE_STRING) => chigichan24
{
  "hello": "Hello chigichan24👋"
}

pb.HelloService@127.0.0.1:5300>
```

## develop

Before launch server, sync newest version of proto files [more info]().


```
docker-compose up
```
