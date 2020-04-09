

// This class takes 2 points and is able to return the bilinear normal
// from those 2 points.
class BilinearNormal
{
  public PVector m_start;
  public PVector m_stop;
  
  BilinearNormal(PVector start, PVector stop)
  {
    m_start = start;
    m_stop = stop;
  }
  
  
  PVector bilinearNormal()
  {
    PVector diff = PVector.sub(m_start, m_stop);
    PVector axis1 = new PVector(-diff.y, diff.x);
    PVector axis2 = diff.cross(axis1);
    // Note this mult or div depends is aesthetic based upon the 
    // diff value between the points. In this sketch, that value
    // is pretty high (80,000) based upon observations.
    axis2.div(50); 

    PVector planeNw = PVector.sub(m_start, axis1).add(axis2);
    PVector planeNe = PVector.add(m_start, axis1).add(axis2);
    PVector planeSw = PVector.sub(m_start, axis1).sub(axis2);
    PVector planeSe = PVector.add(m_start, axis1).sub(axis2);

    PVector nMid = planeNw.copy().sub(planeNe).div(2).add(m_start);
    PVector sMid = planeSe.copy().sub(planeSw).div(2).add(m_start);
    PVector eMid = planeSe.copy().sub(planeNe).div(2).add(m_start);
    PVector wMid = planeNw.copy().sub(planeSw).div(2).add(m_start);

    PVector mid = m_stop.copy().sub(m_start).div(2).add(m_start);
    PVector bn = wMid.copy().sub(m_start).add(mid);
    return bn;
  }
};
