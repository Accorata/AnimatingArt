class Pixel {
  constructor(x_, y_, c_) {
    this.x = x_
    this.y = y_
    this.c = c_
  }
  
  move() {
    let direction = shapes.get(this.shape)
    this.x += direction.x
    this.y += direction.y
  }
  
  location() {
    // Return null if offscreen
    if (this.x < 0 || this.x > canvas.width || this.y < 0 || this.y > canvas.height) {
      return null
    }
    return int((this.y * width * pixelDensity() + this.x) * 4 * pixelDensity())
  }
}

class Direction {
  constructor(x_, y_) {
    this.x = x_;
    this.y = y_;
  }
}
