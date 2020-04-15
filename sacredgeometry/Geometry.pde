

public abstract class Geometry
{
  public abstract void update();
  public abstract void display();
};

class FramedCircle extends Geometry
{ 
  void update()
  {
  }

  void display()
  {
    pushStyle();
    stroke(80);
    strokeWeight(1);
    noFill();
    rect(100, 100, 400, 400);

    stroke(128);
    ellipse(300, 300, 400, 400);

    stroke(255);
    point(300, 300);
    popStyle();
  }
}

class Circles extends Geometry
{
  void update()
  {
  }

  void display()
  {
    pushStyle();
    noFill();
    stroke(255, 255, 255, 100);

    ellipse(-25, -50, 100, 100);
    ellipse(25, -50, 100, 100);

    ellipse(0, 0, 100, 100);
    ellipse(50, 0, 100, 100);
    ellipse(-50, 0, 100, 100);

    ellipse(-25, 50, 100, 100);
    ellipse(25, 50, 100, 100);
    popStyle();
  }
}

class Honeycomb extends Geometry
{
  void update()
  {
  }

  void display()
  {
    pushStyle();
    noFill();
    // stroke(255,255,255,100);

    PVector c  = new PVector(0, 0);
    PVector tl = c.copy().add(new PVector(-30, -50));
    PVector tr = c.copy().add(new PVector(30, -50));

    PVector l  = c.copy().add(new PVector(-60, 0));
    PVector r  = c.copy().add(new PVector(60, 0));

    PVector lr = c.copy().add(new PVector(30, 50));
    PVector ll = c.copy().add(new PVector(-30, 50));

    System.out.println("------");
    System.out.println("> " + tl.mag());
    System.out.println("> " + tr.mag());
    System.out.println("> " + r.mag());
    System.out.println("> " + lr.mag());
    System.out.println("> " + ll.mag());
    System.out.println("> " + l.mag());


    stroke(255);
    strokeWeight(3);
    point(tl.x, tl.y);
    point(tr.x, tr.y);
    point(r.x, r.y);
    point(lr.x, lr.y);
    point(ll.x, ll.y);
    point(l.x, l.y);

    stroke(155);
    strokeWeight(1);
    stroke(#B47310);
    line(tl.x, tl.y, tr.x, tr.y);
    line(tr.x, tr.y, r.x, r.y);
    line(r.x, r.y, lr.x, lr.y);
    line(lr.x, lr.y, ll.x, ll.y);
    line(ll.x, ll.y, l.x, l.y);
    line(l.x, l.y, tl.x, tl.y);

    stroke(100);
    line(c.x, c.y, tr.x, tr.y);
    line(c.x, c.y, r.x, r.y);
    line(c.x, c.y, lr.x, lr.y);
    line(c.x, c.y, ll.x, ll.y);
    line(c.x, c.y, l.x, l.y);
    line(c.x, c.y, tl.x, tl.y);

    stroke(70);
    ellipse(0, 0, 30, 30);

    // inner
    {
      //PVector p1 = c.copy()
      //PVector p2 = c.copy()
      //PVector p3 = c.copy()
      //PVector p4 = c.copy()
      //PVector p5 = c.copy()
      //PVector p6 = c.copy()
    }


    popStyle();
  }
}

class Pentagon extends Geometry
{

  PVector c = new PVector(0, 0);

  float m_innerRadius = 100;
  float m_outerRadius = 200;

  int   m_numPoints = 5;
  float m_angle = TWO_PI / (float) m_numPoints;

  void update()
  {
  }

  PVector[] createInnerPoints()
  {
    PVector[] ip = new PVector[5];
    for (int i = 0; i < m_numPoints; i++)
    {
      ip[i] = new PVector(m_innerRadius * sin(m_angle * i), 
        m_innerRadius * cos(m_angle * i));
    }
    return ip;
  }

  PVector[] createOuterPoints()
  {
    PVector[] op = new PVector[5];
    for (int i = 0; i < m_numPoints; i++)
    {
      op[i] = new PVector(m_outerRadius * sin(m_angle * i), 
        m_outerRadius * cos(m_angle * i));
    }
    return op;
  }

  void display()
  {
    pushStyle();
    strokeWeight(5);
    stroke(255);
    point(c.x, c.y);
    {
      strokeWeight(1);
      stroke(100);
      noFill();
      // ellipse(c.x, c.y, 100, 100);
    }

    strokeWeight(1);
    float angle = TWO_PI / (float) 10;
    point(20 * sin(angle * 1), 20 * cos(angle * 1));
    point(20 * sin(angle * 3), 20 * cos(angle * 3));
    point(20 * sin(angle * 5), 20 * cos(angle * 5));
    point(20 * sin(angle * 7), 20 * cos(angle * 7));
    point(20 * sin(angle * 9), 20 * cos(angle * 9));


    PVector[] innerPnts = createInnerPoints();
    PVector[] outerPnts = createOuterPoints();

    //System.out.println("> " + innerPnts.length);
    //System.out.println("> " + outerPnts.length);

    for (int i = 0; i < innerPnts.length; i++)
    {
      stroke(255);
      strokeWeight(3);
      point(innerPnts[i].x, innerPnts[i].y);

      stroke(100);
      strokeWeight(1);
      line(innerPnts[i].x, innerPnts[i].y, 0, 0);
    }

    {
      strokeWeight(1);
      stroke(100);
      int i = 0;
      line(innerPnts[i].x, innerPnts[i].y, innerPnts[i+1].x, innerPnts[i+1].y);
      i++;
      line(innerPnts[i].x, innerPnts[i].y, innerPnts[i+1].x, innerPnts[i+1].y);
      i++;
      line(innerPnts[i].x, innerPnts[i].y, innerPnts[i+1].x, innerPnts[i+1].y);
      i++;
      line(innerPnts[i].x, innerPnts[i].y, innerPnts[i+1].x, innerPnts[i+1].y);
      line(innerPnts[i+1].x, innerPnts[i+1].y, innerPnts[0].x, innerPnts[0].y);
    }

    strokeWeight(3);
    stroke(255);
    for (int i = 0; i < outerPnts.length; i++)
    {
      point(outerPnts[i].x, outerPnts[i].y);
    }     

    strokeWeight(1);
    stroke(100);
    int i = 0;
    line(outerPnts[i].x, outerPnts[i].y, outerPnts[i+1].x, outerPnts[i+1].y);
    i++;
    line(outerPnts[i].x, outerPnts[i].y, outerPnts[i+1].x, outerPnts[i+1].y);
    i++;
    line(outerPnts[i].x, outerPnts[i].y, outerPnts[i+1].x, outerPnts[i+1].y);
    i++;
    line(outerPnts[i].x, outerPnts[i].y, outerPnts[i+1].x, outerPnts[i+1].y);
    i++;
    line(outerPnts[i].x, outerPnts[i].y, outerPnts[0].x, outerPnts[0].y);

    i = 0;
    strokeWeight(3);
    stroke(255);
    point(outerPnts[i].x, outerPnts[i].y);
    i++;
    point(outerPnts[i].x, outerPnts[i].y);
    i++;
    point(outerPnts[i].x, outerPnts[i].y);
    i++;
    point(outerPnts[i].x, outerPnts[i].y);
    i++;
    point(outerPnts[i].x, outerPnts[i].y);

    strokeWeight(1);
    stroke(100);
    i = 0;
    line(innerPnts[i].x, innerPnts[i].y, outerPnts[i].x, outerPnts[i].y);
    i++;
    line(innerPnts[i].x, innerPnts[i].y, outerPnts[i].x, outerPnts[i].y);
    i++;
    line(innerPnts[i].x, innerPnts[i].y, outerPnts[i].x, outerPnts[i].y);
    i++;
    line(innerPnts[i].x, innerPnts[i].y, outerPnts[i].x, outerPnts[i].y);
    i++;
    line(innerPnts[i].x, innerPnts[i].y, outerPnts[i].x, outerPnts[i].y);

    angle = TWO_PI / (float) 10;
    float radius = 162;
    PVector m1 = new PVector(radius * sin(angle * 1), radius * cos(angle * 1));
    PVector m2 = new PVector(radius * sin(angle * 3), radius * cos(angle * 3));
    PVector m3 = new PVector(radius * sin(angle * 5), radius * cos(angle * 5));
    PVector m4 = new PVector(radius * sin(angle * 7), radius * cos(angle * 7));
    PVector m5 = new PVector(radius * sin(angle * 9), radius * cos(angle * 9));

    stroke(255);
    strokeWeight(2);
    point(m1.x, m1.y);
    point(m2.x, m2.y);
    point(m3.x, m3.y);
    point(m4.x, m4.y);
    point(m5.x, m5.y);
    popStyle();
    
    strokeWeight(1);
    stroke(55);
    line(m1.x, m1.y, innerPnts[0].x, innerPnts[0].y);
    line(m1.x, m1.y, innerPnts[1].x, innerPnts[1].y);
    line(m2.x, m2.y, innerPnts[1].x, innerPnts[1].y);
    line(m2.x, m2.y, innerPnts[2].x, innerPnts[2].y);
    line(m3.x, m3.y, innerPnts[2].x, innerPnts[2].y);
    line(m3.x, m3.y, innerPnts[3].x, innerPnts[3].y);
    line(m4.x, m4.y, innerPnts[3].x, innerPnts[3].y);
    line(m4.x, m4.y, innerPnts[4].x, innerPnts[4].y);
    line(m5.x, m5.y, innerPnts[4].x, innerPnts[4].y);
    line(m5.x, m5.y, innerPnts[0].x, innerPnts[0].y);
    strokeWeight(3);
    stroke(255);
    point(m1.x, m1.y);
    point(m2.x, m2.y);
    point(m3.x, m3.y);
    point(m4.x, m4.y);
    point(m5.x, m5.y);
  }
}
