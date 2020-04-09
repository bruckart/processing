



public static int numUpdates = 0;


class KochCrown
{
  public int m_numPnts;

  public int m_radius = 100;
  private float m_angle;
  
  private final int FRACTAL_LIMIT = 8;
  
  private ArrayList<KochLine> m_lines = new ArrayList<KochLine>();

  KochCrown(int numPnts)
  {
    m_numPnts = numPnts;
    m_angle = TWO_PI / m_numPnts;

    for (int i = 0; i < m_numPnts; i++)
    {
      float x1 = m_radius * sin(m_angle*i);
      float y1 = m_radius * cos(m_angle*i);

      float x2 = m_radius * sin(m_angle*(i+1));
      float y2 = m_radius * cos(m_angle*(i+1));

      PVector start = new PVector(x1, y1, 0);
      PVector stop  = new PVector(x2, y2, 0);

      KochLine kl = new KochLine(start, stop);
      m_lines.add(kl);
    }   
  }

  void update()
  {
    if (numUpdates > FRACTAL_LIMIT)
    {
      System.out.println("Update Limit Reached");
      return;
    }

    for (int i = 0; i < m_lines.size(); i++)
    {
      // Note that each update will create 4 more instances.
      KochLine l = m_lines.get(i);
      l.update();
    }

    numUpdates++;
  }

  void display()
  {
    for (int i = 0; i < m_lines.size(); i++)
    {
      KochLine l = m_lines.get(i);
      l.display();
    }
  }
};
