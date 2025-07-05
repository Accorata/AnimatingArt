function displayImage(img) {
  image(img, 0, 0, width, height)
  // Make the pixels
  let reactive_clarity = clarity / pixelDensity()
  for (let x = 0; x<width; x+=reactive_clarity) {
    for (let y = 0; y<height; y+=reactive_clarity) {
       let p = new Pixel(x, y, color(get(x, y)))
       screen_data.push(p)
    }
  }
  background(0)
  // Make the shapes
  for (let i = 0; i<shape_number; i++) {
    //vel_range = (shape_number-1)*3-i*3;
    shapes.create(i, new Direction(int(random(-vel_range,vel_range)),int(random(-vel_range,vel_range)))) 
  }
  // Assign pixels to shapes by color
  for (let pixel in screen_data) {
    let pixel_brightness = brightness(screen_data[pixel].c)
    let pixel_shape = int(pixel_brightness / 101 * shape_number) // Adjust to the number of shapes possible
    screen_data[pixel].shape = pixel_shape
  }
  displayPixels()
}

function displayPixels () {
  loadPixels()
  for (var pixel in screen_data) {
    let location = screen_data[pixel].location()
    if (location != null) {
      pixels[location] = red(screen_data[pixel].c)
      pixels[location+1] = green(screen_data[pixel].c)
      pixels[location+2] = blue(screen_data[pixel].c)
      pixels[location+3] = 255
    }
  }
  updatePixels()
}

//// Check if pixel should be added/displayed/moved, returns true if yes and false if no
function colorRequirement (color_at_pixel) {
  return brightness(color_at_pixel) <= 80
  //return true
}
