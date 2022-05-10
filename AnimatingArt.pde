String imageName = "birthdayparty.jpeg";
Pixel[][] data;

void setup() {
  size(400, 400);
  data = processImage(imageName);
  ArrayList<Pixel> shapeData = new ArrayList<Pixel>();
  for (int i = 0; i<data.length; i++) {
    for (int j = 0; j<data[0].length; j++) {
      if (blue(data[i][j].c) >= 100){
        shapeData.add(data[i][j]);
      }
    }
  }
  Shape shape1 = new Shape(shapeData);
  shape1.display();
  shape1.move(200,200);
  shape1.display();
}

//int count = 15;
//void draw() {
//  background(0);
//  image(img, 0, 0);
//  for (int i = 0; i<data.length; i++) {
//    for (int j = 0; j<data[0].length; j++) {
//      data[i][j].display();
//      //data[i][j].update();
//    }
//  }
//  println(frameRate);
//  count++;
//  if (count > 15) {
//    count = 0;
//    for (int i = 0; i<width; i++) {
//      data[i] = new Pixel[dim];
//      for (int j = 0; j<height; j++) {
//        data[i][j] = new Pixel(i, j, color(get(i, j)));
//      }
//    }
//  }
//}
