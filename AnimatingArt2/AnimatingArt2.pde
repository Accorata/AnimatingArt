int shape_number = 3;
int clarity = 1; //Maximum is at 1
ArrayList<Pixel> screen = new ArrayList<Pixel>();
HashMap<Integer,Direction> shapes = new HashMap<Integer,Direction>();
ArrayList<String> image_names = new ArrayList<String>();
int image_index = 0;
int time = 0;
PImage current_image;
int vel_range = 5; //8;
void setup() {
  size(700,700);
  colorMode(HSB, 360, 100, shape_number-1);
  for (int i = 7309; i<=7405; i++) { //407
    image_names.add("../FinalImages/IMG_"+i+".jpeg");
  }
  //String imageName = "D2020_12_12x12.jpg";
  //image(loadImage("../FinalImages/"+imageName), 0, 0, width, height);
  image_index = (int)(random(image_names.size()));
  image(loadImage(image_names.get(image_index)), 0, 0, width, height);
  image_index = setImage(image_index);
}

void draw() {
  time++;
  if (time >= 90) {
    time=0;
    image_index = setImage(image_index);
  }
  image(current_image, 0, 0, width, height);
  movePixels();
  displayPixels();
}
