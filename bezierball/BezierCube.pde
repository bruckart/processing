

class BezierCube
{
  PVector[] v = new PVector[8];  // vertices
  PVector[] c = new PVector[24]; // control points
 
  ArrayList m; // mid points  
  ArrayList e; // extension points

  PVector cen; // Center Point

  int x, y, z;   // origin coordinates
  float w, h, l; // legnth, width, and height

  float intensity;
  boolean show;

  BezierCube() 
  {
  }

  BezierCube(int x, int y, int z, float w, float h, float l)
  {
    this.x = x;
    this.y = y;
    this.z = z;

    this.w = w;
    this.h = h;
    this.l = l;
    
    cen = new PVector(this.x + this.w/2,
                      this.y + this.h/2,
                      this.z + this.l/2);

    m = new ArrayList();
    e = new ArrayList();

    this.show = false;
    intensity = 1;

    initializeCube();
  }

  void initializeCube()
  {
    // back
    v[0] =  new PVector(this.x,this.y,this.z);
    v[1] =  new PVector(this.x+this.w,this.y,this.z);
    v[2] =  new PVector(this.x,this.y+this.h, this.z);
    v[3] =  new PVector(this.x+this.w, this.y+this.h, this.z);

    // front
    v[4] =  new PVector(this.x, this.y, this.z+this.l);
    v[5] =  new PVector(this.x+this.w, this.y, this.z+this.l);
    v[6] =  new PVector(this.x, this.y+this.h, this.z+this.l);
    v[7] =  new PVector(this.x+this.w, this.y+this.h, this.z+this.l);

    c[0] = controlPoint(v[0], v[4]); // 0 to 4
    c[1] = controlPoint(v[0], v[4]);
    c[2] = controlPoint(v[1], v[5]); // 1 to 5
    c[3] = controlPoint(v[1], v[5]);
    c[4] = controlPoint(v[2], v[6]); // 2 to 6
    c[5] = controlPoint(v[2], v[6]);
    c[6] = controlPoint(v[3], v[7]); // 3 to 7
    c[7] = controlPoint(v[3], v[7]);

    c[8]  = controlPoint(v[0], v[1]); // 0 and 1
    c[9]  = controlPoint(v[0], v[1]);
    c[10] = controlPoint(v[4], v[5]); // 4 and 5
    c[11] = controlPoint(v[4], v[5]);
    c[12] = controlPoint(v[2], v[3]); // 2 and 3
    c[13] = controlPoint(v[2], v[3]);
    c[14] = controlPoint(v[6], v[7]); // 6 and 7
    c[15] = controlPoint(v[6], v[7]);

    c[16] = controlPoint(v[0], v[2]); // 0 and 2
    c[17] = controlPoint(v[0], v[2]);
    c[18] = controlPoint(v[1], v[3]); // 1 and 3
    c[19] = controlPoint(v[1], v[3]);
    c[20] = controlPoint(v[4], v[6]); // 4 and 6
    c[21] = controlPoint(v[4], v[6]);
    c[22] = controlPoint(v[5], v[7]); // 5 and 7
    c[23] = controlPoint(v[5], v[7]);
  }

  void drawCubeLines()
  {
    // Lines
    stroke(128);
    // 0 to 4
    line(v[0].x, v[0].y, v[0].z,
    v[4].x, v[4].y, v[4].z);
    // 1 to 5
    line(v[1].x, v[1].y, v[1].z,
    v[5].x, v[5].y, v[5].z);
    // 2 to 6
    line(v[2].x, v[2].y, v[2].z,
    v[6].x, v[6].y, v[6].z);    
    // 3 to 7
    line(v[3].x, v[3].y, v[3].z,
    v[7].x, v[7].y, v[7].z);

    // 0 and 1
    line(v[0].x, v[0].y, v[0].z,
    v[1].x, v[1].y, v[1].z);
    // 4 and 5
    line(v[4].x, v[4].y, v[4].z,
    v[5].x, v[5].y, v[5].z);
    // 2 and 3
    line(v[2].x, v[2].y, v[2].z,
    v[3].x, v[3].y, v[3].z);
    // 6 and 7
    line(v[6].x, v[6].y, v[6].z,
    v[7].x, v[7].y, v[7].z);

    // 0 to 2
    line(v[0].x, v[0].y, v[0].z,
    v[2].x, v[2].y, v[2].z);
    // 1 to 3
    line(v[1].x, v[1].y, v[1].z,
    v[3].x, v[3].y, v[3].z);
    // 4 to 6
    line(v[4].x, v[4].y, v[4].z,
    v[6].x, v[6].y, v[6].z);
    // 5 to 7
    line(v[5].x, v[5].y, v[5].z,
    v[7].x, v[7].y, v[7].z);
  }

  void drawCenterPoint()
  {
    pushStyle();
    strokeWeight(1);
    stroke(104, 202, 120);
    point(this.cen.x, this.cen.y, this.cen.z);
    popStyle();
  }

  void drawExtensionPoints()
  {
    for (int i = 0; i < this.e.size(); i++)
    {
       PVector e = (PVector) this.e.get(i);
       pushStyle();
       strokeWeight(1);
       stroke(255);
       point(e.x, e.y, e.z);
       popStyle();
    }
  }

  void drawMidPoints()
  {
    for (int i = 0; i < this.m.size(); i++)
    {
      PVector m = (PVector) this.m.get(i);

      pushStyle();
      strokeWeight(2);
      stroke(0,255,0);
      point(m.x, m.y, m.z);
      popStyle();
    }
  }

  // Computes the control point between 2 specified points.
  PVector controlPoint(PVector a, PVector b)
  {
    // Mid Point
    PVector m = new PVector((b.x - a.x)/2,
                            (b.y - a.y)/2,
                            (b.z - a.z)/2);

    if ((a.x == b.x) && (a.x != 0)) { m.x = a.x; }
    if ((a.y == b.y) && (a.y != 0)) { m.y = a.y; }
    if ((a.z == b.z) && (a.z != 0)) { m.z = a.z; }

    this.m.add(m);

    PVector ext = new PVector();
    if ((m.x < this.cen.x) && (m.y < this.cen.y) && (m.z == this.cen.z))
    {
      ext = new PVector(this.cen.x - this.w, this.cen.y - this.l, m.z);
      this.e.add(ext);
    }
    else if ((m.x > this.cen.x) && (m.y < this.cen.y) && (m.z == this.cen.z))
    {
      ext = new PVector(this.cen.x + this.w, this.cen.y - this.l, m.z);
      this.e.add(ext);
    }
    else if ((m.x < this.cen.x) && (m.y > this.cen.y) && (m.z == this.cen.z))
    {
      ext = new PVector(this.cen.x - this.w, this.cen.y + this.l, m.z);
      this.e.add(ext);
    }
    else if ((m.x > this.cen.x) && (m.y > this.cen.y) && (m.z == this.cen.z))
    {
      ext = new PVector(this.cen.x + this.w, this.cen.y + this.l, m.z);
      this.e.add(ext);
    }

    if ((m.x == this.cen.x) && (m.y < this.cen.y) && (m.z < this.cen.z))
    {
      ext = new PVector(m.x, this.cen.y - this.l, this.cen.z - this.h);
      this.e.add(ext);
    }
    else if ((m.x == this.cen.x) && (m.y > this.cen.y) && (m.z < this.cen.z))
    {
      ext = new PVector(m.x, this.cen.y + this.l, this.cen.z - this.h);
      this.e.add(ext);
    }
    else if ((m.x == this.cen.x) && (m.y < this.cen.y) && (m.z > this.cen.z))
    {
      ext = new PVector(m.x, this.cen.y - this.l, this.cen.z + this.h);
      this.e.add(ext);
    }
    else if ((m.x == this.cen.x) && (m.y > this.cen.y) && (m.z > this.cen.z))
    {
      ext = new PVector(m.x, this.cen.y + this.l, this.cen.z + this.h);
      this.e.add(ext);
    }

    if ((m.y == this.cen.y) && (m.x < this.cen.x) && (m.z < this.cen.z))
    {
      ext = new PVector(this.cen.x - this.w, m.y, this.cen.z - this.h);
      this.e.add(ext);
    }
    else if ((m.y == this.cen.y) && (m.x < this.cen.x) && (m.z > this.cen.z))
    {
      ext = new PVector(this.cen.x - this.w, m.y, this.cen.z + this.h);
      this.e.add(ext);
    }
    else if ((m.y == this.cen.y) && (m.x > this.cen.x) && (m.z < this.cen.z))
    {
      ext = new PVector(this.cen.x + this.w, m.y, this.cen.z - this.h);
      this.e.add(ext);
    }
    else if ((m.y == this.cen.y) && (m.x > this.cen.x) && (m.z > this.cen.z))
    {
      ext = new PVector(this.cen.x + this.w, m.y, this.cen.z + this.h);
      this.e.add(ext);
    }
    
    // return new PVector(this.cen.x, this.cen.y, this.cen.z);
    float ex = lerp(this.cen.x, ext.x, this.intensity);
    float ey = lerp(this.cen.y, ext.y, this.intensity);
    float ez = lerp(this.cen.z, ext.z, this.intensity);
    return new PVector(ex,ey,ez);
  }

  void drawCubeCurves()
  {
    c[0] = controlPoint(v[0], v[4]); // 0 to 4
    c[1] = controlPoint(v[0], v[4]);
    c[2] = controlPoint(v[1], v[5]); // 1 to 5
    c[3] = controlPoint(v[1], v[5]);
    c[4] = controlPoint(v[2], v[6]); // 2 to 6
    c[5] = controlPoint(v[2], v[6]);
    c[6] = controlPoint(v[3], v[7]); // 3 to 7
    c[7] = controlPoint(v[3], v[7]);

    c[8]  = controlPoint(v[0], v[1]); // 0 and 1
    c[9]  = controlPoint(v[0], v[1]);
    c[10] = controlPoint(v[4], v[5]); // 4 and 5
    c[11] = controlPoint(v[4], v[5]);
    c[12] = controlPoint(v[2], v[3]); // 2 and 3
    c[13] = controlPoint(v[2], v[3]);
    c[14] = controlPoint(v[6], v[7]); // 6 and 7
    c[15] = controlPoint(v[6], v[7]);

    c[16] = controlPoint(v[0], v[2]); // 0 and 2
    c[17] = controlPoint(v[0], v[2]);
    c[18] = controlPoint(v[1], v[3]); // 1 and 3
    c[19] = controlPoint(v[1], v[3]);
    c[20] = controlPoint(v[4], v[6]); // 4 and 6
    c[21] = controlPoint(v[4], v[6]);
    c[22] = controlPoint(v[5], v[7]); // 5 and 7
    c[23] = controlPoint(v[5], v[7]);

    pushStyle();
    // Bezier Curves
    stroke(154, 82, 0);
    // 0 to 4
    bezier(v[0].x, v[0].y, v[0].z,
          c[0].x, c[0].y, c[0].z,
          c[1].y, c[1].y, c[1].z,
          v[4].x, v[4].y, v[4].z);
    // 1 to 5
    bezier(v[1].x, v[1].y, v[1].z,
          c[2].x, c[2].y, c[2].z,
          c[3].x, c[3].y, c[3].z,
          v[5].x,v[5].y,v[5].z);
    // 2 to 6
    bezier(v[2].x, v[2].y, v[2].z,
    c[4].x, c[4].y, c[4].z,
    c[5].x, c[5].y, c[5].z,
    v[6].x, v[6].y, v[6].z);
    // 3 to 7
    bezier(v[3].x,v[3].y, v[3].z,
    c[6].x, c[6].y, c[6].z,
    c[7].x, c[7].y, c[7].z,
    v[7].x, v[7].y, v[7].z);

    // 0 and 1
    bezier(v[0].x, v[0].y, v[0].z,
    c[8].x, c[8].y, c[8].z,
    c[9].x, c[9].y, c[9].z,
    v[1].x, v[1].y, v[1].z); 
    // 4 and 5
    bezier(v[4].x,  v[4].y,  v[4].z,
    c[10].x, c[10].y, c[10].z,
    c[11].x, c[11].y, c[11].z,
    v[5].x,  v[5].y,  v[5].z);
    // 2 and 3
    bezier(v[2].x,  v[2].y,  v[2].z,
    c[12].x, c[12].y, c[12].z,
    c[13].x, c[13].y, c[13].z,
    v[3].x,  v[3].y,  v[3].z);
    // 6 and 7
    bezier(v[6].x,  v[6].y,  v[6].z,
    c[14].x, c[14].y, c[14].z,
    c[15].x, c[15].y, c[15].z,
    v[7].x,  v[7].y,  v[7].z);

    // 0 and 2
    bezier(v[0].x,  v[0].y,  v[0].z,
    c[16].x, c[16].y, c[16].z,
    c[16].x, c[17].y, c[17].z,
    v[2].x,  v[2].y,  v[2].z); 
    // 1 and 3
    bezier(v[1].x,  v[1].y,  v[1].z,
    c[18].x, c[18].y, c[19].z,
    c[19].x, c[19].y, c[19].z,
    v[3].x,  v[3].y,  v[3].z);
    // 4 and 6
    bezier(v[4].x,  v[4].y,  v[4].z,
    c[20].x, c[20].y, c[20].z,
    c[21].x, c[21].y, c[21].z,
    v[6].x,  v[6].y,  v[6].z);
    // 5 and 7
    bezier(v[5].x,  v[5].y,  v[5].z,
    c[22].x, c[22].y, c[22].z,
    c[23].x, c[23].y, c[23].z,
    v[7].x,  v[7].y,  v[7].z);
    popStyle();
  }
  
  void drawHelix(float alp)
  {
    pushStyle();
    // 12 extension points
    PVector h0 = (PVector) this.e.get(0);
    PVector h1 = (PVector) this.e.get(1);
    PVector h2 = (PVector) this.e.get(2);
    PVector h3 = (PVector) this.e.get(3);
    PVector h4 = (PVector) this.e.get(4);
    PVector h5 = (PVector) this.e.get(5);
    PVector h6 = (PVector) this.e.get(6);
    PVector h7 = (PVector) this.e.get(7);
    PVector h8 = (PVector) this.e.get(8);
    PVector h9 = (PVector) this.e.get(9);
    PVector h10 = (PVector) this.e.get(10);
    PVector h11 = (PVector) this.e.get(11);
    PVector h12 = (PVector) this.e.get(12);
    PVector h13 = (PVector) this.e.get(13);
    PVector h14 = (PVector) this.e.get(14);
    PVector h15 = (PVector) this.e.get(15);
    PVector h16 = (PVector) this.e.get(16);
    PVector h17 = (PVector) this.e.get(17);
    PVector h18 = (PVector) this.e.get(18);
    PVector h19 = (PVector) this.e.get(19);
    PVector h20 = (PVector) this.e.get(20);
    PVector h21 = (PVector) this.e.get(21);
    PVector h22 = (PVector) this.e.get(22);
    PVector h23 = (PVector) this.e.get(23);  

    strokeWeight(1);
    color c = color(255,255,255,alp);
    fill(c);
    
    stroke(c);
    line(h1.x, h1.y, h1.z, h8.x, h8.y, h8.z);
    line(h1.x, h1.y, h1.z, h10.x, h10.y, h10.z);
    line(h2.x, h2.y, h2.z, h8.x, h8.y, h8.z);
    line(h2.x, h2.y, h2.z, h10.x, h10.y, h10.z);

    line(h5.x, h5.y, h5.z, h12.x, h12.y, h12.z);
    line(h5.x, h5.y, h5.z, h15.x, h15.y, h15.z);
    line(h6.x, h6.y, h7.z, h12.x, h12.y, h12.z);
    line(h6.x, h6.y, h7.z, h15.x, h15.y, h15.z);

    line(h2.x, h2.y, h2.z, h18.x, h18.y, h18.z);
    line(h2.x, h2.y, h2.z, h22.x, h22.y, h22.z);
    line(h7.x, h7.y, h7.z, h18.x, h18.y, h18.z);
    line(h7.x, h7.y, h7.z, h22.x, h22.y, h22.z);
    
    line(h1.x, h1.y, h1.z, h17.x, h17.y, h17.z);
    line(h1.x, h1.y, h1.z, h20.x, h20.y, h20.z);
    line(h5.x, h5.y, h5.z, h17.x, h17.y, h17.z);
    line(h5.x, h5.y, h5.z, h20.x, h20.y, h20.z);
    
    line(h9.x, h9.y, h9.z, h17.x, h17.y, h17.z);
    line(h9.x, h9.y, h9.z, h17.x, h17.y, h17.z);
    line(h13.x, h13.y, h13.z, h19.x, h19.y, h19.z);
    line(h13.x, h13.y, h13.z, h19.x, h19.y, h19.z);
    
    line(h11.x, h11.y, h11.z, h20.x, h20.y, h20.z);
    line(h11.x, h11.y, h11.z, h20.x, h20.y, h20.z);
    line(h14.x, h14.y, h14.z, h22.x, h22.y, h22.z);
    line(h14.x, h14.y, h14.z, h22.x, h22.y, h22.z);


    line(h9.x, h9.y, h9.z, h19.x, h19.y, h19.z);
    line(h13.x, h13.y, h13.z, h16.x, h16.y, h16.z);
    line(h15.x, h15.y, h15.z, h20.x, h20.y, h20.z);
    line(h11.x, h11.y, h11.z, h23.x, h23.y, h23.z);
    popStyle();
  }

  void draw()
  {
    if (this.show)
    {
      drawCubeLines();
      drawCenterPoint();
      drawMidPoints();
      drawExtensionPoints();
      drawHelix(random(7, 21));
    }

    drawCubeCurves();
  }
  
  void keyPressed()
  {
    if (key == 'd')
    {
      if (this.show == true)
      {
        this.show = false;
      }
      else
      {
        this.show = true;
      }
    }
  }

  void mouseMoved(float i)
  {
    // Prevent a lerp encompassing 0.00.
    this.intensity = i + 0.01;
  }
}
