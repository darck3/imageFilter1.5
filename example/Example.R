install.packages("magick")
library(magick)

img <- image_read("path/to/image.jpg")
bitmap <- img[[1]]

gray <- apply_filter(bitmap, greyscale_filter)
print(gray)

cut <- apply_filter(bitmap, cutoff_filter, cutoff = 128)
print(cut)
