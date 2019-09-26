.PHONY: all
all: test lint

.PHONY: test
test:
	go test ./...

.PHONY: coverage.out
coverage.out:
	go test -covermode=count --coverprofile=$@ ./...

.PHONY: lint
lint:
	bin/golangci-lint run

.PHONY: format
format:
	find . -name \*.go | xargs gofumports -w

.PHONY: install-tools
install-tools:
	curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- v1.19.1
	GO111MODULE=off go get -u \
		github.com/mattn/goveralls \
		mvdan.cc/gofumpt/gofumports