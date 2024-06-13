class Pixel {
  public int x;
  public int y;
  public color c;
  public int shape;

  Pixel (int x_, int y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
  }
  
  public void move () {
    Direction direction = shapes.get(this.shape);
    //println(this.x + " " +direction.x);
    this.x += direction.x;
    this.y += direction.y;
  }
}

class Direction {
  public int x;
  public int y;
  
  Direction (int x_, int y_) {
    x = x_;
    y = y_;
  }
}
