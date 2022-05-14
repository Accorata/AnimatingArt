ArrayList<Pixel> processScreen(){
  ArrayList<Pixel> data = new ArrayList<Pixel>();
  for (int i = 0; i<width; i++) {
    for (int j = 0; j<height; j++) {
      data.add(new Pixel(i, j, color(get(i, j))));
    }
  }
  return data;
}

ArrayList<Pixel> processScreen(PGraphics graphics){
  ArrayList<Pixel> data = new ArrayList<Pixel>();
  for (int i = 0; i<width; i++) {
    for (int j = 0; j<height; j++) {
      data.add(new Pixel(i, j, color(graphics.get(i, j))));
    }
  }
  return data;
}

ArrayList<Pixel> processImage(String imageName) {
  PGraphics imageSpace = createGraphics(width, height);
  imageSpace.beginDraw();
  imageSpace.image(loadImage("Images/"+imageName), 0, 0, width, height);
  imageSpace.endDraw();
  return processScreen(imageSpace);
}

ArrayList<Requirement> genReqs(color c) {
  return genReqs(c, 10);
}

ArrayList<Requirement> genReqs(color c, float flex) {
  ArrayList<Requirement> reqs = new ArrayList<Requirement>();
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  reqs.add(new Requirement("red", true, ""+(r-flex)));
  reqs.add(new Requirement("red", false, ""+(r+flex)));
  reqs.add(new Requirement("green", true, ""+(g-flex)));
  reqs.add(new Requirement("green", false, ""+(g+flex)));
  reqs.add(new Requirement("blue", true, ""+(b-flex)));
  reqs.add(new Requirement("blue", false, ""+(b+flex))); 
  return reqs;
}
