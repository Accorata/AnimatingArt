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
  ArrayList<Color> possColors = new ArrayList<Color>();
  HashMap<Color, Boolean> check = new HashMap<Color, Boolean>();
  int dim = (int) (255 / flex);
  for (int r = 0; r<=dim; r++){
    for (int b = 0; b<=dim; b++){
      for (int g = 0; g<=dim; g++){
        //println(r*flex + " " + b*flex + " " + g*flex);
        Color c = new Color(r*flex, b*flex, g*flex);
        check.put(c, false);
        possColors.add(c);
      }
    }
  }
  //println(check);
  for (int i = 0; i<data.size(); i++) {
    Pixel pixel = data.get(i);
    Color c1 = roundCol(pixel.c, flex);
    Color c = possColors.get((int)((c1.r/dim + 1) * (c1.b/dim + 1) * (c1.g/dim + 1) - 1));
    //println(red(pixel.c) + " " + green(pixel.c) + " " + blue(pixel.c) + " : " + c.r + " " + c.g + " " + c.b);
    Boolean doesExist = check.get(c);
    if (doesExist != null && !doesExist){
      check.put(c, true);
      colors.add(new Color(pixel.c));
    }
  }
  println(colors);
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
