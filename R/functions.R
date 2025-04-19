#' Grayscale Filter
#' @param rgb_vec A vector of RGB values (as raw or integer).
#' @return A vector with grayscale RGB values.
greyscale_filter <- function(rgb_vec) {
  grey_val <- as.raw(round(
    0.299 * as.integer(rgb_vec[1]) +
      0.587 * as.integer(rgb_vec[2]) +
      0.114 * as.integer(rgb_vec[3])
  ))
  rep(grey_val, 3)
}

#' Cutoff Filter
#' @param rgb_vec A vector of RGB values.
#' @param cutoff A numeric cutoff between 0 and 255.
#' @return A vector of raw values representing a color (black or magenta).
cutoff_filter <- function(rgb_vec, cutoff = 127) {
  grey_val <- 0.299 * as.integer(rgb_vec[1]) +
    0.587 * as.integer(rgb_vec[2]) +
    0.114 * as.integer(rgb_vec[3])
  if (grey_val < cutoff) {
    as.raw(c(0, 0, 0))  # black
  } else {
    as.raw(c(255, 0, 255))  # magenta
  }
}

#' Apply Filter to Image
#' @param bitmap A bitmap array from magick.
#' @param filter_func The filter function to apply.
#' @param ... Additional arguments for the filter function.
#' @return A magick image object.
apply_filter <- function(bitmap, filter_func, ...) {
  dims <- dim(bitmap)
  new_bitmap <- bitmap
  for (x in 1:dims[2]) {
    for (y in 1:dims[3]) {
      rgb_vec <- bitmap[, x, y]
      new_bitmap[, x, y] <- filter_func(rgb_vec, ...)
    }
  }
  magick::image_read(new_bitmap)
}
