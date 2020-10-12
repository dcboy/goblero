test:
	go test -race ./pkg/...
test-cover:
	go test -race -coverprofile cover.out -covermode=atomic  ./pkg/...
	go tool cover -html=cover.out -o cover.html
	open cover.html
test-ci:
	go test -race -coverprofile=coverage.txt -covermode=atomic ./pkg/...
bench:
	go test -run=XXX -bench=. -benchtime=5s ./pkg/blero/
deps:
	go mod download
deps-ci: deps
	go get golang.org/x/tools/cmd/cover
	go get github.com/mattn/goveralls