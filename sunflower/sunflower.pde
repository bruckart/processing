// Note: adapted from:
// https://craftofcoding.wordpress.com/tag/processing/

color c;  

public void setup()
{
   size(600,600);
   background(55);
   
   colorMode(HSB, 600, 105, 105, 255);
   c = color(2, 23, 84);
}

public void draw()
{
   // drawSpiral(1.5,4,400,200);
  
   background(55);
   
   translate(width*0.5, height*0.5);
   
   // stroke(0);
   noStroke();

   float angle = PI * (3.0-sqrt(5.0)); //137.5 in radians
   float r;
   float theta;
   
   float x;
   float y;
   int n = 1400;

   for (int i = 1; i < n; i = i + 1)
   {
      c = color(2+i, 23, 84);
      fill(c);
     
      r = 7 * sqrt(i);
      theta = i * angle;
      
      // Convert polar to cartesian
      x = r * cos(theta);
      y = r * sin(theta);
      ellipse(x, y, 6, 6);
   }
   noLoop();
}


//void drawSpiral(float a, float b, int maxSteps, int offset)
//{
//  float x, y, angle;
//  int i;
 
//  for (i=0; i<=maxSteps; i=i+1)
//  {
//    angle = 0.1 * i;
//    x = offset + (a + b * angle) * cos(angle);
//    y = offset + (a + b * angle) * sin(angle);
//    circle(x,y,1);
//  }
//}
