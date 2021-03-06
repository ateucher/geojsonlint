% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geojsonhint.R
\name{geojson_hint}
\alias{geojson_hint}
\title{Validate GeoJSON using geojsonhint Javascript library}
\usage{
geojson_hint(x, verbose = FALSE, error = FALSE)
}
\arguments{
\item{x}{Input, a geojson character string, json object, or file or
url pointing to one of the former}

\item{verbose}{(logical) When geojson is invalid, return reason why (\code{TRUE}) or don't 
return reason (\code{FALSE}). Default: \code{FALSE}}

\item{error}{(logical) Throw an error on parse failure? If \code{TRUE}, then 
function returns \code{TRUE} on success, and \code{stop} with the 
error message on error. Default: \code{FALSE}}
}
\value{
\code{TRUE} or \code{FALSE}. If \code{verbose=TRUE} an attribute
of name \code{errors} is added with error information
}
\description{
Validate GeoJSON using geojsonhint Javascript library
}
\details{
Uses the Javascript library \url{https://www.npmjs.com/package/geojsonhint}
via the \pkg{V8} package
}
\examples{
geojson_hint('{"type": "FooBar"}')
geojson_hint('{ "type": "FeatureCollection" }')
geojson_hint(
  '{"type":"Point","geometry":{"type":"Point","coordinates":[-80,40]},"properties":{}}'
)

# A file
file <- system.file("examples", "zillow_or.geojson", package = "geojsonlint")
geojson_hint(as.location(file))

# A URL
url <- "https://raw.githubusercontent.com/glynnbird/usstatesgeojson/master/california.geojson"
geojson_hint(as.location(url))

# from json (jsonlite class)
x <- jsonlite::minify('{ "type": "FeatureCollection" }')
class(x)
geojson_hint(x)

# toggle whether reason for validation failure is given back
geojson_hint('{ "type": "FeatureCollection" }')
geojson_hint('{ "type": "FeatureCollection" }', verbose = TRUE)

# toggle whether to stop with error message
geojson_hint('{ "type": "FeatureCollection" }')
geojson_hint('{ "type": "FeatureCollection" }', verbose = TRUE)
if (interactive()) {
  geojson_hint('{ "type": "FeatureCollection" }', error = TRUE)
}
}

