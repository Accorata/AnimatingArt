String imageName = "ImageTwo.jpeg";
Pixel[][] data;
Shape shape1;
//Shape shape2;
void setup() {
  size(400, 400);
  data = processImage(imageName);
  ArrayList<Pixel> newData = new ArrayList<Pixel>();
  ArrayList<Pixel> shapeData = new ArrayList<Pixel>();
  for (int i = 0; i<data.length; i++) {
    for (int j = 0; j<data[0].length; j++) {
      if (blue(data[i][j].c) <= 50) {
        shapeData.add(data[i][j]);
      } else {
        newData.add(data[i][j]);
      }
    }
  }
  shape1 = new Shape(shapeData);
  //ArrayList<Pixel> shapeData2 = new ArrayList<Pixel>();
  //for (int i = 0; i<data.length; i++) {
  //  for (int j = 0; j<data[0].length; j++) {
  //    if (red(data[i][j].c) <= 200) {
  //      shapeData2.add(data[i][j]);
  //    }
  //  }
  //}
  //shape2 = new Shape(shapeData2);
  //shape1.move(200,200);
  //shape1.display();
  //image(loadImage(imageName), 0, 0);
}
void draw() {
  image(loadImage(imageName), 0, 0);
  shape1.move(0, -0.0001);
  shape1.display();
  //shape2.move(1, 0);
  //shape2.display();
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
