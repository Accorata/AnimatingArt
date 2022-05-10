class Shape {
  PGraphics shape;
  float x;
  float y;

  Shape (ArrayList<Pixel> pixels_) {
    shape = createGraphics(width, height);
    shape.beginDraw();
    for (int i = 0; i<pixels_.size(); i++){
      Pixel pixel = pixels_.get(i);
      shape.stroke(pixel.c);
      shape.point(pixel.x, pixel.y);
    }
    shape.endDraw();
  }
  
  void display(){
    image(shape, x, y);
  }
  
  void move(float dx, float dy){
    x += dx;
    y += dy;
  }
}
