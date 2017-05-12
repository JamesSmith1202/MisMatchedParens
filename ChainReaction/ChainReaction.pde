Ball[] balls;
boolean reactionStarted;

void setup(){
  size(600,600);
  reactionStarted = false;
  balls = new Ball[25];
  for(int i=0; i < balls.length; i++){
    balls[i] = new Ball();
    
  }
}