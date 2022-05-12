String imageName = "GreenI.jpeg";
Image imgData;
Shape img;
ArrayList<Requirement> reqs = new ArrayList<Requirement>();
Shape shape1;
void setup() {
  size(400, 400);
  imgData = new Image(processImage(imageName));
  reqs.add(new Requirement("Blue is less than 50"));
  shape1 = genShape(imgData, reqs);
  img = new Shape(imgData.data);
}

void draw() {
  background(255);
  img.display();
  shape1.move(0, -1);
  shape1.display();
}
