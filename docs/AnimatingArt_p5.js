// Dynamic
var shape_number = 5 
var clarity = 1 //Maximum is at 1
var vel_range = 10

// Static
var screen_data = []
var shapes = new p5.TypedDict()
var image_names = []
var image_index = 0
var time = 0
var images = []

var current_img

function preload () {
  for (let i = 7309; i<=7405; i++) { //407
    image_names.push("FinalImages/IMG_"+i+".jpeg")
  }
  
  // Disable when testing
  loadImages()
  
  // Enable when testing
  //loadImage(random(image_names), appendImage)
}

function setup() {
  //willReadFrequently = true // Reminding myself about this - within canvas object (so probably assign the canvas to a var)
  canvas = createCanvas(windowWidth, windowHeight, P2D)
  //canvas = createCanvas(windowWidth, windowHeight).elt.getContext('2d', { willReadFrequently: true });
  
  background(1) //Test to make sure code runs if all else fails
  
  current_img = random(images)
  let img = random(images)
  displayImage(img)
}

function draw() {
  for (let pixel in screen_data) {
    // Only move darker areas
    if (colorRequirement(screen_data[pixel].c)) {
      screen_data[pixel].move()
    }
  }
  background(0)
  
  image(current_img, 0, 0, width, height)
  filter(GRAY)
  displayPixels()
  
  time++
  if (time >= 60) {
    time = 0
    screen_data = []
    displayImage(current_img)
    current_img = random(images)
  }
}
