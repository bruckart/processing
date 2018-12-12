//***
// This class create a movable bouncy ball! It's so fun!
//***

class BouncyBall
{
  private int theDiameter = 16;

  private PVector theLocation;
  private PVector theVelocity;
  
  BouncyBall()
  {
    theLocation = new PVector(round(random(0, width-theDiameter/2)),
                              round(random(0, height-theDiameter/2)));
    theVelocity = new PVector(round(random(0, 1.5)),
                              round(random(0, 1.5)));
  }
  
  void update()
  {
    theLocation.add(theVelocity);
  }

  synchronized void draw()
  {
    pushStyle();
    // noStroke();
    noFill();
    stroke(186);
    strokeWeight(1);
    color c = color(#2BEA99);

    // Check if the ball is in the upward force field.
    if ((theLocation.x >= 100) && (theLocation.x <= 350) && 
        (theLocation.y >= 100) && (theLocation.y <= 300))
    {
      c = color(#EA4090);
      noStroke();
      fill(c);
      
      PVector downwardForce = new PVector(0,0.03);
      theVelocity.add(downwardForce);
    }

    // Check if the ball is in the downward force field.
    if ((theLocation.x >= 450) && (theLocation.x <= 700) && 
        (theLocation.y >= 100) && (theLocation.y <= 300))
    {
      c = color(#4066EA);
      noStroke();
      fill(c);
      
      PVector upwardForce = new PVector(0,-0.03);
      theVelocity.add(upwardForce);
    }
    
    
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
