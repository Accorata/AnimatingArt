ArrayList<String> imageNames = new ArrayList<String>();
ArrayList<Requirement> reqs = new ArrayList<Requirement>();
ArrayList<Shape> shapes = new ArrayList<Shape>();
Image img;

void setup() {
  imageNames.add("Collage2.jpeg");
  imageNames.add("GreenI.jpeg");
  size(300, 410);
  img = new Image(processImage(imageNames.get(0)));
  Pixel toGet = img.get(144, 66);
  if (toGet != null) {
    reqs = genReqs(toGet.c, 40);
  }
  reqs.add(new Requirement("y is less than 100"));
  shapes.add(img.genShape(reqs));
  reqs.clear();
  img.addLowerImage(imageNames.get(1));
  img.save();
}

void draw() {
  background(255);
  img.display();
  shapes.get(0).move(0,-0.5,2);
  for (int i = 0; i<shapes.size(); i++) {
    shapes.get(i).display();
  }
}

void mouseClicked(){
  println("Location: (" + mouseX + ", " + mouseY + ")");
  color c = get(mouseX, mouseY);
  println("Color: " + red(c) + " " + green(c) + " " + blue(c));
}
