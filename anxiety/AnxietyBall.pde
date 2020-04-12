//***
// This class create a ball with random anxiety!
//***

class AnxietyBall
{
  private int theDiameter = 16;

  private PVector theLocation;
  private PVector theVelocity;
  private PVector theAcceleration;
  
  
  AnxietyBall()
  {
    theLocation = new PVector(round(random(0, width-theDiameter/2)),
                              round(random(0, height-theDiameter/2)));
    theVelocity = new PVector(round(random(0, 1.5)),
                              round(random(0, 1.5)));
  }

  void update()
  {
    theAcceleration = PVector.random2D();
 
    theVelocity.add(theAcceleration);
    theVelocity.limit(1);
    
    theLocation.add(theVelocity);
    
    
    float ellipseWidth = ((float) mouseX / (float) width) * 64;
    System.out.println("1. : " + mouseX);
    System.out.println("2. : " + width);
    System.out.println(" - " + ellipseWidth);
    
    theDiameter = (int) ellipseWidth;
  }

  synchronized void draw()
  {
    pushStyle();
    noStroke();
    fill(255);

    ellipse(theLocation.x,theLocation.y, theDiameter, theDiameter);
    popStyle();
    
    if ((theLocation.x > width - theDiameter/2) || (theLocation.x < 0 + theDiameter/2))
    {
      theVelocity.x = theVelocity.x * -1;
    }
    if ((theLocation.y > height - theDiameter/2) || (theLocation.y < 0 + theDiameter/2))
    {
      theVelocity.y = theVelocity.y * -1;
    }
  }
};
