class Pixel {
  public float x;
  public float y;
  public color c;

  Pixel (float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
  }
}

class Color {
  public color c;
  public float r;
  public float g;
  public float b;
  
  Color (color c_) {
    c = c_;
    r = red(c_);
    g = green(c_);
    b = blue(c_);
  }
  Color (float r_, float g_, float b_) { 
    c = color(r_,g_,b_);
    r = r_;
    g = g_;
    b = b_;
  }
  
  @Override
  String toString () {
    return "(" + r + " " + g + " " + b + ")";
  }
}
