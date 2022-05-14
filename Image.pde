class Image {
  ArrayList<Pixel> data;

  Image (ArrayList<Pixel> data_) {
    data = data_;
  }

  Shape genShape (ArrayList<Requirement> reqs) {
    ArrayList<Pixel> newData = new ArrayList<Pixel>();
    ArrayList<Pixel> shapeData = new ArrayList<Pixel>();
    for (int i = 0; i<data.size(); i++) {
      Pixel pixel = data.get(i);
      boolean satisfiesReqs = true;
      for (Requirement req : reqs) {
        if (!req.isSatisfied(pixel)) {
          satisfiesReqs = false;
        }
      }
      if (satisfiesReqs) {
        shapeData.add(pixel);
      } else {
        newData.add(pixel);
      }
    }
    data = newData;
    return new Shape(shapeData);
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
  
  Pixel get(int x, int y) {
    for (int i = 0; i<data.size(); i++){
      Pixel pixel = data.get(i);
      if ((int)pixel.x == x && (int)pixel.y == y){
        return pixel;
      }
    }
    return null;
  }
}
