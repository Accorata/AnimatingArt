class Pixel {
  public float x;
  public float y;
  public color c;

  Pixel (float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
  }
}

class Image {
  public ArrayList<Pixel> data;
  
  Image (ArrayList<Pixel> data_){
    data = data_;
  }
  
  void set(ArrayList<Pixel> data_){
    data = data_;
  }
}
