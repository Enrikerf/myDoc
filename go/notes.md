I have a docker-composer with a shared volume: /hombe/user/workspace:/home/ubuntu/app

inside the docker container are defined the following environment variables:

GOROOT = /home/ubuntu/app/golang/goroot/go
GOPATH = /home/ubuntu/app/golang/gopath

the src folder with all the Golang source code is: /home/ubuntu/app/src
the main file is in /home/ubuntu/app/src/main.go

and go mod tidy is giving an error because relative paths