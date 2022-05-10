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
