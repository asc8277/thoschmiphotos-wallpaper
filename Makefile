 # Go parameters
BUILD_VERSION=$(shell git describe --tags)
GOCMD=GO111MODULE=on go
GOBUILD=$(GOCMD) build -v -ldflags "-X main.Version=${BUILD_VERSION}"
SOURCE_NAME=thoschmiphotos-wallpaper.go
BINARY_NAME=dist/thoschmiphotos-wallpaper
		
all: build-all

clean: 
	rm -rf $(BINARY_NAME)*

build: clean
	$(GOBUILD) -o $(BINARY_NAME) $(SOURCE_NAME)

build-all: clean
	GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-${BUILD_VERSION}-linux-amd64 $(SOURCE_NAME)
	GOOS=linux GOARCH=arm64 $(GOBUILD) -o $(BINARY_NAME)-${BUILD_VERSION}-linux-arm64 $(SOURCE_NAME)
	GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-${BUILD_VERSION}-windows-amd64.exe $(SOURCE_NAME)
	GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-${BUILD_VERSION}-darwin-amd64 $(SOURCE_NAME)
	GOOS=darwin GOARCH=arm64 $(GOBUILD) -o $(BINARY_NAME)-${BUILD_VERSION}-darwin-arm64 $(SOURCE_NAME)

run: build
	./$(BINARY_NAME)
