class Pixel {
  public float x;
  public float y;
  public color c;
  public int shape;

  Pixel (float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
  }
  
  public void move () {
    Direction direction = shapes.get(this.shape);
    this.x += direction.x;
    this.y += direction.y;
  }
}

class Direction {
  public float x;
  public float y;
  
  Direction (float x_, float y_) {
    x = x_;
    y = y_;
  }
}
