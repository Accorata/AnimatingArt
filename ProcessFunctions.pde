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
  return genReqs(c, 20);
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

ArrayList<Color> findColors (ArrayList<Pixel> data, float flex) {
  ArrayList<Color> colors = new ArrayList<Color>();
  HashMap<Color, Boolean> check = new HashMap<>();
  int dim = (int) (255 / flex);
  for (int r = 0; r<dim; r++){
    for (int b = 0; b<dim; b++){
      for (int g = 0; g<dim; g++){
        check.put(new Color(r*flex, b*flex, g*flex), false);
      }
    }
  }
  //for (int i = 0; i<data.size(); i++) {
  //  Pixel pixel = data.get(i);
  //  Color current = new Color(pixel.r*flex/flex, 
  //  while (toBeAdded && j<colors.size()) {
  //    Color c = colors.get(j);
  //    if (abs(c.r - red(pixel.c)) > flex || abs(c.g - green(pixel.c)) > flex || abs(c.b - blue(pixel.c)) > flex) {
  //      toBeAdded = false;
  //    }
  //    j++;
  //  }
  //  if (toBeAdded) {
  //    colors.add(new Color(pixel.c));
  //  }
  //}
  return colors;
}

int round (int num, float flex) {
  return (int)((int)(num * flex) / flex);
}

ArrayList<Color> badFindColors (ArrayList<Pixel> data, float flex) {
  ArrayList<Color> colors = new ArrayList<Color>();
  for (int i = 0; i<data.size(); i++) {
    Pixel pixel = data.get(i);
    boolean toBeAdded = true;
    int j = 0;
    while (toBeAdded && j<colors.size()) {
      Color c = colors.get(j);
      if (abs(c.r - red(pixel.c)) > flex || abs(c.g - green(pixel.c)) > flex || abs(c.b - blue(pixel.c)) > flex) {
        toBeAdded = false;
      }
      j++;
    }
    if (toBeAdded) {
      colors.add(new Color(pixel.c));
    }
  }
  return colors;
}
