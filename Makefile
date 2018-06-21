all: media

clean:
	@rm -rf ./ci-demo-86-x64-linux*

media:
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 godep go build -v .
	@mv ./ci-demo ./ci-demo-86-x64-linux