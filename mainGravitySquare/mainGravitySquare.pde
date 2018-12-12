//***
// This sketch introduces "gravity" squares which causes the balls to 
// rise and fall based upon the square.
//***

BouncyBall[] balls = new BouncyBall[32];

void setup()
{
  size(800,400);
  background(55);
  
  for (int i = 0; i < balls.length; i++)
  {
    balls[i] = new BouncyBall();
  }
}

void draw()
{
  background(55);
  
  pushStyle();
  noStroke();
  fill(128);
  rect(100, 100, 250, 200, 7);
  rect(450, 100, 250, 200, 7);
  popStyle();
  
  for (int i = 0; i < balls.length; i++)
  {
    BouncyBall b = balls[i];
    b.update();
    b.draw();
  }
}
