class Shape {
  PGraphics shape;

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
    image(shape, 0, 0);
  }
}
