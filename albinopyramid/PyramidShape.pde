class PyramidShape
{
  PVector p1 = new PVector(-50, 50, 0);
  PVector p2 = new PVector(-50, -50, 0);
  PVector p3 = new PVector(50, -50, 0);
  PVector p4 = new PVector(50, 50, 0);
  PVector p5 = new PVector(0, 0, 80);
  
  void update()
  {
  }

  void display()
  {

    // this pyramid has 4 sides, each drawn as a separate triangle
    // each side has 3 vertices, making up a triangle shape
    // the parameter " t " determines the size of the pyramid
    //***
    {
      pushStyle();
      stroke(#08329B);
      strokeWeight(2);
      point(p1.x, p1.y, p1.z);
      point(p2.x, p2.y, p2.z);
      point(p3.x, p3.y, p3.z);
      point(p4.x, p4.y, p4.z);
      
      stroke(#FF329B);
      point(p5.x, p5.y, p5.z);
      popStyle();
    }
    
    beginShape(TRIANGLES);
    noFill();

    vertex( p1.x, p1.y, p1.z);
    vertex( p2.x, p2.y, p2.z);
    vertex( p5.x, p5.y, p5.z);
  
    vertex( p2.x, p2.y, p2.z);
    vertex( p3.x, p3.y, p3.z);
    vertex( p5.x, p5.y, p5.z);
  
    vertex( p3.x, p3.y, p3.z);
    vertex( p4.x, p4.y, p4.z);
    vertex( p5.x, p5.y, p5.z);
    
    vertex( p4.x, p4.y, p4.z);
    vertex( p1.x, p1.y, p1.z);
    vertex( p5.x, p5.y, p5.z);
  
    endShape();
  }
}
