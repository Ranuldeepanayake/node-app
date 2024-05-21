package main

import (
	"fmt"
	"net/http"
	"text/template"
)

// index is the handler responsible for rending the index page for the site.
func index() http.Handler {

	// templates references the specified templates and caches the parsed results to help speed up response times.
	html, _ := template.ParseFiles("./html/base.html", "./html/footer.html")

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		b := struct {
			BusinessName string
			Slogan       string
			Table        string
		}{
			BusinessName: "Hamadaama Server Down,",
			Slogan:       "Masters of downtime, never any uptime.",
			Table:        "<tr><td>Gehan</td></tr>",
		}

		err := html.ExecuteTemplate(w, "content", &b)

		if err != nil {
			http.Error(w, fmt.Sprintf("index: couldn't parse template: %v", err), http.StatusInternalServerError)
			return
		}
		w.WriteHeader(http.StatusOK)
	})
}

type members struct {
	name        string
	description string
}

/*
type Hello struct {
	Sale string
	Time string
}

// index is the handler responsible for rending the index page for the site.
func index() http.Handler {

	var indexHTML = template.Must(template.ParseFiles("./html/index.html"))

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		b := struct {
			BusinessName string
			Slogan       string
		}{
			BusinessName: "Hamadaama Server Down,",
			Slogan:       "Masters of downtime, never any uptime.",
		}
		err := indexHTML.ExecuteTemplate(w, "base", &b)

		if err != nil {
			http.Error(w, fmt.Sprintf("index: couldn't parse template: %v", err), http.StatusInternalServerError)
			return
		}
		w.WriteHeader(http.StatusOK)
	})
}
*/
