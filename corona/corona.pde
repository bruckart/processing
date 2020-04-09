

import peasy.*;

PeasyCam cam;

int numPnts = 7;
KochCrown kc = new KochCrown(numPnts);


void setup()
{
  size(800, 600, P3D);
  background(55);
  noFill();

  cam = new PeasyCam(this, 600);

  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);

  cam.rotateZ(-120);
  cam.rotateX(-45);
  
  
  drawAxis();
  drawGrid();
  drawContainer();

   kc.display();
}

void draw()
{
  background(55);

  drawAxis();
  drawGrid();
  drawContainer();

  kc.display();
}

void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("Update");
    kc.update();
  }
}
