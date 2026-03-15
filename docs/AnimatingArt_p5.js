// Dynamic
var shape_number = 5
var clarity = 1 //Maximum is at 1
var vel_range = 8

// Static
var screen_data = []
var shapes = new p5.TypedDict()
var image_names = []
var image_index = 0
var time = 0
var images = []

var current_img

function preload () {
  // template: image_names.push("AllyImages/<IMAGE_FILE_NAME_WITH_EXTENSION>")
  // example: image_names.push("AllyImages/IMG_748.jpeg")
  // Add new images below:
  
  
  
  // Disable when testing
  loadImages()
  
  // Enable when testing
  //loadImage(random(image_names), appendImage)
}

function setup() {
  //willReadFrequently = true // Reminding myself about this - within canvas object (so probably assign the canvas to a var)
  //canvas = createCanvas(windowWidth, windowHeight, P2D)
  canvas = createCanvas(1200, 600, P2D)
  
  background(1) //Test to make sure code runs if all else fails
  
  current_img = random(images)
  current_img2 = random(images)
  let img = random(images)
  let img2 = random(images)
  displayImages(img, img2)
}

function draw() {
  for (let pixel in screen_data) {
    if (screen_data[pixel] != null) {
      screen_data[pixel].move()
    }
  }
  background(0)
  
  image(current_img, 0, 0, width/2, height)
  image(current_img2, width/2, 0, width/2, height)
  filter(GRAY)
  displayPixels()
  
  time++
  if (time >= 90) {
    time = 0
    displayImages(current_img, current_img2)
    current_img = random(images)
    current_img2 = random(images)
  }
  //print(frameRate())
}
