void displayPixels () {
  loadPixels();
  for (Pixel pixel : screen) {
    //stroke(pixel.c);
    //point(pixel.x, pixel.y);
    //pixel.x += random(-1,1);
    //pixel.x++;
    int location = int(pixel.y * width + pixel.x);
    int total_size = width*height;
    if (pixel.y >= 0 && pixel.y <= height && pixel.x >= 0 && pixel.x <= width && location != total_size) {
      pixels[location] = pixel.c;
    }
    //print(" " + pixel.x + " " + pixel.y);
    //print(pixels[int(location)]);
  }
  updatePixels();
}
