class Shape {
  PGraphics shape;
  float x;
  float y;
  float scale = 1;

  Shape (ArrayList<Pixel> pixels_) {
    shape = createGraphics(width, height);
    shape.beginDraw();
    for (int i = 0; i<pixels_.size(); i++) {
      Pixel pixel = pixels_.get(i);
      shape.stroke(pixel.c);
      shape.point(pixel.x, pixel.y);
    }
    shape.endDraw();
  }

  void display() {
    image(shape, x-width*(scale-1)/2, y-height*(scale-1)/2, width*scale, height*scale);
  }

  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
  
  void distort(float scale_){
    scale *= scale_;
  }
}

class Requirement {
  String type;
  boolean greater;
  String req;

  Requirement (String type_, boolean greater_, String req_){
    type = type_.toLowerCase();
    greater = greater_;
    req = req_.toLowerCase();
  }
  Requirement (String input) {
    String[] splitInput = split(input.toLowerCase(), ' ');
    if (splitInput.length != 5) println("Error called from Requirement class:\nconstructor string not formatted correctly -\nwrong number of words (should be 5)");
    type = splitInput[0];
    if (splitInput[2].equals("greater")) {
      greater = true;
    } else if (splitInput[2].equals("less")) {
      greater = false;
    } else {
      println("Error called from Requirement class:\nconstructor string not formatted correctly -\nthird word not 'greater' or 'less'");
    }
    req = splitInput[4];
  }

  boolean isSatisfied(color c) {
    float numReq = 0;
    if (float(req) >= 0) {
      numReq = float(req);
    } else if (req.equals("red")) {
      numReq = red(c);
    } else if (req.equals("green")) {
      numReq = green(c);
    } else if (req.equals("blue")) {
      numReq = blue(c);
    } else {
      println("Error called from Requirement class:\nreq not formatted correctly");
    }
    if (type.equals("red")) {
      float r = red(c);
      if (greater) {
        if (r < numReq) return false;
      } else {
        if (r > numReq) return false;
      }
    } else if (type.equals("green")) {
      float g = green(c);
      if (greater) {
        if (g < numReq) return false;
      } else {
        if (g > numReq) return false;
      }
    } else if (type.equals("blue")) {
      float b = blue(c);
      if (greater) {
        if (b < numReq) return false;
      } else {
        if (b > numReq) return false;
      }
    } else {
      println("Error called from Requirement class:\ntype not formatted correctly");
      return false;
    }
    return true;
  }
}
