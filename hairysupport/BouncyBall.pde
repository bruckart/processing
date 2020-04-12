
//***
// This class represents a "BouncyBall" in that it reverses direction when it touches
// the width or height of the sketch. The ball has a set diameter but a random location
// and velocity.
//***
class BouncyBall
{
  private PVector theLocation;
  private PVector theVelocity;
  private int theDiameter;
  
  
  BouncyBall()
  {
    // theDiameter = round(random(0, 50));
    theDiameter = 70;

    theLocation = new PVector(round(random(0, width)), round(random(0, height)));
    theVelocity = new PVector(round(random(0, 2.5)), round(random(0, 3.5)));
    
    System.out.println("theDiameter: " + theDiameter);
    System.out.println("theLocation: " + theLocation);
    System.out.println("theVelocity: " + theVelocity);
  }
  
  synchronized void draw()
  {
    // System.out.println("Width: " + width);
    // System.out.println("Height: " + height);
    
    int radius = theDiameter/2;
    // System.out.println("Radius: " + radius);
    
    theLocation.add(theVelocity);
    
    if ((theLocation.x > width - radius) || (theLocation.x < 0 + radius))
    {
      theVelocity.x = theVelocity.x * -1;
    }
    if ((theLocation.y > height - radius) || (theLocation.y < 0 + radius))
    {
      theVelocity.y = theVelocity.y * -1;
    }
   
    pushStyle();
    strokeWeight(1);
    stroke(0);
    fill(145);
    ellipse(theLocation.x,theLocation.y, theDiameter, theDiameter);
    popStyle();
  }
  
  PVector location()
  {
    return theLocation;
  }
};
