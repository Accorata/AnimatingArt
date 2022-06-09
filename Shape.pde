class Shape {
  PGraphics shape;
  float x;
  float y;
  float scale = 1;
  
  float randomDX;
  float randomDY;
  float randomDZ;
  
  Shape () {
  }
  
  Shape (ArrayList<Pixel> pixels_) {
    shape = createGraphics(width, height);
    shape.beginDraw();
    for (int i = 0; i<pixels_.size(); i++) {
      Pixel pixel = pixels_.get(i);
      shape.stroke(pixel.c);
      shape.point(pixel.x, pixel.y);
    }
    shape.endDraw();
    randomDX = random(10)-5;
    randomDY = random(10)-5;
    randomDZ = 1+(random(4)-3)/100;
  }

  void display() {
    //rect(x-width*(scale-1)/2, y-height*(scale-1)/2, width*scale/2, height*scale/2);
    image(shape, x-width*(scale-1)/2, y-height*(scale-1)/2, width*scale, height*scale);
  }

  void move() {
    x += randomDX;
    y += randomDY;
    scale *= randomDZ;
    //move(randomDX, randomDY, randomDZ);
  }
  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
  void distort(float scale_){
    scale *= scale_;
  }
  void move(float dx, float dy, float dz) {
    move(dx, dy);
    distort(1+dz/100);
  }
}
