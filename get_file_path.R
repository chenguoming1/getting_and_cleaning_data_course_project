get_file_path<-function(directory, id) {
  if (is.numeric(id)) {
    id<-sprintf("%03d", id)
  }else {
    id<-sprintf("%03s", id)
  }
  fpath <- normalizePath(file.path(directory, id))
}