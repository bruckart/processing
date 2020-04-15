
ArrayList<Geometry> shapes = new ArrayList<Geometry>();

Circles c = new Circles();
Honeycomb hc = new Honeycomb();
Pentagon p = new Pentagon();


boolean rotate = false;


// Geometry g = new Geometry();
// LapsedCircle lc = new LapsedCircle();

void setup()
{
  size(800, 600);
  background(55);
}

float angle = 0;
void draw()
{
  background(32);

  translate(width/2, height/2);
  
  if (rotate)
  {
    System.out.println("rotate");
    rotate(angle);
    angle += 0.001;
  }

  // c.display();
  // g.display();
  // hc.display();
  p.display();
}
void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("Rotate");
    rotate = (rotate == true) ? false : true;
  }
}
