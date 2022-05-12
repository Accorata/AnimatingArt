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
