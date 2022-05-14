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

class Image {
  public ArrayList<Pixel> data;
  
  Image (ArrayList<Pixel> data_){
    data = data_;
  }
  
  void set(ArrayList<Pixel> data_){
    data = data_;
  }
  
  void addLowerImage(String imageName) {
    PGraphics imageSpace = createGraphics(width, height);
    imageSpace.beginDraw();
    imageSpace.image(loadImage("Images/"+imageName), 0, 0, width, height);
    for (int i = 0; i<data.size(); i++) {
      Pixel pixel = data.get(i);
      imageSpace.stroke(pixel.c);
      imageSpace.point(pixel.x, pixel.y);
    }
    imageSpace.endDraw();
    data = processScreen(imageSpace);
  }
}
