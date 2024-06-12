
int clarity = 1; //Maximum is at 1
ArrayList<Pixel> screen = new ArrayList<Pixel>();
void setup() {
  size(400,400);
  String imageName = "D2020_12_12x12.jpg";
  image(loadImage("../FinalImages/"+imageName), 0, 0, width, height);
  for (int x = 0; x<width; x+=clarity) {
    for (int y = 0; y<height; y+=clarity) {
      screen.add(new Pixel(x, y, color(get(x, y))));
    }
  }
  //
}

void draw() {
  movePixels();
  displayPixels();
}
