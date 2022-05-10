Pixel[][] processScreen(){
  Pixel[][] data = new Pixel[width][];
  for (int i = 0; i<width; i++) {
    data[i] = new Pixel[height];
    for (int j = 0; j<height; j++) {
      data[i][j] = new Pixel(i, j, color(get(i, j)));
    }
  }
  return data;
}

Pixel[][] processScreen(PGraphics imageSpace){
  Pixel[][] data = new Pixel[width][];
  for (int i = 0; i<width; i++) {
    data[i] = new Pixel[height];
    for (int j = 0; j<height; j++) {
      data[i][j] = new Pixel(i, j, color(imageSpace.get(i, j)));
    }
  }
  return data;
}

Pixel[][] processImage(String imageName) {
  PGraphics imageSpace = createGraphics(width, height);
  imageSpace.beginDraw();
  imageSpace.image(loadImage(imageName), 0, 0);
  imageSpace.endDraw();
  return processScreen(imageSpace);
}
