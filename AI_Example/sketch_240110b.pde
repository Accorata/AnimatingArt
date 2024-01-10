PImage img;

void setup() {
  size(800, 600);
  img = loadImage("your_image.jpg"); // Replace "your_image.jpg" with the path to your image file
  img.resize(width, height);
}

void draw() {
  background(255);
  image(img, 0, 0);
  
  loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      float brightnessValue = brightness(img.pixels[loc]);
      
      // You can adjust the threshold to select darker or lighter parts
      if (brightnessValue < 100) {
        float angle = map(brightnessValue, 0, 100, 0, TWO_PI);
        float distance = map(brightnessValue, 0, 100, 2, 10);
        
        float offsetX = cos(angle) * distance;
        float offsetY = sin(angle) * distance;
        
        int newX = constrain(x + int(offsetX), 0, width - 1);
        int newY = constrain(y + int(offsetY), 0, height - 1);
        
        int newLoc = newX + newY * width;
        
        pixels[loc] = img.pixels[newLoc];
      }
    }
  }
  
  updatePixels();
}
