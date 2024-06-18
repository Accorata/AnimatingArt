var shape_number = 3
var clarity = 1 //Maximum is at 1
//var screen = []
var shapes = new p5.TypedDict()
var image_names = []
var image_index = 0
var time = 0
var vel_range = 5 //8

function setup() {
  createCanvas(700, 700)
  //colorMode(HSB, shape_number-1)
  colorMode(HSB, 360, 100, shape_number-1)
  for (let i = 7309; i<=7405; i++) { //407
    image_names.push("FinalImages/IMG_"+i+".jpeg")
  }
  image_index = int(random(image_names.length))
  background(1)
  loadImage(image_names[image_index], displayImage)
}

function draw() {

}
