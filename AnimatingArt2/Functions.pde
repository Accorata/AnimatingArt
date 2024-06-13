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
  int new_index = (int)(random(images.size()));
  //while (new_index == index){
  //  new_index = (int)(random(images.size()));
  //}
  image(images.get(new_index), 0, 0, width, height);
  println(new_index);
  return new_index;
}

//color[] returnColors () {
//  color[] colors = new color[5];
//  for (int i = 0; i<=255; i+=255/5) {
//    colors[i] = color(i);
//  }
//  return colors;
//}
