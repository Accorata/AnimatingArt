function displayImage(img) {
  image(img, 0, 0, width, height)
}

function displayPixels () {
  loadPixels()
  for (var pixel in screen_data) {
    let x = screen_data[pixel].x
    let y = screen_data[pixel].y
    let location = int(y * width + x)*4
    if (y >= 0 && y+1 < height && x >= 0 && x <= width) {
      // making white areas disappear
      //if (pixel.shape < 1) {
      pixels[location] = 0//pixel.c;
      pixels[location+1] = 0
      pixels[location+2] = 0
      pixels[location+3] = 255
      //}
    }
  }
  updatePixels()
}
