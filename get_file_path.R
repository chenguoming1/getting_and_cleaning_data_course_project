get_file_path<-function(directory, id) {
  fpath <- normalizePath(file.path(directory, id))
}