#!/bin/bash

GOOS=linux GOARCH=386 go build -o dist/thoschmiphotos-wallpaper-linux-x86 thoschmiphotos-wallpaper.go
GOOS=linux GOARCH=amd64 go build -o dist/thoschmiphotos-wallpaper-linux-x64 thoschmiphotos-wallpaper.go
GOOS=windows GOARCH=386 go build -o dist/thoschmiphotos-wallpaper-win-x86 thoschmiphotos-wallpaper.go
GOOS=windows GOARCH=amd64 go build -o dist/thoschmiphotos-wallpaper-win-x64 thoschmiphotos-wallpaper.go