class Pixel {
  constructor(x_, y_, c_) {
    this.x = x_
    this.y = y_
    this.c = c_
  }
  
  move() {
    if (shapes.hasKey(this.shape)) {
      let direction = shapes.get(this.shape)
      this.x += direction.x
      this.y += direction.y
      this.updateColor()
    }
  }
  
  location() {
    // Return null if offscreen
    if (this.x < 0 || this.x > canvas.width || this.y < 0 || this.y > canvas.height) {
      return null
    }
    return int((this.y * width * pixelDensity() + this.x) * 4 * pixelDensity())
  }
  
  updateColor() {
    if (this.c >> shapes.get(this.shape).future_color) {
      this.c-=0.8
    } else {
      this.c+=0.8
    }
  }
}

class Direction {
  constructor(x_, y_) {
    this.x = x_;
    this.y = y_;
    this.future_color = int(random(255));
  }
}
