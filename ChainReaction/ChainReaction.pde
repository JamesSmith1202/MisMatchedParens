Ball[] balls;
boolean reactionStarted;

void setup() {
  size(600, 600);
  background(0);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (Ball b : balls) {
    b.draw();
    b.move();
  }
}

void mouseClicked(){
  Ball x = new Ball();
  x.expandBall(100,2);
}