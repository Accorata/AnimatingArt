String imageName = "Collage2.jpeg";
Image imgData;
Shape img;
ArrayList<Requirement> reqs = new ArrayList<Requirement>();
Shape shape1;
Shape shape2;
void setup() {
  size(400, 400);
  imgData = new Image(processImage(imageName));
  reqs.add(new Requirement("Blue is less than 50"));
  reqs.add(new Requirement("Blue is greater than 30"));
  //reqs.add(new Requirement("Blue is less than red"));
  shape1 = genShape(imgData, reqs);
  //reqs.remove(0);
  //reqs.add(new Requirement("Green is greater than 150"));
  //reqs.add(new Requirement("Red is less than 150"));
  //shape2 = genShape(imgData, reqs);
  img = new Shape(imgData.data);
}

void draw() {
  background(255);
  img.display();
  shape1.distort(1.01);
  shape1.move(0, -1);
  shape1.display();
  //shape2.move(1, 0);
  //shape2.display();
}
