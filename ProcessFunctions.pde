ArrayList<Pixel> processScreen() {
  ArrayList<Pixel> data = new ArrayList<Pixel>();
  //loadPixels();
  for (int i = 0; i<width; i++) {
    for (int j = 0; j<height; j++) {
      data.add(new Pixel(i, j, color(get(i,j))));//pixels[i*height+j])));
    }
  }
  return data;
}

ArrayList<Pixel> processScreen(PGraphics graphics) {
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
  imageSpace.image(loadImage("FinalImages/"+imageName), 0, 0, width, height);
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
  ArrayList<Color> possColors = new ArrayList<Color>();
  HashMap<Color, Boolean> check = new HashMap<Color, Boolean>();
  int dim = (int) (255 / flex);
  for (int r = 0; r<=dim; r++) {
    for (int b = 0; b<=dim; b++) {
      for (int g = 0; g<=dim; g++) {
        Color c = new Color(r*flex, b*flex, g*flex);
        check.put(c, false);
        possColors.add(c);
      }
    }
  }
  for (int i = 0; i<data.size(); i++) {
    Pixel pixel = data.get(i);
    Color c1 = roundCol(pixel.c, flex);
    Color c = possColors.get(((int)(c1.r/flex) + 1) * ((int)(c1.b/flex) + 1) * ((int)(c1.g/flex) + 1) - 1);
    Boolean doesExist = check.get(c);
    if (doesExist != null && !doesExist) {
      check.put(c, true);
      colors.add(new Color(pixel.c));
    }
  }
  return colors;
}

int round (int num, float flex) {
  return (int)((int)(num / flex) * flex);
}

Color roundCol (color c, float flex) {
  int r = round((int)red(c), flex);
  int g = round((int)green(c), flex);
  int b = round((int)blue(c), flex);
  return new Color(r, g, b);
}

ArrayList<Shape> genShapes (Image img, float flex) {
  ArrayList<Shape> shapes = new ArrayList<Shape>();
  ArrayList<Requirement> reqs;
  ArrayList<Color> colors = findColors(img.data, flex);
  for (int i = 0; i<colors.size(); i++) {
    color c = colors.get(i).c;
    reqs = genReqs(c, flex);
    shapes.add(img.genShape(reqs));
  }
  return shapes;
}

void addShapes (ArrayList<Shape> shapes, Image img, float flex) {
  ArrayList<Requirement> reqs;
  ArrayList<Color> colors = findColors(img.data, flex);
  for (int i = 0; i<colors.size(); i++) {
    color c = colors.get(i).c;
    reqs = genReqs(c, flex);
    shapes.add(img.genShape(reqs));
  }
}

int chooseImg(int index){
  int newIndex = (int)(random(imageNames.size()));
  while (newIndex == index){
    newIndex = (int)(random(imageNames.size()));
  }
  return newIndex;
}
