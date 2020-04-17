

//******************************************************************************
// drawAxis
//******************************************************************************
void drawAxis()
{
  pushStyle();
  strokeWeight(3);
  // x (red)
  color r = color(255, 0, 0);
  stroke(r);
  line(0, 0, 0, 100, 0, 0);
  // y (green)
  color g = color(0, 255, 0);
  stroke(g);
  line(0, 0, 0, 0, -100, 0);
  // z (blue)
  color b = color(0, 126, 255);
  stroke(b);
  line(0, 0, 0, 0, 0, 100);
  popStyle(); 
}

void drawCubeLines()
{
  pushStyle();
  stroke(255,0,0);
  line(100,100,0,200,100,0);
  popStyle();

  line(200,200,0,100,200,0);
  pushStyle();
  stroke(0,0,255);
  line(100,200,0,100,100,0);
  popStyle();

  line(200,100,0,200,200,0);


  pushStyle();
  stroke(178);
  strokeWeight(1);
  stroke(0,255,0);
  line(100,100,0, 100,100,100);
  popStyle();

  pushStyle();
  line(200,100,0, 200,100,100);
  line(100,200,0, 100,200,100);
  line(200,200,0, 200,200,100);

  line(100,100,100,200,100,100);
  line(200,200,100,100,200,100);
  line(100,200,100,100,100,100);
  line(200,100,100,200,200,100);
  popStyle();

  pushStyle();
  strokeWeight(3);
  stroke(255);
  point(100,100,0);
  point(100,200,0);
  point(200,100,0);
  point(200,200,0);

  point(100,100,100);
  point(100,200,100);
  point(200,100,100);
  point(200,200,100);
  popStyle();
}

void drawCubeCurves()
{
  pushStyle();
  stroke(95,93,208);
  strokeWeight(1);
  bezier(100,100, 0, 
         150,150,20, 150,150,80,
         100,100,100);
  bezier(200,100, 0, 
         150,150,20, 150,150,80,
         200,100,100);
  bezier(200,200, 0, 
         150,150,20, 150,150,80,
         200,200,100);
  bezier(100,200, 0, 
         150,150,20, 150,150,80,
         100,200,100);
  popStyle();

  pushStyle();
  strokeWeight(3);
  stroke(255);
  // point(150,150,20);
  // point(150,150, 80);
  popStyle();

  pushStyle();
  stroke(201, 109, 10);
  bezier(100,100,0, 
         150,120,50, 150,180,50,
         100,200,0);
  bezier(200,100,0, 
         150,120,50, 150,180,50,
         200,200,0);
  bezier(100,100,100, 
         150,120,50, 150,180,50,
         100,200,100);
  bezier(200,100,100, 
         150,120,50, 150,180,50,
         200,200,100);
  strokeWeight(3);
  stroke(255);
  // point(150,120,50);
  // point(150,180,50);
  popStyle();


  pushStyle();
  stroke(66, 152, 70);
  bezier(100,100,0, 
         120,150,50, 180,150,50,
         200,100,0);
  bezier(100,100,100, 
         120,150,50, 180,150,50,
         200,100,100);
  bezier(100,200,0, 
         120,150,50, 180,150,50,
         200,200,0);
  bezier(100,200,100, 
         120,150,50, 180,150,50,
         200,200,100);
  strokeWeight(3);
  stroke(255);
  // point(120,150,50);
  // point(180,150,50);
  popStyle();
}
