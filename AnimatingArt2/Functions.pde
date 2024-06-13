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

//color[] returnColors () {
//  color[] colors = new color[5];
//  for (int i = 0; i<=255; i+=255/5) {
//    colors[i] = color(i);
//  }
//  return colors;
//}
