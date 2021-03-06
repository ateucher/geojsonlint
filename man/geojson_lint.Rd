% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geojsonlint.R
\name{geojson_lint}
\alias{geojson_lint}
\title{Validate GeoJSON using geojsonlint.com web service}
\usage{
geojson_lint(x, verbose = FALSE, error = FALSE, ...)
}
\arguments{
\item{x}{Input, a geojson character string, json object, or file or
url pointing to one of the former}

\item{verbose}{(logical) When geojson is invalid, return reason why (\code{TRUE}) or don't 
return reason (\code{FALSE}). Default: \code{FALSE}}

\item{error}{(logical) Throw an error on parse failure? If \code{TRUE}, then 
function returns \code{TRUE} on success, and \code{stop} with the 
error message on error. Default: \code{FALSE}}

\item{...}{curl options passed on to \code{\link[httr]{GET}} or
\code{\link[httr]{POST}}}
}
\value{
\code{TRUE} or \code{FALSE}. If \code{verbose=TRUE} an attribute
of name \code{errors} is added with error information
}
\description{
Validate GeoJSON using geojsonlint.com web service
}
\details{
Uses the web service at \url{http://geojsonlint.com}
}
\examples{
\dontrun{
# From a json character string
geojson_lint(x = '{"type": "Point", "coordinates": [-100, 80]}') # good
geojson_lint(x = '{"type": "Rhombus", "coordinates": [[1, 2], [3, 4], [5, 6]]}') # bad

# A file
file <- system.file("examples", "zillow_or.geojson", package = "geojsonlint")
geojson_lint(x = as.location(file))

# A URL
url <- "https://raw.githubusercontent.com/glynnbird/usstatesgeojson/master/california.geojson"
geojson_lint(as.location(url))

# toggle whether reason for validation failure is given back
geojson_lint('{ "type": "FeatureCollection" }')
geojson_lint('{ "type": "FeatureCollection" }', verbose = TRUE)

# toggle whether to stop with error message
geojson_lint('{ "type": "FeatureCollection" }')
geojson_lint('{ "type": "FeatureCollection" }', verbose = TRUE)
if (interactive()) {
  geojson_lint('{ "type": "FeatureCollection" }', error = TRUE)
}
}
}

