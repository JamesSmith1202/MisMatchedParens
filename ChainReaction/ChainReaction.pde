Ball[] balls;
boolean reactionStarted;

void setup() {
  size(600, 600);//set window size
  background(0);//set black background
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++) {//iterate through to fill array with balls
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  if (reactionStarted) {
    for (Ball b : balls) {
      for (Ball r : balls) {
        if (r.getState() == 1) {//compare a given ball to all of the chain reaction balls
          if (b.distSquared(r) < pow((b.getRadius() + r.getRadius()), 2) {//if their distance squared is less than the sum of the radii squared, then they are in contact
            b.setState(1);//since they touched, make it a chain reaction ball
          }
        }
      }
    }
    for (Ball b : balls) {
      if (b.getState() == 1) { //if the ball is a chain reaction ball..
        b.expandBall();//expand it by 'increase'
      }
    }
  }
  for (Ball b : balls) {//iterate through all balls, draw them to the screen, then move them
    b.draw();
    b.move();
  }
}

void mouseClicked() {
  reactionStarted = true;
  Ball x = new Ball();//create a new ball
  x.setState(1);//set it to a chain reaction ball
  balls[balls.length-1] = x;//****replace it with the last one for now**** not a viable option. I just forgot how the program loooked
}