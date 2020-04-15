
class Liquid
{
  private PVector m_minContainer = new PVector(-200,-200,-200);
  private PVector m_maxContainer = new PVector(200,200,-100);

  float m_dragCoefficient = 2;

  Liquid()
  {
  }

  void display()
  {
    pushStyle();
    noFill();
    stroke(216, 24, 207, 200);
  
    beginShape(QUADS);
    vertex(m_minContainer.x, m_minContainer.y, m_minContainer.z);
    vertex(m_maxContainer.x, m_minContainer.y, m_minContainer.z);
    vertex(m_maxContainer.x, m_maxContainer.y, m_minContainer.z);
    vertex(m_minContainer.x, m_maxContainer.y, m_minContainer.z);
    endShape();
  
    beginShape(QUADS);
    vertex(m_minContainer.x, m_minContainer.y, m_maxContainer.z);
    vertex(m_maxContainer.x, m_minContainer.y, m_maxContainer.z);
    vertex(m_maxContainer.x, m_maxContainer.y, m_maxContainer.z);
    vertex(m_minContainer.x, m_maxContainer.y, m_maxContainer.z);
    endShape();
  
    beginShape(LINES);
    vertex(m_minContainer.x, m_minContainer.y, m_minContainer.z);
    vertex(m_minContainer.x, m_minContainer.y, m_maxContainer.z);
    endShape();
  
    beginShape(LINES);
    vertex(m_maxContainer.x, m_maxContainer.y, m_minContainer.z);
    vertex(m_maxContainer.x, m_maxContainer.y, m_maxContainer.z);
    endShape();
  
    beginShape(LINES);
    vertex(m_minContainer.x, m_maxContainer.y, m_minContainer.z);
    vertex(m_minContainer.x, m_maxContainer.y, m_maxContainer.z);
    endShape();
  
    beginShape(LINES);
    vertex(m_maxContainer.x, m_minContainer.y, m_minContainer.z);
    vertex(m_maxContainer.x, m_minContainer.y, m_maxContainer.z);
    endShape();
  
    popStyle();
  }

    
  boolean contains(MovingSphere ms)
  {
    // Note that since the x and y match, we only need to check the z.
    if (ms.m_loc.z <= m_maxContainer.z)
    {
      return true;
    }
    return false;
  }

  // Calculate drag force
  PVector drag(MovingSphere ms)
  {
    // Magnitude is coefficient * speed squared
    float speed = ms.m_vel.mag();
    float dragMagnitude = m_dragCoefficient * speed * speed;

    // Direction is inverse of velocity
    PVector drag = ms.m_vel.copy();
    drag.mult(-1);

    // Scale according to magnitude
    drag.setMag(dragMagnitude);
    return drag;
  }
}
