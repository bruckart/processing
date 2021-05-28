import peasy.*;

PeasyCam cam;

PyramidShape ps = new PyramidShape();

float rotationz = -120;
float rotationx = -45;
void setup()
{
  size(800, 600, P3D);
  background(255);
  noFill();
  
  cam = new PeasyCam(this, 200);

  cam.setMinimumDistance(10);
  cam.setMaximumDistance(800);
  
  stroke(182);
}

void draw()
{
  background(255);

  cam.rotateZ(.001);
  cam.rotateX(-.001);

  ps.display();
}
