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
