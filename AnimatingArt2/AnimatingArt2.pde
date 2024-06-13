int shape_number = 5;
int clarity = 1; //Maximum is at 1
ArrayList<Pixel> screen = new ArrayList<Pixel>();
HashMap<Integer,Direction> shapes = new HashMap<Integer,Direction>();
ArrayList<PImage> images = new ArrayList<PImage>();
int image_index = 0;
void setup() {
  size(400,400);
  colorMode(HSB, 360, 100, shape_number-1);
  for (int i = 7309; i<=7312; i++) { //407
    images.add(loadImage("../FinalImages/IMG_"+i+".jpeg"));
  }
  //String imageName = "D2020_12_12x12.jpg";
  //image(loadImage("../FinalImages/"+imageName), 0, 0, width, height);
  image_index = setImage(image_index);
  // Make the pixels
  for (int x = 0; x<width; x+=clarity) {
    for (int y = 0; y<height; y+=clarity) {
      screen.add(new Pixel(x, y, color(get(x, y))));
    }
  }
  // Make the shapes
  for (int i = 0; i<shape_number; i++) {
    shapes.put(i, new Direction(int(random(-3,3)),int(random(-3,3))));
  }
  // By color
  for (Pixel pixel : screen) {
    float brightness = brightness(pixel.c);
    pixel.shape = int(brightness);
  }
}

void draw() {
  background(100);
  movePixels();
  displayPixels();
}
