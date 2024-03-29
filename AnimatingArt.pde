ArrayList<String> imageNames = new ArrayList<String>();
ArrayList<Shape> shapes = new ArrayList<Shape>();
Image img;
int index = 1;
float flex = 20;
boolean play = true;

void setup() {
  //for (int i = 582; i<=608; i++) {
  //  if (i != 604) imageNames.add("IMG_9"+i+".jpeg");
  //}
  imageNames.add("D2020_56_16x16.jpg");
  imageNames.add("D2020_54_16x16.jpg");
  imageNames.add("D2020_52_12x12.jpg");
  imageNames.add("D2020_42_12x12.jpg");
  imageNames.add("D2020_24_12x12.jpg");
  imageNames.add("D2020_23_12x12.jpg");
  imageNames.add("D2020_36_12x12.jpg");
  imageNames.add("D2020_34_12x12.jpg");
  imageNames.add("D2020_39_12x12.jpg");
  imageNames.add("D2020_19_12x12.jpg");
  imageNames.add("D2020_17_12x12.jpg");
  imageNames.add("D2020_15_12x12.jpg");
  imageNames.add("D2020_12_12x12.jpg");

  size(700, 700);
  index = chooseImg(index);
  img = new Image(processImage(imageNames.get(index)));
  addShapes(shapes, img, flex);
  index = chooseImg(index);
  img.addLowerImage(imageNames.get(index));
  img.save();
}

int count = 0;
void draw() {
  if (play) {
    //background(255);
    img.display();
    //shapes.get(0).move(0,-0.5,2);
    for (int i = 0; i<shapes.size(); i++) {
      shapes.get(i).move();
      if (count < 30) {
        shapes.get(i).display();
      }
      if (count == 4) {
        shapes.get(i).randomDZ = 1/1.2;
        shapes.get(i).randomDX = (random(10)-5)*3;
        shapes.get(i).randomDY = (random(10)-5)*3;
      }
    }
    //println(shapes.size() + " " + frameRate);
    println(count);
    count++;
    if (count >= 50) { //100;
      count = 0;
      //img = new Image(processImage(imageNames.get(index)));
      //addShapes(shapes, img, flex);
      //index++;
      //if (index >= 4) index = 0;
      index = chooseImg(index);
      img = new Image(processScreen());
      shapes = genShapes(img, flex);
      img.addLowerImage(imageNames.get(index));
      img.save();
    }
  }
}

void mouseClicked() {
  play = !play;
  //println("Location: (" + mouseX + ", " + mouseY + ")");
  //color c = get(mouseX, mouseY);
  //println("Color: " + red(c) + " " + green(c) + " " + blue(c));
}
