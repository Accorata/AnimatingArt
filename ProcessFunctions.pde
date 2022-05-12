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
  imageSpace.image(loadImage(imageName), 0, 0, width, height);
  imageSpace.endDraw();
  return processScreen(imageSpace);
}
