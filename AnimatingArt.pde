PImage img;
Pixel[][] data = new Pixel[600][];

void setup() {
  size(600, 600);
  img = loadImage("ImageTwo.jpeg");//TestImg.jpg");
  image(img, 0, 0);
  for (int i = 0; i<width; i++) {
    data[i] = new Pixel[600];
    for (int j = 0; j<height; j++) {
      data[i][j] = new Pixel(i, j, color(get(i, j)));
    }
  }
  //img = loadImage("ImageTwo.jpeg");
}
int count = 0;
void draw() {
  background(0);
  image(img, 0, 0);
  for (int i = 0; i<data.length; i++) {
    for (int j = 0; j<data[0].length; j++) {
      data[i][j].display();
      data[i][j].update();
    }
  }
  count++;
  if (count > 15) {
    count = 0;
    for (int i = 0; i<width; i++) {
      data[i] = new Pixel[600];
      for (int j = 0; j<height; j++) {
        data[i][j] = new Pixel(i, j, color(get(i, j)));
      }
    }
  }
}

class Pixel {
  public float x;
  public float y;
  public color c;

  Pixel (float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
  }

  void display() {
    stroke(c);
    point(x, y);
  }
  void update() {
    if (blue(c) >= 100 && blue(c)>red(c)) {
      x+=4;//blue(c)/25;
    }
    if (red(c) >= 100) {
      y-=4;//red(c)/25;
    }
  }
}
