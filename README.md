# svc-helloworld
hello in go

## Usage

Run without compiling

 ```
 go run main.go
 ```

Building and running an executable
 ```
 go build
 ./go-helloworld
 ```

Running in docker
 ```
 docker build -t go-helloworld .
 docker run -d --name go-helloworld -p 7800:7800 go-helloworld
```

Open a browser with URL `localhost:7800`