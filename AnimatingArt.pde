String imageName = "GreenII.jpeg";
Image imgData;
Shape img;
Requirement req1;
Shape shape1;
Shape shape2;
void setup() {
  size(400, 400);
  imgData = new Image(processImage(imageName));
  req1 = new Requirement("blue", false, "50");
  shape1 = genShape(imgData, req1);
  //ArrayList<Pixel> newData2 = new ArrayList<Pixel>();
  //ArrayList<Pixel> shapeData2 = new ArrayList<Pixel>();
  //for (int i = 0; i<data.size(); i++) {
  //  Pixel pixel = data.get(i);
  //  if (red(pixel.c) >= 100) {
  //    shapeData2.add(pixel);
  //  } else {
  //    newData2.add(pixel);
  //  }
  //}
  //data = newData2;
  //shape2 = new Shape(shapeData2);
  img = new Shape(imgData.data);
}

Shape genShape (Image imgData, Requirement req) {
  ArrayList<Pixel> data = imgData.data;
  ArrayList<Pixel> newData = new ArrayList<Pixel>();
  ArrayList<Pixel> shapeData = new ArrayList<Pixel>();
  for (int i = 0; i<data.size(); i++) {
    Pixel pixel = data.get(i);
    if (req.isSatisfied(pixel.c)) {
      shapeData.add(pixel);
    } else {
      newData.add(pixel);
    }
  }
  imgData.set(newData);
  return new Shape(shapeData);
}

void draw() {
  background(255);
  img.display();
  shape1.move(0, -1);
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
