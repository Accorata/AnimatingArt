String imageName = "Collage2.jpeg";
String image2Name = "GreenI.jpeg";
Image imgData;
Shape img;
ArrayList<Requirement> reqs = new ArrayList<Requirement>();
ArrayList<Shape> shapes = new ArrayList<Shape>();

void setup() {
  size(300, 410);
  imgData = new Image(processImage(imageName));
  reqs.add(new Requirement("Blue is less than 120"));
  reqs.add(new Requirement("Red is less than 70"));
  reqs.add(new Requirement("Green is less than 70"));
  reqs.add(new Requirement("y is less than 100"));
  //reqs.add(new Requirement("Blue is greater than 30"));
  //reqs.add(new Requirement("Blue is less than red"));
  shapes.add(imgData.genShape(reqs));
  reqs.remove(0);
  //reqs.remove(0);
  //reqs.add(new Requirement("Green is greater than 150"));
  //reqs.add(new Requirement("Red is less than 150"));
  imgData.addLowerImage(image2Name);
  img = new Shape(imgData.data);
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
