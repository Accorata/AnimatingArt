class Requirements {
  ArrayList<Float> reqs = new ArrayList<Float>();
  ArrayList<Boolean> greaters = new ArrayList<Boolean>();
  ArrayList<String> types = new ArrayList<String>();
  
  //Constructor
  
  boolean ifSatisfy(color c){
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    for (int i = 0; i<reqs.size(); i++){
      Float req = reqs.get(i);
      Boolean greater = greaters.get(i);
      String type = types.get(i).toLowerCase();
      if (type.equals("red")) {
        if (greater) {
          if (r < req) return false;
        } else {
          if (r > req) return false;
        }
      } else if (type.equals("green")) {
        if (greater) {
          if (g < req) return false;
        } else {
          if (g > req) return false;
        }
      } else if (type.equals("blue")){
        if (greater) {
          if (b < req) return false;
        } else {
          if (b > req) return false;
        }
      } else {
        println("Error");
        return false;
      }
    }
    return true;
  }
}
