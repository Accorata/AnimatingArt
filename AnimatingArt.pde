ArrayList<String> imageNames = new ArrayList<String>();
ArrayList<Shape> shapes = new ArrayList<Shape>();
Image img;

void setup() {
  //ArrayList<Requirement> reqs = new ArrayList<Requirement>();
  //imageNames.add("Collage2.jpeg");
  //imageNames.add("GreenI.jpeg");
  for (int i = 1; i<=6; i++) {
    imageNames.add("IMG_957"+i+".JPEG");
  }
  size(500, 350);
  img = new Image(processImage(imageNames.get(0)));
  //Pixel toGet = img.get(144, 66);
  //if (toGet != null) {
  //  reqs = genReqs(toGet.c, 40);
  //}
  shapes = genShapes(img, 50);
  //reqs.add(new Requirement("y is less than 100"));
  //shapes.add(img.genShape(reqs));
  //reqs.clear();
  //img.addLowerImage(imageNames.get(1));
  img.save();
}

void draw() {
  background(255);
  img.display();
  //shapes.get(0).move(0,-0.5,2);
  for (int i = 0; i<shapes.size(); i++) {
    shapes.get(i).move();
    shapes.get(i).display();
  }
}

void mouseClicked(){
  println("Location: (" + mouseX + ", " + mouseY + ")");
  color c = get(mouseX, mouseY);
  println("Color: " + red(c) + " " + green(c) + " " + blue(c));
}
