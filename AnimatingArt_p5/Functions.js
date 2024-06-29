function displayImage(img) {
  image(img, 0, 0, width, height)
  // Make the pixels
  for (let x = 0; x<width; x+=clarity) {
    for (let y = 0; y<height; y+=clarity) {
      screen_data.push(new Pixel(x, y, color(get(x, y))));
    }
  }
  //print(screen_data)
  // Make the shapes
  for (let i = 0; i<shape_number; i++) {
    //vel_range = (shape_number-1)*3-i*3;
    shapes.create(i, new Direction(int(random(-vel_range,vel_range)),int(random(-vel_range,vel_range))));
  }
  // By color
  //print(screen_data)
  //for (let pixel in screen_data) {
  //  //print(pixel)
  //  let pixel_brightness = brightness(screen_data[pixel].c)
  //  //print(pixel_brightness)
  //  screen_data[pixel].shape = int(pixel_brightness)
  //}
  displayPixels()
}

function displayPixels () {
  loadPixels()
  for (var pixel in screen_data) {
    let x = screen_data[pixel].x
    let y = screen_data[pixel].y
    let location = int((y * width + x)*16)
    if (y >= 0 && y+1 < height && x >= 0 && x <= width) {
      // making white areas disappear
      //if (pixel.shape < 1) {
      for (let i = 0; i<4; i++) {
        location += i*4
        pixels[location] = red(pixel.c)
        pixels[location+1] = green(pixel.c)
        pixels[location+2] = blue(pixel.c)
        pixels[location+3] = 255
      }
      //}
    }
  }
  //print(height*width)
  //let abc = ""
  //for (let location = 0; location<height*width*16/2; location+=40) {
  //  //if (y >= 0 && y+1 < height && x >= 0 && x <= width) {
  //    // making white areas disappear
  //    //if (pixel.shape < 1) {
  //    pixels[location] = 0//pixel.c;
  //    pixels[location+1] = 0
  //    pixels[location+2] = 0
  //    pixels[location+3] = 255
  //    abc += location + " "
  //    //}
  //  //}
  //}
  ////print(abc)
  //print(pixels.length)
  updatePixels()
}
