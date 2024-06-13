void displayPixels () {
  loadPixels();
  for (Pixel pixel : screen) {
    //stroke(pixel.c);
    //point(pixel.x, pixel.y);
    int location = int(pixel.y * width + pixel.x);
    //int total_size = width*height;  && location != total_size
    if (pixel.y >= 0 && pixel.y+1 < height && pixel.x >= 0 && pixel.x <= width) {
      //println(pixel.x + " " + pixel.y);
      pixels[location] = pixel.c;
    }
    //print(" " + pixel.x + " " + pixel.y);
    //print(pixels[int(location)]);
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
  //println(new_index);
  // Make the pixels
  for (int x = 0; x<width; x+=clarity) {
    for (int y = 0; y<height; y+=clarity) {
      screen.add(new Pixel(x, y, color(get(x, y))));
    }
  }
  // Make the shapes
  for (int i = 0; i<shape_number; i++) {
    //vel_range = 0 //(shape_number-1)*3-i*3;
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
