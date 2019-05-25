 # Go parameters
GOCMD=GO111MODULE=on GOARCH=amd64 go
GOBUILD=$(GOCMD) build -v
GOTEST=$(GOCMD) test -v
SOURCE_NAME=thoschmiphotos-wallpaper.go
BINARY_NAME=dist/thoschmiphotos-wallpaper
		
all: build-all

clean: 
	rm -rf $(BINARY_NAME)*

build: clean test
	$(GOBUILD) -o $(BINARY_NAME) $(SOURCE_NAME)

test: clean
	$(GOTEST)

build-all: clean test
	GOOS=linux $(GOBUILD) -o $(BINARY_NAME)-linux $(SOURCE_NAME)
	GOOS=windows $(GOBUILD) -o $(BINARY_NAME)-windows.exe $(SOURCE_NAME)
	GOOS=darwin $(GOBUILD) -o $(BINARY_NAME)-darwin $(SOURCE_NAME)

run: build
	./$(BINARY_NAME)
