
int clarity = 1; //Maximum is at 1
ArrayList<Pixel> screen = new ArrayList<Pixel>();
HashMap<Integer,Direction> shapes = new HashMap<Integer,Direction>();
void setup() {
  size(400,400);
  String imageName = "D2020_12_12x12.jpg";
  image(loadImage("../FinalImages/"+imageName), 0, 0, width, height);
  // Make the pixels
  for (int x = 0; x<width; x+=clarity) {
    for (int y = 0; y<height; y+=clarity) {
      screen.add(new Pixel(x, y, color(get(x, y))));
    }
  }
  // Make the shapes
  for (int i = 0; i<5; i++) {
    shapes.put(i, new Direction(1,0));
  }
  //print(shapes);
  // Arbitary at first:
  for (Pixel pixel : screen) {
    if (green(pixel.c) < 220) {
      pixel.shape = 0;
    } else {
      pixel.shape = 1;
    }
  }
}

void draw() {
  movePixels();
  displayPixels();
}
