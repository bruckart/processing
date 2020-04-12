//***
// This sketch draws lines that follow the mouse. While moving, colors
// alternate.
//***
import java.util.Date;

void setup()
{
  background(55);
  size(800,600);
}

void draw()
{
  pushStyle();
  strokeWeight(0.1);
  
  // Rando color.
  //color c = color(int(random(0, 255)),
  //                int(random(0, 255)),
  //                int(random(0, 255)));
  stroke(200, 200, 200, 100);
  noFill();
  
  
  for (int x = 0; x <= width; x = x + 50)
  {
    for (int y = 0; y <= height; y = y + 50)
    {
      point(x, y);
      PVector point = new PVector(x, y);
      PVector mouseVector = new PVector(mouseX, mouseY);
      
      mouseVector.sub(point);
      mouseVector.normalize();
      mouseVector.mult(20);
      
      pushMatrix();
      translate(x, y);
      line(0, 0, mouseVector.x, mouseVector.y);
      popMatrix();
    }
  }
  popStyle();
}

void mouseClicked()
{
  Date d = new Date();
  save(d.getTime() + ".jpg");
}
