function displayImage(img) {
  image(img, 0, 0, width, height)
  filter(GRAY)
  // Make the pixels
  let reactive_clarity = clarity / pixelDensity()
  for (let x = 0; x<width; x+=reactive_clarity) {
    for (let y = 0; y<height; y+=reactive_clarity) {
      let c = brightness(color(get(x,y)))
      let p = new Pixel(x, y, c)
      screen_data.push(p)
    }
  }
  // Make the shapes
  for (let i = 0; i<shape_number; i++) {
    shapes.create(i, new Direction(int(random(-vel_range,vel_range)),int(random(-vel_range,vel_range)))) 
  }
  // Assign pixels to shapes by color
  for (let pixel in screen_data) {
    let pixel_shape = int(screen_data[pixel].c / 101 * shape_number) // Adjust to the number of shapes possible
    screen_data[pixel].shape = pixel_shape
    // Random color swapping tests
    //shapes[pixel_shape].set_future_color(255-pixel_brightness)
  }
}

function displayPixels () {
  loadPixels()
  for (var pixel in screen_data) {
    let location = screen_data[pixel].location()
    if (location != null && screen_data[pixel].c <= 50 ) {
      pixels[location] = screen_data[pixel].c
      pixels[location+1] = screen_data[pixel].c
      pixels[location+2] = screen_data[pixel].c
      pixels[location+3] = 255
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
