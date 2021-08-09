TAG = latest
PREFIX = springmt

.PHONY: fmt
fmt:
	@gofmt -e -d -s -w ./

.PHONY: lint
lint:
	@golint $$(go list ./...)

.PHONY: vet
vet:
	@go vet $$(go list ./...)

.PHONY: test
test:
	@go test -cover -v $$(go list ./...)

.PHONY: golangci-lint
golangci-lint:
	@golangci-lint run

docker:
	docker build --pull -t ${PREFIX}/log-sample:$(TAG) .

push: docker
	docker push ${PREFIX}/log-sample:$(TAG)