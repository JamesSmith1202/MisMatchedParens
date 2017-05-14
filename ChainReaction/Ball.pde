class Ball {
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state; //0 = normal, 1 = chainball, 2 = decreasing
  float increment;//incrementation for chainballs
  int threshold;//maximum radius size for chain reaction balls

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 10;
    x = random((width - r) + r/2);
    y = random((height - r) + r/2);
    dx = random(10)-5;
    dy = random(10)-5;
    state = 0;
    increment = 0.1;//increments radius by 0.1 everytime it is drawn to the screen
    threshold = 30;//to a max of radius = 30
  }

  Ball(float red, float green, float blue) {
    float r = red;
    float g = green;
    float b = blue;
    c = color(r, g, b);
    rad = 10;
    x = mouseX;
    y = mouseY;
    state = 0;
    increment = 0.1;//increments radius by 0.1 everytime it is drawn to the screen
    threshold = 30;//to a max of radius = 30
  }

  void move() {
    x += dx;
    y += dy;
    bounce();
  }

  void draw() {
    ellipseMode(RADIUS);
    fill(c);//make the ball the color
    ellipse(x, y, rad, rad);//draw an ellipse at x, y, with radius rad
  }

  void bounce() {
    if (x<=0 || x >= width) {//if it contacts the sides, negate the x direction to reflect incident angle
      dx = -dx;
    }
    if (y <= 0 || y >= height) {//same but for top and bottom
      dy = -dy;
    }
  }

  void expandBall() {
    if (rad > 0 && rad < threshold) {//if the radius is less than the threshold...
      rad += increment;
    }
    if (rad == threshold) {
      state = 2;
    }
  }

  void shrinkBall() {  
    rad -= increment;
    System.out.println(state);
  }

  void setState(int x) {
    state = x;
  }


  float distSquared(Ball b) {//calculates the distance squared between the centers of two balls
    return pow((x-b.x), 2) + pow((y-b.y), 2);
  }

  int getState() {
    return state;
  }

  float getRadius() {
    return rad;
  }
}