package main

import (
	"fmt"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"github.com/asc8277/wallpaper"
	"github.com/mmcdole/gofeed"
)

func main() {
	feed, _ := gofeed.NewParser().ParseURL("http://thoschmiphotos.blogspot.com/feeds/posts/default?alt=rss")
	content := feed.Items[0].Description
	fmt.Println(content)

	doc, _ := goquery.NewDocumentFromReader(strings.NewReader(content))
	url, _ := doc.Find("a:has(img)").Attr("href")
	fmt.Println(url)

	wallpaper.SetFromURL(url)
}
