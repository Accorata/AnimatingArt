let shape_number = 3
let clarity = 1 //Maximum is at 1
//let screen = []
let shapes = new p5.TypedDict()
let image_names = []
let image_index = 0
let time = 0
let current_image
let vel_range = 5 //8
//function preload() {
//  current_image = loadImage(
//}

function setup() {
  createCanvas(700, 700)
  //colorMode(HSB, shape_number-1)
  colorMode(HSB, 360, 100, shape_number-1)
  for (let i = 7309; i<=7405; i++) { //407
    image_names.push("FinalImages/IMG_"+i+".jpeg")
    //image_names.push("~/Users/henrybach/Documents/PersonalCoding/AnimatingArt/FinalImages/IMG_"+i+".jpeg")
  }
  image_index = int(random(image_names.length))
  background(1)
  current_image = loadImage(image_names[image_index])
  image(current_image, 0, 0)//, width, height)
  print(image_names[image_index])
  print(current_image)
}


function draw() {

}
