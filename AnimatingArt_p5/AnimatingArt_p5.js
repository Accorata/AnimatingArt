var shape_number = 5 //100 //3
var clarity = 1 //Maximum is at 1
var screen_data = []
var shapes = new p5.TypedDict()
var image_names = []
var image_index = 0
var time = 0
var vel_range = 10

//let img

function setup() {
  //willReadFrequently = true // Reminding myself about this - within canvas object (so probably assign the canvas to a var)
  createCanvas(400, 400)
  //colorMode(HSB, shape_number-1)
  //colorMode(HSB, 255, 255, 255)//shape_number-1)
  background(1) //Test to make sure code runs if all else fails
  
  for (let i = 7309; i<=7405; i++) { //407
    image_names.push("FinalImages/IMG_"+i+".jpeg")
  }
  image_index = 50 //int(random(image_names.length))
  loadImage(image_names[image_index], displayImage)
}

function draw() {
  for (let pixel in screen_data) {
    // Only move darker areas
    if (colorRequirement(screen_data[pixel].c)) {
      screen_data[pixel].move()
    }
  }
  displayPixels()
}
