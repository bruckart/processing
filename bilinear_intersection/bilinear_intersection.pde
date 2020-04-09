

import peasy.*;

PeasyCam cam;

PVector start;
PVector stop;
PVector mid;
PVector slope;

PVector anc; // anchor

PVector planeNw;
PVector planeNe;
PVector planeSe;
PVector planeSw;

PVector nMid;
PVector sMid;
PVector eMid;
PVector wMid;

// bilinear normal
PVector bn;

void setup()
{
  size(800, 600, P3D);
  background(55);
  noFill();

  cam = new PeasyCam(this, 600);

  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);

  cam.rotateZ(-120);
  cam.rotateX(-45);

  generate();
}

void generate()
{
  start = PVector.random3D();
  start.mult(100);
  stop = PVector.random3D();
  stop.mult(100);
  System.out.println("start="+start);
  System.out.println("stop="+stop);

  mid = stop.copy().sub(start).div(2).add(start);
  System.out.println("mid="+mid);

  // start, stop slope
  {
    PVector normStart = start.copy().normalize();
    PVector normStop  = stop.copy().normalize();
    float dx = normStop.x - normStart.x;
    float dy = normStop.y - normStart.y;
    float dz = normStop.z - normStart.z;

    slope = new PVector(dx, dy, dz);
    System.out.println("slope="+slope);
  }

  // start, stop distance
  {
    float dist = stop.dist(start);
    System.out.println("dist="+dist);
  }

  // More complicated, how to find the normal. The dot product of this vector
  // and the normal vector is 0.
  {
    if (start.z > stop.z)
    {
      anc = new PVector(start.x, start.y, stop.z);
    } else if (start.z < stop.z)
    {
      anc = new PVector(stop.x, stop.y, start.z);
    } else
    {
      anc = new PVector();
      System.out.println("The points are in the same plane!");
      exit();
    }

  }


  PVector diff = PVector.sub(start, stop);
  System.out.println("diff="+diff);
  PVector axis1 = new PVector(-diff.y, diff.x);
  PVector axis2 = diff.cross(axis1);
  // Note this mult or div depends is aesthetic based upon the 
  // diff value between the points. In this sketch, that value
  // is pretty high (80,000) based upon observations.
  axis2.div(200); 

  System.out.println("axis1="+axis1);
  System.out.println("axis2="+axis2);

  planeNw = PVector.sub(start, axis1).add(axis2);
  planeNe = PVector.add(start, axis1).add(axis2);
  planeSw = PVector.sub(start, axis1).sub(axis2);
  planeSe = PVector.add(start, axis1).sub(axis2);


  nMid = planeNw.copy().sub(planeNe).div(2).add(start);
  sMid = planeSe.copy().sub(planeSw).div(2).add(start);
  eMid = planeSe.copy().sub(planeNe).div(2).add(start);
  wMid = planeNw.copy().sub(planeSw).div(2).add(start);

  System.out.println("planeNw="+planeNw);
  System.out.println("planeNe="+planeNe);
  System.out.println("planeSe="+planeSe);
  System.out.println("planeSw="+planeSw);

  bn = wMid.copy().sub(start).add(mid);
}

void draw()
{
  background(55);

  drawAxis();
  drawGrid();
  drawContainer();

  // draw the start and stop points
  pushStyle();
  strokeWeight(2);
  stroke(255);
  line(start.x, start.y, start.z, stop.x, stop.y, stop.z);
  strokeWeight(10);
  point(start.x, start.y, start.z);
  point(stop.x, stop.y, stop.z);
  popStyle();

  // draw the bilinear intersection 
  pushStyle();
  strokeWeight(5);
  stroke(#D30BB2);
  point(mid.x, mid.y, mid.z);
  popStyle();

  // draw the right angle anchor point
  pushStyle();
  strokeWeight(5);
  stroke(#F5E31E);
  point(anc.x, anc.y, anc.z);
  strokeWeight(1);
  line(start.x, start.y, start.z, anc.x, anc.y, anc.z);
  line(anc.x, anc.y, anc.z, stop.x, stop.y, stop.z);
  popStyle();

  // draw the nomral plane
  pushStyle();
  noFill();
  stroke(#F5891E);
  strokeWeight(1);
  line(planeSw.x, planeSw.y, planeSw.z, 
       planeSe.x, planeSe.y, planeSe.z);
  line(planeSe.x, planeSe.y, planeSe.z, 
       planeNe.x, planeNe.y, planeNe.z);
  line(planeNe.x, planeNe.y, planeNe.z, 
       planeNw.x, planeNw.y, planeNw.z);
  line(planeNw.x, planeNw.y, planeNw.z, 
       planeSw.x, planeSw.y, planeSw.z);
  popStyle();

  // draw midpoints on each side of the plane
  pushStyle();
  strokeWeight(8);
  stroke(#1E3FF5);
  point(nMid.x, nMid.y, nMid.z);
  point(sMid.x, sMid.y, sMid.z);
  point(eMid.x, eMid.y, eMid.z);
  point(wMid.x, wMid.y, wMid.z);
  popStyle();

  // draw a line from the start to the middle of the normal plane
  pushStyle();
  strokeWeight(2);
  stroke(#F51EE7);
  line(start.x, start.y, start.z, 
       wMid.x, wMid.y, wMid.z);
  popStyle();

  // draw the line from the midpoint to the bilinear normal
  pushStyle();
  strokeWeight(2);
  stroke(#F5D11E);
  line(mid.x, mid.y, mid.z, bn.x, bn.y, bn.z);
  popStyle();
}

void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("generate");
    generate();
  }
}
