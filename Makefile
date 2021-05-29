 # Go parameters
BUILD_VERSION=$(shell git log -n1 --format="%h")
GOCMD=GO111MODULE=on go
GOBUILD=$(GOCMD) build -v -ldflags "-X main.Version=${BUILD_VERSION}"
SOURCE_NAME=thoschmiphotos-wallpaper.go
BINARY_DIR=dist
BINARY_NAME=thoschmiphotos-wallpaper
		
all: build-all

clean: 
	rm -rf $(BINARY_DIR)

build: clean
	$(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) $(SOURCE_NAME)

build-all: clean
	GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) $(SOURCE_NAME) && zip -mj $(BINARY_DIR)/$(BINARY_NAME)-linux-amd64.zip $(BINARY_DIR)/$(BINARY_NAME)
	GOOS=linux GOARCH=arm64 $(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) $(SOURCE_NAME) && zip -mj $(BINARY_DIR)/$(BINARY_NAME)-linux-arm64.zip $(BINARY_DIR)/$(BINARY_NAME)
	GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME).exe $(SOURCE_NAME) && zip -mj $(BINARY_DIR)/$(BINARY_NAME)-windows-amd64.zip $(BINARY_DIR)/$(BINARY_NAME).exe
	GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) $(SOURCE_NAME) && zip -mj $(BINARY_DIR)/$(BINARY_NAME)-darwin-amd64.zip $(BINARY_DIR)/$(BINARY_NAME)
	GOOS=darwin GOARCH=arm64 $(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) $(SOURCE_NAME) && zip -mj $(BINARY_DIR)/$(BINARY_NAME)-darwin-arm64.zip $(BINARY_DIR)/$(BINARY_NAME)

run: build
	./$(BINARY_DIR)/$(BINARY_NAME)
