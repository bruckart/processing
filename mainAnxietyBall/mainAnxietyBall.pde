//***
// This sketch demonstrates a ball with random motion. Future
// enhancement is that the ball size shrinks as someone
// approaches the exhibit.
//***

AnxietyBall[] balls = new AnxietyBall[16];


void setup()
{
  size(800,400);
  background(55);
  
  for (int i = 0; i < balls.length; i++)
  {
    balls[i] = new AnxietyBall();
  }
}



void draw()
{
  background(100);

  for (int i = 0; i < balls.length; i++)
  {
    AnxietyBall b = balls[i];
    b.update();
    b.draw();
  }
}
