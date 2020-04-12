// This sketch demonstrates a force field which moves balls downward upon
// intersection. The "hairy" force field are lines that take into account
// a PVector that forces the lines to align to the moving ball.

HairyForceField h;
BouncyBall b;

void setup()
{
  smooth(4);
  size(600,300);
  
  h = new HairyForceField();
  b = new BouncyBall();
}

void draw()
{
  background(200);

  h.draw(b.location());
  b.draw();
}
