package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

var version = "dev"

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello from go on rpi5! version=%s\n", version)
}

func main() {
	port := os.Getenv("PORT")
	if port == "" { port = "7800" }
	http.HandleFunc("/", handler)
	log.Printf("listening on :%s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}