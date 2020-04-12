

class CenterSphere
{
  PVector m_location = new PVector(0,0,0);
  PVector m_velocity = new PVector();
  PVector m_acceleration = new PVector();
  
  int m_mass   = 120;
  int m_radius = 100;
  
  CenterSphere()
  {
  }
  
  void update()
  {
    m_velocity.add(m_acceleration);
    m_location.add(m_velocity);
    m_acceleration.mult(0);
  }

  void display()
  {
    pushStyle();
    noFill();
    stroke(255, 255, 255, 90);
    strokeWeight(1);
    sphere(m_radius);
    popStyle();

    pushStyle();
    strokeWeight(2);
    stroke(128);
    for (float j = 0; j < TWO_PI; j=j+0.1)
    {
      // Rotate with z being 0.
      point(cos(j)*150, sin(j)*150, 0);
    }
    popStyle();
  
    pushStyle();
    strokeWeight(2);
    stroke(128);
    for (float j = 0; j < TWO_PI; j=j+0.1)
    {
      // Rotate with y being 0.
      point(cos(j)*150, 0, sin(j)*150);
    }
    popStyle();
  }
}
