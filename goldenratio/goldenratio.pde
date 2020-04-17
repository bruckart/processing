

float PHI = (1 + sqrt(5)) / 2;
int numIter = 1;
int iterLimit = 1;

void goldenSpiral(float h)
{
  if (numIter >= iterLimit)
  {
    return;
  }

  // recursive function exit condition (height is less than 3)
  if (h < 3)
  {
    return;
  } 

  pushStyle();
  
  // Draw bounding box and quarter circle.
  // For some reason, using 2 * h - 1 looks better than using 2 * h.

  strokeWeight(1);
  stroke(138);
  rect(0, 0, h, h);
  arc(h, h, 
      2 * h - 1, 2 * h - 1, 
      PI, PI + HALF_PI);

  pushStyle();    
  stroke(#558DEA); // blue
  strokeWeight(2);
  point(h, h);
  stroke(#A455EA); // purple
  point(2 * h - 1, 2 * h - 1);
  popStyle();
  
  // Reposition canvas for next iteration.
  pushMatrix();
  translate(h * PHI, 0);
  rotate(HALF_PI);
  
  numIter++;
  
  // Perform recursive call (with height scaled down by golden ratio).
  goldenSpiral(h / PHI);
  popMatrix();
  
  popStyle();

}

void setup()
{
  size(680, 421);
  background(#fff8dc); // cornsilk

  noFill();
  smooth();
}

void draw()
{
}

void mousePressed()
{
  System.out.println("mousePressed()");

  iterLimit++;
  numIter = 1;
  goldenSpiral(420);
}

void keyPressed()
{
  iterLimit = 1;
  numIter = 1;
  background(#fff8dc);
}
