 # Go parameters
BUILD_VERSION=$(shell date +%Y%m%d%H%M%S)
GOCMD=GO111MODULE=on go
GOBUILD=$(GOCMD) build -v -ldflags "-X main.Version=${BUILD_VERSION}"
SOURCE_NAME=thoschmiphotos-wallpaper.go
BINARY_DIR=dist
BINARY_NAME=thoschmiphotos-wallpaper
		
all: build-all

clean: 
	rm -rf $(BINARY_DIR)/*

build: clean
	$(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) $(SOURCE_NAME)

build-all: clean
	GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_DIR)/linux-amd64/$(BINARY_NAME) $(SOURCE_NAME)
	GOOS=linux GOARCH=arm64 $(GOBUILD) -o $(BINARY_DIR)/linux-arm64/$(BINARY_NAME) $(SOURCE_NAME)
	GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_DIR)/windows-amd64/$(BINARY_NAME).exe $(SOURCE_NAME)
	GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_DIR)/darwin-amd64/$(BINARY_NAME) $(SOURCE_NAME)
	GOOS=darwin GOARCH=arm64 $(GOBUILD) -o $(BINARY_DIR)/darwin-arm64/$(BINARY_NAME) $(SOURCE_NAME)

run: build
	./$(BINARY_DIR)/$(BINARY_NAME)
