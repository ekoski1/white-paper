################################################################################
# utils.R - various handy utilities
#
#  Copyright (c) 2022 Orebed Analytics LLC under MIT License; see LICENSE.txt. 
# 
#  Data files produced by this software are released under Creative Commons license; 
#  see CC-BY-4.0.txt. 



# tryDownload() - download a file from given url to destFile; capture errors 
# allowing scripts to continue. Failures are recorded in list failedDownloads. 
failedDownloads <- NULL

tryDownload <- function(url, destfile, ...) {
  tryCatch(download.file(url = url,
                         destfile = destfile,
                         ...),
           error = function (e) {
             failedDownloads[[destfile]] <<- url
             message("*** failed to download ", destfile, ": ", e)
           })
}

# safeUnzip(); unzip zipFile to destFile, intercepting errors so script isn't 
# halted. If destFile already exists, makes a copy and sends alert to console. 
# zipFailList tracks failed attempts to unzip. 
unzipFailures <- NULL

safeUnzip <- function(zipFile, destFile) {
  success <- 1
  if (file.exists(destFile)) {
    message("*** ", destFile, " already exists; copied to ", str_c(destFile, "_"), ".")
    file.copy(destFile, str_c(destFile, "_"))
  }
  if (!file.exists(zipFile)) {
    success <- -1
    message("*** No ", zipFile, " to unzip!")
  } else {
    tryCatch(unzip(zipFile, files = basename(destFile), 
                   exdir = basename(dirname(destFile))),
             error = function (e) {
               unzipFailures[[destFile]] <<- zipFile
               message("*** Failed to unzip ", destFile, ": ", e)
               success <<- -1
             },
             warning = function (w) {
               unzipFailures[[destFile]] <<- zipFile
               message("*** Failed to unzip ", destFile, ": ", w)
               success <<- -1
             })
  }
  if (success > 0) {
    message("Unzipped ", destFile, ".")
  }
  success <- success >= 0
  success
}
