void displayPixels () {
  loadPixels();
  for (Pixel pixel : screen) {
    int location = int(pixel.y * width + pixel.x);
    if (pixel.y >= 0 && pixel.y+1 < height && pixel.x >= 0 && pixel.x <= width) {
      // making white areas disappear
      if (pixel.shape < 1) {
        pixels[location] = pixel.c;
      }
    }
  }
  updatePixels();
}

void movePixels () {
  for (Pixel pixel : screen) {
    //if (pixel.shape == 0) {
    //  //pixel.x += random(-1,1);
    //  //pixel.y += random(-1,1);
    //  pixel.x++;
    //}
    pixel.move();
  }
}

int setImage (int index) {
  int new_index = (int)(random(image_names.size()));
  while (new_index == index){
    new_index = (int)(random(image_names.size()));
  }
  current_image = loadImage(image_names.get(new_index));
  //Delete redundant pixels
  //// Code below works, but is extremely slow
  //for (int i = 0; i<screen.size(); i++) {
  //  Pixel pixel = screen.get(i);
  //  if (pixel.y >= 0 && pixel.y+1 < height && pixel.x >= 0 && pixel.x <= width) {
  //    screen.remove(pixel);
  //    i--;
  //  }
  //}
  screen = new ArrayList<Pixel>();
  // Make the pixels
  for (int x = 0; x<width; x+=clarity) {
    for (int y = 0; y<height; y+=clarity) {
      screen.add(new Pixel(x, y, color(get(x, y))));
    }
  }
  //println(screen.size());
  // Make the shapes
  for (int i = 0; i<shape_number; i++) {
    //vel_range = (shape_number-1)*3-i*3;
    shapes.put(i, new Direction(int(random(-vel_range,vel_range)),int(random(-vel_range,vel_range))));
  }
  // By color
  for (Pixel pixel : screen) {
    float brightness = brightness(pixel.c);
    pixel.shape = int(brightness);
  }
  return new_index;
}

//color[] returnColors () {
//  color[] colors = new color[5];
//  for (int i = 0; i<=255; i+=255/5) {
//    colors[i] = color(i);
//  }
//  return colors;
//}
