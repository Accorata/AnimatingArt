class Requirement {
  String req;
  boolean greater;
  String type;

  Requirement (String req_, boolean greater_, String type_){
    req = req_.toLowerCase();
    greater = greater_;
    type = type_.toLowerCase();
  }

  boolean ifSatisfy(color c) {
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
      println("Error called from Requirement class: req not formatted correctly");
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
      println("Error called from Requirement class: type not formatted correctly");
      return false;
    }
    return true;
  }
}
