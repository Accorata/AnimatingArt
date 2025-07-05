// Dynamic
var shape_number = 5 
var clarity = 1 //Maximum is at 1
var vel_range = 10

// Static
var screen_data = []
var shapes = new p5.TypedDict()
var image_names = []
var image_index = 0
var time = 0 // Unused

function setup() {
  //willReadFrequently = true // Reminding myself about this - within canvas object (so probably assign the canvas to a var)
  canvas = createCanvas(400, 400)
  canvas.drawingContext.getContextAttributes().willReadFrequently = true
  
  background(1) //Test to make sure code runs if all else fails
  
  for (let i = 7309; i<=7405; i++) { //407
    image_names.push("FinalImages/IMG_"+i+".jpeg")
  }
  image_index = int(random(image_names.length))
  loadImage(image_names[image_index], displayImage)
}

function draw() {
  for (let pixel in screen_data) {
    // Only move darker areas
    if (colorRequirement(screen_data[pixel].c)) {
      screen_data[pixel].move()
    }
  }
  background(255)
  displayPixels()
}
