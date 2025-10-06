function displayImages(img, img2) {
  image(img, 0, 0, width/2, height)
  image(img2, width/2, 0, width/2, height)
  displayPixels ()
  filter(GRAY)
  screen_data = []
  // Make the pixels
  let reactive_clarity = clarity / pixelDensity()
  for (let x = 0; x<width; x+=reactive_clarity) {
    for (let y = 0; y<height; y+=reactive_clarity) {
      let c = brightness(color(get(x,y)))
      if (c <= 50) {
        let p = new Pixel(x, y, c)
        screen_data.push(p)
      }
    }
  }
  // Make the shapes
  for (let i = 0; i<shape_number; i++) {
    shapes.create(i, new Direction(int(random(-vel_range,vel_range)),int(random(-vel_range,vel_range)))) 
  }
  // Assign pixels to shapes by color
  for (let pixel in screen_data) {
    if (screen_data[pixel] != null) {
      let pixel_shape = int(screen_data[pixel].c / 101 * shape_number) // Adjust to the number of shapes possible
      screen_data[pixel].shape = pixel_shape
    }
  }
}

function displayPixels () {
  loadPixels()
  for (var pixel in screen_data) {
    if (screen_data[pixel] != null) {
      let location = screen_data[pixel].location()
      // Only display darker areas
      if (location != null && screen_data[pixel].c <= 50 ) {
        pixels[location] = screen_data[pixel].c
        pixels[location+1] = screen_data[pixel].c
        pixels[location+2] = screen_data[pixel].c
        pixels[location+3] = 255
      } else {
          screen_data[pixel] = null
      }
    }
  }
  updatePixels()
}

function loadImages () {
  for (let i = 0; i<image_names.length; i++) {
    loadImage(image_names[i], appendImage)
  }
}

function appendImage (img) {
  images.push(img)
}
