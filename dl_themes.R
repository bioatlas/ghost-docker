#!/usr/bin/Rscript

library(purrr)

# at http://marketplace.ghost.org/themes/free approx 200+ free ghost themes are listed
# below are some of those:

themes <- "https://github.com/wdiazux/cusca
https://github.com/godofredoninja/simply
https://github.com/boh717/beautiful-ghost
https://github.com/daanbeverdam/buster
https://github.com/yed30/sweetbrz
https://github.com/Maqnai2234/alexei-ghost
https://github.com/raivis-vitols/ghost-theme-willow
https://github.com/chris-brown/Masonry-Ghost-Theme
https://github.com/zutrinken/bleak
https://github.com/elenatorro/Bootstrap-Ghost-Theme
https://github.com/curiositry/mnml-ghost-theme
https://github.com/dime01/my-journey
"

message("Downloading themes ...")

zips <- paste0(unlist(strsplit(trimws(themes), "\n")), "/archive/master.zip")


dl_theme <- function(x) {
  DL_DIR <- paste0(getwd(), "/dl/")
  if (!dir.exists(DL_DIR)) 
    dir.create(DL_DIR)
  DEST_FILE <- paste0(DL_DIR, rev(unlist(strsplit(x, "/")))[3], ".zip")
  if (!file.exists(DEST_FILE)) {
    download.file(x, destfile = DEST_FILE)
		return (x)
	} else {
		return (paste(x, "IS_CACHED"))
	}
}

library(purrr)
map(zips, dl_theme)

message("Done")


