String imageName = "birthdayparty.jpeg";
PImage img;
int dim = 400;
Pixel[][] data = new Pixel[dim][];

void setup() {
  size(400, 400);
  img = loadImage(imageName);
  image(img, 0, 0);
  for (int i = 0; i<width; i++) {
    data[i] = new Pixel[dim];
    for (int j = 0; j<height; j++) {
      data[i][j] = new Pixel(i, j, color(get(i, j)));
    }
  }
  //img = loadImage("ImageTwo.jpeg");
}
int count = 15;
void draw() {
  background(0);
  image(img, 0, 0);
  for (int i = 0; i<data.length; i++) {
    for (int j = 0; j<data[0].length; j++) {
      data[i][j].display();
      //data[i][j].update();
    }
  }
  println(frameRate);
  count++;
  if (count > 15) {
    count = 0;
    for (int i = 0; i<width; i++) {
      data[i] = new Pixel[dim];
      for (int j = 0; j<height; j++) {
        data[i][j] = new Pixel(i, j, color(get(i, j)));
      }
    }
  }
}
