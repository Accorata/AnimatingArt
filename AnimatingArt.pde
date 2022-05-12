String imageName = "GreenI.jpeg";
Image imgData;
Shape img;
ArrayList<Requirement> reqs = new ArrayList<Requirement>();
Requirement req1;
Shape shape1;
Shape shape2;
void setup() {
  size(400, 400);
  imgData = new Image(processImage(imageName));
  //req1 = new Requirement("blue", false, "50");
  req1 = new Requirement("Blue is less than 50");
  reqs.add(req1);
  shape1 = genShape(imgData, reqs);
  img = new Shape(imgData.data);
}

void draw() {
  background(255);
  img.display();
  shape1.move(0, -1);
  shape1.display();
  //shape2.move(1, 0);
  //shape2.display();
}
