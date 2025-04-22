#Install and load the required packages

install.packages("magick")

install.packages("devtools")

library(magick)

library(devtools)

#Install the imageFilter package

devtools::install_github("https://github.com/darck3/imageFilter1.5/tree/main")

library(imageFilter)

#Load your image and convert it to a bitmap

img <- image_read("path/to/image.jpg")
bitmap <- img[[1]]

#Apply gray filter to your image

gray <- apply_filter(bitmap, greyscale_filter)
print(gray)

#Apply cutoff filter to your image

cut <- apply_filter(bitmap, cutoff_filter, cutoff = 128)
print(cut)
