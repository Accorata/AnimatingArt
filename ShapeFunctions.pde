Shape genShape (Image imgData, ArrayList<Requirement> reqs) {
  ArrayList<Pixel> data = imgData.data;
  ArrayList<Pixel> newData = new ArrayList<Pixel>();
  ArrayList<Pixel> shapeData = new ArrayList<Pixel>();
  for (int i = 0; i<data.size(); i++) {
    Pixel pixel = data.get(i);
    boolean satisfiesReqs = true;
    for (Requirement req : reqs) {
      if (!req.isSatisfied(pixel.c)) {
        satisfiesReqs = false;
      }
    }
    if (satisfiesReqs) {
      shapeData.add(pixel);
    } else {
      newData.add(pixel);
    }
  }
  imgData.set(newData);
  return new Shape(shapeData);
}
