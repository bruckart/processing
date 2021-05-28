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
