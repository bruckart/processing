
  
class Util
{
  Util()
  {
  }
  
  // Note (Z is Up)
  void drawAxis()
  {
    pushStyle();
    strokeWeight(2);
    stroke(255,0,0);
    line(0,0,0, 20,0,0); // x (red)
    
    stroke(0,0,255);
    line(0,0,0, 0,20,0); // y (green)

    stroke(0,255,0);    
    line(0,0,0, 0,0,20); // z (blue)
    popStyle();
  }
  
  void drawGrid()
  {
    pushStyle();
    stroke(140);
    strokeWeight(1);
    for (int x = -200; x <= 200; x+=10)
    {
      for (int y = -200; y <= 200; y+=10)
      {
        point(x,y,0);
      }
    }
    popStyle();
  }
  
  color m_containerColor = color(0,0,0);

  void setContainerStroke(color c)
  {
    m_containerColor = c;
  }
  
  void drawContainer()
  {
    pushStyle();
    noFill();
    stroke(m_containerColor);
    box(400);
    popStyle();
  }
}
