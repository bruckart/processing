


import peasy.*;

PeasyCam cam;

float[][] terrain;

int numRows;
int numCols;
int spacing = 10;


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

  numRows = int((containerMax.x-containerMin.x)/spacing);
  numCols = int((containerMax.y-containerMin.y)/spacing);
  System.out.println("Number of Rows:    " + numRows);
  System.out.println("Number of Columns: " + + numCols);
  terrain = new float[numRows][numCols];
}

void regenerate()
{
  
  float xInc = random(0, 0.2);
  float yInc = random(0, 0.2);
  System.out.println("xInc=" + xInc);
  System.out.println("yInc=" + yInc);
  
  int x = 0;
  float xoff = 0;
  for (int cx = int(containerMin.x); cx < containerMax.x; cx+=spacing)
  {
    int y = 0;
    float yoff = 0;
    for (int cy = int(containerMin.y); cy < containerMax.y; cy+=spacing) 
    {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -64, 64);

      // System.out.println("x=" + x + ", y=" +  y);
      // System.out.println("> " + terrain[x][y]);
      y++;
      yoff += yInc;
    }
    x++;
    xoff += xInc;
  }  
}

void draw()
{
  background(55);
  
  drawAxis();
  // drawGrid();
  drawContainer();

  drawTerrainPoints(terrain);
  drawTerrainTriStrips(terrain);
}

void drawTerrainTriStrips(float[][] terrain)
{
  pushStyle(); 
  strokeWeight(1);
  stroke(#DE824C);

  int y = 0;
  for (float cy = containerMin.y; cy < containerMax.y-spacing; cy+=spacing) 
  {
    int x = 0;
    beginShape(TRIANGLE_STRIP);
    for (float cx = containerMin.x; cx < containerMax.x; cx+=spacing)
    {
      vertex(cx, cy, terrain[x][y]);
      vertex(cx, (cy+spacing), terrain[x][y+1]);
      x++;
    }
    endShape();
    y++;
  }
  popStyle();
}

void drawTerrainPoints(float[][] terrain)
{
  pushStyle(); 
  strokeWeight(3);
  stroke(#4C85DE);

  int x = 0;
  for (float cx = containerMin.x; cx < containerMax.x; cx+=spacing)
  {
    int y = 0;
    for (float cy = containerMin.y; cy < containerMax.y; cy+=spacing) 
    {
      point(cx, cy, terrain[x][y]);
      y++;
    }
    x++;
  }
  popStyle();
}

void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("Regnerate");
    regenerate();
  }
}
