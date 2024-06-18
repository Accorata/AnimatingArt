var shape_number = 100 //3
var clarity = 1 //Maximum is at 1
var screen_data = []
var shapes = new p5.TypedDict()
var image_names = []
var image_index = 0
var time = 0
var vel_range = 5 //8

function setup() {
  //willReadFrequently = true // Reminding myself about this - within canvas object (so probably assign the canvas to a var)
  createCanvas(200, 200)
  //colorMode(HSB, shape_number-1)
  colorMode(HSB, 360, 100, 100)//shape_number-1)
  background(1) //Test to make sure code runs if all else fails
  
  for (let i = 7309; i<=7405; i++) { //407
    image_names.push("FinalImages/IMG_"+i+".jpeg")
  }
  image_index = int(random(image_names.length))
  loadImage(image_names[image_index], displayImage)
  // Make the pixels
  for (let x = 0; x<width; x+=clarity) {
    for (let y = 0; y<height; y+=clarity) {
      screen_data.push(new Pixel(x, y, color(get(x, y))));
    }
  }
  print(screen_data)
  // Make the shapes
  for (let i = 0; i<shape_number; i++) {
    //vel_range = (shape_number-1)*3-i*3;
    shapes.create(i, new Direction(int(random(-vel_range,vel_range)),int(random(-vel_range,vel_range))));
  }
  // By color
  //print(screen_data)
  //for (let pixel in screen_data) {
  //  //print(pixel)
  //  let pixel_brightness = brightness(screen_data[pixel].c)
  //  //print(pixel_brightness)
  //  screen_data[pixel].shape = int(pixel_brightness)
  //}
}

function draw() {
  //for (let pixel in screen_data) {
  //  screen_data[pixel].move()
  //}
  displayPixels()
}
