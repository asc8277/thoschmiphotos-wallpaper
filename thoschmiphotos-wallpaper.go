package main

import (
	"log"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"github.com/mmcdole/gofeed"
	"github.com/reujab/wallpaper"
)

func main() {
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
