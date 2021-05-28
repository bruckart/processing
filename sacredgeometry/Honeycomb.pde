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
