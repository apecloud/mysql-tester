.PHONY: all build tidy clean

default: build

build:
	mkdir -p bin
	go build -o ./bin ./...
	mv bin/src bin/mysql-tester

tidy:
	go mod tidy

clean:
	go clean -i ./...
	rm -rf ./bin/mysql-tester
