String imageName = "Collage2.jpeg";
String image2Name = "GreenI.jpeg";
Image imgData;
Shape img;
ArrayList<Requirement> reqs = new ArrayList<Requirement>();
Shape shape1;
Shape shape2;
void setup() {
  size(300, 410);
  imgData = new Image(processImage(imageName));
  reqs.add(new Requirement("Blue is less than 120"));
  reqs.add(new Requirement("Red is less than 70"));
  reqs.add(new Requirement("Green is less than 70"));
  //reqs.add(new Requirement("Blue is greater than 30"));
  //reqs.add(new Requirement("Blue is less than red"));
  shape1 = genShape(imgData, reqs);
  reqs.remove(0);
  //reqs.remove(0);
  //reqs.add(new Requirement("Green is greater than 150"));
  //reqs.add(new Requirement("Red is less than 150"));
  //shape2 = genShape(imgData, reqs);
  imgData.addLowerImage(image2Name);
  img = new Shape(imgData.data);
}

void draw() {
  background(255);
  //image(loadImage("Images/"+image2Name), 0, 0, width, height);
  img.display();
  shape1.distort(1.01);
  shape1.move(0, -3);
  shape1.display();
  //shape2.distort(1.01);
  //shape2.move(1, 1);
  //shape2.display();
  color c = get(mouseX, mouseY);
  println(red(c) + " " + green(c) + " " + blue(c));
}
