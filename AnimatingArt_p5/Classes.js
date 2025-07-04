class Pixel {
  //public var x, y, c, shape
  //public var c

  constructor(x_, y_, c_) {
    this.x = x_
    this.y = y_
    this.c = c_
    //this.shape
  }
  
  move() {
    let direction = shapes.get(this.shape)
    this.x += direction.x
    this.y += direction.y
  }
  
  location() {
    return int((this.y * width * pixelDensity() + this.x) * 4 * pixelDensity())
  }
}

class Direction {
  constructor(x_, y_) {
    this.x = x_;
    this.y = y_;
  }
}
