#!/bin/bash

GO111MODULE=on GOOS=linux GOARCH=386 go build -o dist/thoschmiphotos-wallpaper-linux-x86 thoschmiphotos-wallpaper.go
GO111MODULE=on GOOS=linux GOARCH=amd64 go build -o dist/thoschmiphotos-wallpaper-linux-x64 thoschmiphotos-wallpaper.go
GO111MODULE=on GOOS=windows GOARCH=386 go build -o dist/thoschmiphotos-wallpaper-win-x86 thoschmiphotos-wallpaper.go
GO111MODULE=on GOOS=windows GOARCH=amd64 go build -o dist/thoschmiphotos-wallpaper-win-x64 thoschmiphotos-wallpaper.go