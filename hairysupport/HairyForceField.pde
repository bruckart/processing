//***
// This class draws lines at 20x20 pixels along the skech height and width. These
// lines align to the PVector specified in draw().
//***
class HairyForceField
{
  HairyForceField()
  {
  }

  synchronized void draw(PVector ballLocation)
  {
    pushStyle();
    stroke(0);
    point(50, 50);
    point(100, 100);
    strokeWeight(1);

    for (int x = 0; x <= width; x = x + 20)
    {
      for (int y = 0; y <= height; y = y + 20)
      {
        point(x,y);
        
        PVector point = new PVector(x, y);
        PVector ballVector = new PVector(ballLocation.x, ballLocation.y); 
        // PVector mouseVector = new PVector(mouseX, mouseY);

        ballVector.sub(point);
        ballVector.normalize();
        ballVector.mult(20);
        
        pushMatrix();
        translate(x, y);
        // Note that to make the line up to the mouse rather than the ball, change
        // ballVector to mouseVector.
        line(0, 0, ballVector.x, ballVector.y);
        popMatrix();
      }
    }

    popStyle();
  }
};
