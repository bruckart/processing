import peasy.*;

PeasyCam cam;
OrbitalSphere os = new OrbitalSphere();
CenterSphere cs = new CenterSphere();

Util u = new Util();

float   angle = 0;

boolean m_force = false;
boolean m_pause = false;


void setup()
{
  size(800,600, P3D);
  background(55);

  cam = new PeasyCam(this, 600);

  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);

  cam.rotateZ(-120);
  cam.rotateX(-45);
}

void draw()
{
  background(55);
  
  u.drawAxis();
  u.drawGrid();
  u.drawContainer();
  cs.display();

  os.checkBoundaryCollision();
  if (m_force)
  {
    os.checkBallCollision(cs);
  }
  os.update();
  os.display();

  angle = angle + 0.01;
}

void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("Spacebar Pressed.");
  }
  // pause
  else if ((key == 'p') && (m_pause == false))
  {
    os.pause();
    m_pause = true;
  }
  else if ((key == 'p') && (m_pause == true))
  {
    os.unpause();
    m_pause = false;
  }
  // force
  else if ((key == 'f') && (m_force == false))
  {
    u.setContainerStroke(#46B2F7);
    m_force = true;
  }
  else if ((key == 'f') && (m_force == true))
  {
    u.setContainerStroke(#000000);
    m_force = false;
  }
}
