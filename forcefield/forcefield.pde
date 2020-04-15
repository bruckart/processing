

import peasy.*;

PeasyCam cam;

//int numPnts = 20;
//public int m_radius = 100;


ForceSphere fs = new ForceSphere();

boolean pause = false;

void setup()
{
  size(800, 600, P3D);

  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);
  cam.rotateZ(-120);
  cam.rotateX(-45);

  smooth();
}

void draw()
{
  background(228);

  drawAxis();
  drawGrid();
  drawContainer();

  if (pause == false)
  {
    fs.update();
  }
  fs.display();
}

void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("Pause");
    pause = (pause == true) ? false : true;
  }
}
