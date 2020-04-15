

class ForceSphere
{
  
  public int m_numPnts  = 128;
  public float m_radius = 100;
  
  SpherePoint[] m_pnts;
  
  ForceSphere()
  {
    createPoints();
  }

  void update()
  {
    for (int i = 0; i < m_numPnts; i++)
    {
      m_pnts[i].update();
      m_pnts[i].updateRegion(m_pnts);
    }
  }

  void display()
  {
    for (int i = 0; i < m_numPnts; i++)
    {
      m_pnts[i].display();
    }
  }

  // Cook / Neumann
  void createPoints()
  {
    m_pnts = new SpherePoint[m_numPnts];
    for (int i = 0; i < m_numPnts; i++)
    {
      float a = 0;
      float b = 0;
      float c = 0;
      float d = 0;
      float k = 99;
      
      while (k >= 1.0) 
      { 
        a = random(-1.0, 1.0);
        b = random(-1.0, 1.0);
        c = random(-1.0, 1.0);
        d = random(-1.0, 1.0);
        k = a*a + b*b + c*c + d*d;
      }
  
      k = k / m_radius;
      PVector loc = new PVector((2 * (b*d + a*c) / k),
                                (2 * (c*d - a*b) / k),  
                                ((a*a + d*d - b*b - c*c) / k));
      m_pnts[i] = new SpherePoint(loc);
    }
  }
};
