ArrayList<String> imageNames = new ArrayList<String>();
ArrayList<Shape> shapes = new ArrayList<Shape>();
Image img;
int index = 1;
float flex = 75;

void setup() {
  for (int i = 1; i<=5; i++) {
    imageNames.add("IMG_957"+i+".JPEG");
  }
  size(500, 350);
  img = new Image(processImage(imageNames.get(index-1)));
  addShapes(shapes, img, flex);
  img.addLowerImage(imageNames.get(index));
  img.save();
}

int count = 0;
void draw() {
  background(255);
  img.display();
  //shapes.get(0).move(0,-0.5,2);
  for (int i = 0; i<shapes.size(); i++) {
    shapes.get(i).move();
    shapes.get(i).display();
  }
  count++;
  if (count >= 100) {
    count = 0;
    //img = new Image(processImage(imageNames.get(index)));
    //addShapes(shapes, img, flex);
    index++;
    if (index >= 4) index = 0;
    shapes = genShapes(img, flex);
    img.addLowerImage(imageNames.get(index));
    img.save();
  }
}

void mouseClicked(){
  println("Location: (" + mouseX + ", " + mouseY + ")");
  color c = get(mouseX, mouseY);
  println("Color: " + red(c) + " " + green(c) + " " + blue(c));
}
