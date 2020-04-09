
class KochLine
{
  PVector m_start = new PVector();
  PVector m_stop  = new PVector();

  private ArrayList<KochLine> m_children = new ArrayList<KochLine>();
  
  public float m_rotation = 20;
  

  KochLine(PVector start, PVector stop)
  {
    m_start = start;
    m_stop = stop;

    // Upon initial creation.
    m_children.clear();
  }
  
  void update()
  {    
    if (m_children.isEmpty())
    {
      PVector segment = PVector.sub(m_stop, m_start).div(3);
  
      PVector p1 = m_start.copy();
      PVector p2  = m_start.copy().add(segment);
      PVector bn = rotate(p2, segment, this.m_rotation);
      PVector p3 = p2.copy().add(segment);
      PVector p4  = p3.copy().add(segment);
   
      KochLine l1 = new KochLine(p1, p2);
      KochLine l2 = new KochLine(p2, bn);
      KochLine l3 = new KochLine(bn, p3);
      KochLine l4 = new KochLine(p3, p4);
      m_children.add(l1);
      m_children.add(l2);
      m_children.add(l3);
      m_children.add(l4);
    }
    else
    {
      for (KochLine l : m_children)
      {
        l.update();
      }
    }
  }

  void display()
  {
    if (m_children.isEmpty())
    {
      pushStyle();
      strokeWeight(1);
      stroke(255, 100);
      
      line(m_start.x, m_start.y, m_start.z,
           m_stop.x, m_stop.y, m_stop.z);
      popStyle();
    }
    else
    {
      for (KochLine l : m_children)
      {
        l.display();
      }
    }
  }

  PVector rotate(PVector start, PVector segment, float theta)
  {
    PVector startPoint = start.copy();
    PVector stopPoint = startPoint.copy().add(segment.copy());

    PVector mid = stopPoint.copy().sub(startPoint.copy());
    mid.div(2);
    mid.add(startPoint);
    
    BilinearNormal bn = new BilinearNormal(startPoint, stopPoint);
    PVector bnPnt = bn.bilinearNormal();
    
    PVector mp = m_stop.copy().sub(m_start).div(2).add(m_start);

    
    // tan(theta) = (bnPnt/adjacent)
    float adj = sqrt((mp.x * mp.x) + (mp.y * mp.y));
    float hgt = tan(radians(theta)) * adj;
    
    PVector h = bnPnt.copy().sub(mp);
    h.normalize().mult(hgt);
    // h.limit(5); // 
    mp.add(h);
    
    // easter egg: add a limit to mp to turn this into a snowflake
    return mp;
  }
};
