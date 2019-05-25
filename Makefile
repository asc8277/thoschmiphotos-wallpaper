 # Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOTEST=$(GOCMD) test
SOURCE_NAME=thoschmiphotos-wallpaper.go
BINARY_NAME=dist/thoschmiphotos-wallpaper
		
all: build-all

clean: 
	rm -rf $(BINARY_NAME)*

build: clean test
	$(GOBUILD) -o $(BINARY_NAME) -v $(SOURCE_NAME)

test: clean
	$(GOTEST) -v

build-all: clean test
	GO111MODULE=on GOOS=linux GOARCH=386 $(GOBUILD) -o $(BINARY_NAME)-linux-x86 -v $(SOURCE_NAME)
	GO111MODULE=on GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-linux-x64 -v $(SOURCE_NAME)
	GO111MODULE=on GOOS=windows GOARCH=386 $(GOBUILD) -o $(BINARY_NAME)-windows-x86.exe -v $(SOURCE_NAME)
	GO111MODULE=on GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-windows-x64.exe -v $(SOURCE_NAME)

run: build
	./$(BINARY_NAME)
