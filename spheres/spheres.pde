
import peasy.*;

PeasyCam cam;


final int NUM_OF_SPHERES = 54;

MovingSphere[] spheres = new MovingSphere[NUM_OF_SPHERES];
Liquid liquid = new Liquid();

boolean m_force = false;
boolean m_pause = false;
boolean m_slow  = false;

void makeSpheres()
{
  for (int i = 0; i < NUM_OF_SPHERES; i++)
  {
    spheres[i] = null;
    spheres[i] = new MovingSphere();
  }
}

void setup()
{
  size(800, 600, P3D);
  background(55);
  
  cam = new PeasyCam(this, 600);

  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);

  cam.rotateZ(-120);
  cam.rotateX(-45);
  
  makeSpheres();
}


void draw()
{
  background(55);
  
  drawAxis();
  drawGrid();
  drawContainer();

  liquid.display();

  for (MovingSphere sphere : spheres)
  {
    sphere.update();

    if (m_force == true)
    {
      if (liquid.contains(sphere))
      {
        PVector drag = liquid.drag(sphere);
        sphere.applyForce(drag);
      }

      // Gravity is scaled by mass here!
      PVector gravity = new PVector(0, 0, -0.1 * sphere.m_mass);
      sphere.applyForce(gravity);

      for (MovingSphere otherSphere : spheres)
      {
        if (sphere == otherSphere)
        {
          continue;
        }
        sphere.checkCollision(otherSphere);
      }
    }
    sphere.checkBoundaries();
    sphere.display();
  }
  
  if (m_slow)
  {
    delay(60);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    System.out.println("Spacebar Pressed.");
    makeSpheres();
    
  }
  // pause
  else if ((key == 'p') && (m_pause == false))
  {
    for (MovingSphere s : spheres)
    {
      s.pause();
    }
    m_pause = true;
  }
  else if ((key == 'p') && (m_pause == true))
  {
    for (MovingSphere s : spheres)
    {
      s.unpause();
    }
    m_pause = false;
  }
  // slow
  else if ((key == 's') && (m_slow == false))
  {
    m_slow = true;
  }
  else if ((key == 's') && (m_slow == true))
  {
    m_slow = false;
  }
  // force
  else if ((key == 'f') && (m_force == false))
  {
    setContainerStroke(#46B2F7);
    m_force = true;
  }
  else if ((key == 'f') && (m_force == true))
  {
    setContainerStroke(#000000);
    m_force = false;
  }
  else if (key == ']')
  {
    // Step Forward
  }
  else if (key == '[')
  {
    // Step Backwards
  }
}
