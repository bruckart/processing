 //<>//

class Box
{
  PVector m_center = new PVector();
  PVector m_top;  
  PVector m_bottom;

  PVector m_upperLeft;
  PVector m_upperRight;

  PVector m_lowerLeft;
  PVector m_lowerRight;


  Box(int x, int y)
  {
    m_center.x = x;
    m_center.y = y;

    m_top    = m_center.copy().add(new PVector(0, -75));
    m_bottom = m_center.copy().add(new PVector(0, 70));

    m_upperRight = m_center.copy().add(new PVector(65, -40));
    m_upperLeft  = m_center.copy().add(new PVector(-65, -40));

    m_lowerRight = m_bottom.copy().add(new PVector(65, -35));
    m_lowerLeft  = m_bottom.copy().add(new PVector(-65, -35));
  }

  void display()
  {
    pushMatrix();

    pushStyle();
    noFill();
    stroke(#4DA6AA);
    strokeWeight(2);
    point(m_center.x, m_center.y);

    strokeWeight(.2);
    stroke(122);

    line(m_center.x, m_center.y, m_bottom.x, m_bottom.y); 

    line(m_top.x, m_top.y, m_upperRight.x, m_upperRight.y);
    line(m_top.x, m_top.y, m_upperLeft.x, m_upperLeft.y);

    line(m_center.x, m_center.y, m_upperRight.x, m_upperRight.y);
    line(m_center.x, m_center.y, m_upperLeft.x, m_upperLeft.y);

    line(m_bottom.x, m_bottom.y, m_lowerRight.x, m_lowerRight.y);
    line(m_bottom.x, m_bottom.y, m_lowerLeft.x, m_lowerLeft.y);

    line(m_lowerRight.x, m_lowerRight.y, m_upperRight.x, m_upperRight.y);
    line(m_lowerLeft.x, m_lowerLeft.y, m_upperLeft.x, m_upperLeft.y);

    popStyle();
    popMatrix();
  }
}
