

class SpherePoint
{
  PVector m_location;

  // spherical coordinates
  float m_radius = 200;
  float theta;
  float phi;
  
  // speed / velocity
  float thetaSpeed;
  float phiSpeed;

  float   m_range = 50;

  ArrayList<PVector> m_neighbors = new ArrayList<PVector>();

  int m_strokeWeight = int(random(1, 5));

  SpherePoint(PVector location)
  {
    m_location = location;

    thetaSpeed = random(-0.005, 0.005);
    phiSpeed   = random(-0.005, 0.005);
    
    // Compute the theta and phi based upon the x,y,z.
    theta = atan2(m_location.z, m_location.x);
    phi = acos(m_location.y / m_radius);  
  }

  void update()
  {
    theta += thetaSpeed;
    phi   += phiSpeed;
        
    float x = cos(theta) * sin(phi) * m_radius;
    float y = sin(theta) * sin(phi) * m_radius;
    float z = cos(phi) * m_radius;

    m_location.set(x, y, z);
  }
  
  PVector location() { return m_location; }

  void updateRegion(SpherePoint[] pnts)
  {
    m_neighbors.clear();

    for (int i = 0; i < pnts.length; i++)
    {
      if (pnts[i] == this) { continue; }

      if (m_location.dist(pnts[i].location()) < m_range)
      {
        m_neighbors.add(pnts[i].location());
      }
    }
  }

  void display()
  {
    pushStyle();
    strokeWeight(m_strokeWeight);
    stroke(#232323);
    point (m_location.x, m_location.y, m_location.z);
    popStyle();

    pushStyle();
    stroke(#607393);
    strokeWeight(0.75);
    for (int i = 0; i < m_neighbors.size(); i++)
    {
      PVector neighbor = m_neighbors.get(i);
      line(m_location.x, m_location.y, m_location.z,
           neighbor.x, neighbor.y, neighbor.z);
    }
    popStyle();
  }
};
