

import peasy.*;

PeasyCam cam;

float theta;


void setup()
{
  size(800, 600, P3D);
  background(200);
  noFill();

  cam = new PeasyCam(this, 600);

  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);

  cam.rotateZ(-120);
  cam.rotateX(-45);

  drawAxis();
  drawGrid();
  drawContainer();

  smooth();
}

void draw()
{
  background(200);

  drawAxis();
  drawGrid();
  drawContainer();

  // map the mouse from 0 to PI based upon where it is located (x axis)
  theta = map(mouseX, 0, width, 0, PI);

  branch(60);
}

void branch(float len)
{
  pushStyle();

  strokeWeight(1);
  stroke(55, 55, 55, 128);

  line(0, 0, 0, 
       0, 0, len);

  translate(0, 0, len); // lol, -len
  len *= 0.66;

  // exit condition for recursive function
  if (len > 4)
  {
    {
      pushMatrix();
      rotateY(theta);
      branch(len);
      popMatrix();

      rotateZ(radians(90));

      pushMatrix();
      rotateY(theta);
      branch(len);
      popMatrix();

      rotateZ(radians(180));

      pushMatrix();
      rotateY(theta);
      branch(len);
      popMatrix();

      rotateZ(radians(270));

      pushMatrix();
      rotateY(theta);
      branch(len);
      popMatrix();
    }
  }
  popStyle();
}
