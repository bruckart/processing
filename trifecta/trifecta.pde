

import peasy.*;

PeasyCam cam;


void setup()
{
  size(800,600,P3D);
  background(55);
  
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(500);
}


void draw()
{
  background(55);

  { // Axis
    stroke(255,0,0);
    line(0,0,0, 10,0,0); // x (red)
    stroke(0,255,0);
    line(0,0,0, 0,10,0); // y (blue)
    stroke(0,0,255);
    line(0,0,0, 0,0,10); // z (green)
  }

  { // Grid
    stroke(140);
    for (int x = -100; x <= 100; x+=10)
    {
      for (int y = -100; y <= 100; y+=10)
      {
        point(x,y,0);
      }
    }
  }
      
  beginShape(LINES);
  vertex(-100, 0, 0);
  vertex(0, 100, 0);
  
  vertex(0, 100, 0);
  vertex(100, 0, 0);
  
  vertex(100, 0, 0);
  vertex(0, -100, 0);
  
  vertex(0, -100, 0);
  vertex(-100, 0, 0);
  
  { // top point
    vertex(-100, 0, 0);
    vertex(0, 0, 100);
    
    vertex(0, 100, 0);
    vertex(0, 0, 100);
    
    vertex(0, -100, 0);
    vertex(0, 0, 100);
    
    vertex(100, 0, 0);
    vertex(0, 0, 100);
  }
  
  { // bottom point
    vertex(-100, 0, 0);
    vertex(0, 0, -100);
    
    vertex(0, 100, 0);
    vertex(0, 0, -100);
    
    vertex(0, -100, 0);
    vertex(0, 0, -100);
    
    vertex(100, 0, 0);
    vertex(0, 0, -100);
  }
  
  endShape();


}
