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
}

function draw() {
  //for (let pixel in screen_data) {
  //  screen_data[pixel].move()
  //}
  //displayPixels()
}
