package main

import (
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"github.com/mmcdole/gofeed"
	"github.com/reujab/wallpaper"
)

var Version = "dev"

func main() {
	if len(os.Args) > 1 && os.Args[1] == "--version" {
		fmt.Println(version())
		return
	}

	feed, err := gofeed.NewParser().ParseURL("http://thoschmiphotos.blogspot.com/feeds/posts/default?alt=rss")
	if err != nil {
		log.Fatal(err)
	}

	content := feed.Items[0].Description
	log.Print(content)

	doc, err := goquery.NewDocumentFromReader(strings.NewReader(content))
	if err != nil {
		log.Fatal(err)
	}

	url, exists := doc.Find("a:has(img)").Attr("href")
	if !exists {
		log.Fatal("could not find image link")
		return
	}
	log.Print(url)

	wallpaper.SetFromURL(url)
}

func version() string {
	return fmt.Sprintf("thoschmiphotos-wallpaper build %s", Version)
}
