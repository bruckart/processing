

class MovingSphere
{
  public PVector m_loc = new PVector();
  public PVector m_vel = new PVector();
  public PVector m_acc = new PVector();
  public color   m_c   = color(200, 200, 200, 100);
  
  public float m_mass   = 20;
  private float m_radius = 16; // random(5, 20);
  
  MovingSphere()
  {
    m_loc = PVector.random3D().mult(200);
    m_vel = PVector.random3D().mult(2);
  }
  
  void setVel(PVector v)
  {
    m_vel = v;
  }
  
  void update()
  {
    if (m_pause)
    { 
      return;
    }
    m_vel.add(m_acc);
    m_loc.add(m_vel);
    m_acc.mult(0);
  }
  
  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, m_mass);
    m_acc.add(f);
  }

  void display()
  {
    pushMatrix();
    pushStyle();
    translate(m_loc.x, m_loc.y, m_loc.z);
    noFill();
    stroke(m_c);
    strokeWeight(0.5);
    
    float detail = (mouseX*15/width);
    //System.out.println("> " + mouseX);
    //System.out.println("> " + width);
    // System.out.println("> " + detail);
    sphereDetail(int(detail));
    sphere(m_radius);
    popStyle();
    popMatrix();
  }

  void checkBoundaries()
  {
    if (m_loc.z >= 200 - m_radius)
    {
      m_loc.z = 200 - m_radius;
      m_vel.z *= -1;
    }
    else if (m_loc.z <= -200 + m_radius)
    {
      m_loc.z = -200 + m_radius;
      m_vel.z *= -1;
    }

    if (m_loc.x >= 200 - m_radius)
    {
      m_loc.x = 200 - m_radius;
      m_vel.x *= -1;
    }
    else if (m_loc.x <= -200 + m_radius)
    {
      m_loc.x = -200 + m_radius;
      m_vel.x *= -1;
    }

    if (m_loc.y >= 200 - m_radius)
    {
      m_loc.y = 200 - m_radius;
      m_vel.y *= -1;
    }
    else if (m_loc.y <= -200 + m_radius)
    {
      m_loc.y = -200 + m_radius;
      m_vel.y *= -1;
    }
  }
  
  void checkCollision(MovingSphere ms)
  {
    // PVector diffCpy = ms.m_loc.copy();
    PVector diff    = ms.m_loc.copy().sub(m_loc);
    float   dist    = diff.mag(); // the distance between the spheres
    boolean collision = (dist <= m_radius*2) ? true : false;

    // float dx = ms.m_loc.x - this.m_loc.x;
    // float dy = ms.m_loc.y - this.m_loc.y;

    if (collision)
    {
      // System.out.println("Collision Encountered");
      //float normalX = diff.x / dist;
      //float normalY = diff.y / dist;
      //float normalZ = diff.z / dist;
      
      PVector diffNormal = diff.div(dist);

      PVector midpoint = (this.m_loc.copy().add(ms.m_loc)).div(2);
      // drawPoint(midpoint);
      
      //float midpointX = (this.m_loc.x + ms.m_loc.x)/2;
      //float midpointY = (this.m_loc.y + ms.m_loc.y)/2;
      //float midpointZ = (this.m_loc.z + ms.m_loc.z)/2;

      //this.m_loc.x = midpoint.x - this.m_radius * diffNormal.x;
      //this.m_loc.y = midpoint.y - this.m_radius * diffNormal.y;
      //this.m_loc.z = midpoint.z - this.m_radius * diffNormal.z;

      //ms.m_loc.x   = midpoint.x + ms.m_radius * diffNormal.x;
      //ms.m_loc.y   = midpoint.y + ms.m_radius * diffNormal.y;
      //ms.m_loc.z   = midpoint.z + ms.m_radius * diffNormal.z;

      //drawPoint(this.m_loc);
      //drawPoint(ms.m_loc);
    
      float dVector = (this.m_vel.x - ms.m_vel.x) * diffNormal.x;
      dVector +=      (this.m_vel.y - ms.m_vel.y) * diffNormal.y;
      dVector +=      (this.m_vel.z - ms.m_vel.z) * diffNormal.z;

      // PVector dv = diffNormal.mult(dVector); // .mult(diffNormal);
      float dvx = dVector * diffNormal.x;
      float dvy = dVector * diffNormal.y;
      float dvz = dVector * diffNormal.z;

      this.m_vel.x -= dvx;
      this.m_vel.y -= dvy;
      this.m_vel.z -= dvz;

      ms.m_vel.x += dvx;
      ms.m_vel.y += dvy;
      ms.m_vel.z += dvz;
    }

    //// diff.rotate(PI);
    //diff.z *= -1;
    //diff.normalize();
    //diff.mult(m_radius);

    //drawCenterPoint(this.m_loc);

    //PVector velPnt = this.m_loc.copy().add(this.m_vel.copy().normalize().mult(m_radius));
    //drawVelPoint(velPnt);
    
    //PVector intersect = this.m_loc.copy().add(diff); 
    //// drawThisIntersectPoint(intersect); // Green

    //PVector oppIntersect = diff.copy();
    //oppIntersect.rotate(PI);
    //oppIntersect = this.m_loc.copy().add(oppIntersect); // .add(this.m_loc.copy());
    //drawThisRepelPoint(oppIntersect); // Teal

    //// drawThisIntersectLine(ms.m_loc, intersect); // Purple

    ////PVector locTmp = ms.m_loc.copy();
    ////PVector velTmp = ms.m_vel.copy();
    ////velTmp.normalize().mult(m_radius);
    ////velTmp = locTmp.add(velTmp);
    ////drawThisIntersectToOTherVelLine(intersect, velTmp); // Orange

    //PVector oppIntersectCopy = oppIntersect.copy();
    //PVector velocityCopy     = this.m_vel.copy();
    //oppIntersectCopy.normalize();
    //velocityCopy.normalize();

    //PVector collisionVector = velocityCopy.add(oppIntersectCopy);
    //collisionVector.normalize();
    //collisionVector.mult(20);
    //drawThisCollisionVelocity(this.m_loc, collisionVector); // White

    //if (collision)
    //{
    //  this.m_vel = collisionVector.normalize();
    //  // this.m_acc = collisionVector.normalize(); // .div(7);
    //  // applyForce(collisionVector.normalize());
    //}

    /////////////////////////////////////////////////////////////////////////////////

    //PVector otherDiffCpy = this.m_loc.copy();
    //PVector otherDiff    = otherDiffCpy.sub(ms.m_loc);
    
    //otherDiff.z *= -1;
    //otherDiff.normalize();
    //otherDiff.mult(m_radius);

    //drawOtherCenterPoint(ms.m_loc);

    //PVector otherVelPnt = ms.m_loc.copy().add(ms.m_vel.copy().normalize().mult(m_radius));
    //drawOtherVelPoint(otherVelPnt);
    
    //PVector otherIntersect = ms.m_loc.copy().add(otherDiff);
    //// This is the green point which represents the vector between the
    //// spheres.
    //// drawOtherIntersectPoint(otherIntersect); // Green

    //PVector otherOppIntersect = otherDiff.copy();
    //otherOppIntersect.rotate(PI);
    //otherOppIntersect = ms.m_loc.copy().add(otherOppIntersect); //.add(ms.m_loc.copy());
    //// This is the grey point which represents the opposite of the intersect
    //// point. During a collision, the sphere would move in this direction.
    //drawOtherRepelPoint(otherOppIntersect); // Teal

    //// This is the purple line from the center of the sphere to the
    //// intersect point on the other sphere.
    //// drawOtherIntersectLine(this.m_loc, otherIntersect); // Purple 

    ////PVector otherLocTmp = this.m_loc.copy();
    ////PVector otherVelTmp = this.m_vel.copy();
    ////otherVelTmp.normalize().mult(m_radius);
    ////otherVelTmp = otherLocTmp.add(otherVelTmp);
    //// This is the orange line from the green intersect point to the orange
    //// point representing the velocity direction.
    //// drawOtherIntersectToOTherVelLine(otherIntersect, otherVelTmp); // Orange

    //PVector otherOppIntersectCopy = otherOppIntersect.copy();
    //PVector msVelocityCopy        = ms.m_vel.copy();
    //otherOppIntersectCopy.normalize();
    //msVelocityCopy.normalize(); // .mult(2);

    //PVector otherCollisionVector = msVelocityCopy.add(otherOppIntersectCopy);
    //otherCollisionVector.normalize();
    //otherCollisionVector.mult(20);
    
    //drawOtherCollisionVelocity(ms.m_loc, otherCollisionVector); // White

    //if (m_pause) return;
    
    //if (collision)
    //{
    //  ms.m_vel = otherCollisionVector.normalize();
    //  // ms.m_acc = otherCollisionVector.normalize(); // .div(7);
    //  // applyForce(collisionVector.normalize());
    //}

    ////// Clumping?
    ////if (collision)
    ////{
    ////  this.m_loc.add(this.m_vel);
    ////  ms.m_loc.add(ms.m_vel); 
    ////}
  }
  
  void drawPoint(PVector p)
  {
    pushStyle();
    strokeWeight(5);
    stroke(#FFFFFF);
    point(p.x, p.y, p.z);
    popStyle();
  }
  
  void drawCenterPoint(PVector c)
  {
    pushStyle();
    strokeWeight(5);
    stroke(#48AAC6); // Blue
    point(c.x, c.y, c.z);
    popStyle();
  }
  void drawOtherCenterPoint(PVector c)
  {
    pushStyle();
    strokeWeight(5);
    stroke(#48AAC6); // Blue
    point(c.x, c.y, c.z);
    popStyle();
  }
  void drawVelPoint(PVector p)
  {
    pushStyle();
    stroke(#FA811E);
    strokeWeight(5);
    point(p.x, p.y, p.z);
    popStyle();
  }
  void drawOtherVelPoint(PVector p)
  {
    pushStyle();
    stroke(#FA811E);
    strokeWeight(5);
    point(p.x, p.y, p.z);
    popStyle();
  }
  void drawThisIntersectPoint(PVector v)
  {
    pushStyle();
    strokeWeight(4);
    stroke(#56FF1F); // Green
    point(v.x, v.y, v.z);
    popStyle();
  }
  void drawOtherIntersectPoint(PVector v)
  {
    pushStyle();
    strokeWeight(4);
    stroke(#56FF1F); // Green
    point(v.x, v.y, v.z);
    popStyle();
  }
  
  void drawThisRepelPoint(PVector v)
  {
    pushStyle();
    stroke(#18D8D7); // Teal
    strokeWeight(11);
    point(v.x, v.y, v.z);
    popStyle();
  }
  
  void drawOtherRepelPoint(PVector v)
  {
    pushStyle();
    stroke(#18D8D7); // Teal
    strokeWeight(11);
    point(v.x, v.y, v.z);
    popStyle();
  }
  
  void drawThisIntersectLine(PVector v, PVector center)
  {
    pushStyle();
    strokeWeight(2);
    stroke(#B346F7); // Purple
    line(v.x, v.y, v.z,
         center.x, center.y, center.z);
    popStyle();
  }
  
  void drawOtherIntersectLine(PVector v, PVector center)
  {
    pushStyle();
    strokeWeight(2);
    stroke(#DCA5FF); // Purple
    line(v.x, v.y, v.z,
         center.x, center.y, center.z);
    popStyle();
  }
  
  void drawThisIntersectToOTherVelLine(PVector v, PVector vel)
  {
    pushStyle();
    stroke(#C67748); // Orange
    strokeWeight(2);
    line(v.x, v.y, v.z, vel.x, vel.y, vel.z);
    popStyle();
  }
  
  void drawOtherIntersectToOTherVelLine(PVector v, PVector vel)
  {
    pushStyle();
    stroke(#FFD6BF); // Orange
    line(v.x, v.y, v.z, vel.x, vel.y, vel.z);
    popStyle();
  }

  void drawThisCollisionVelocity(PVector c, PVector v)
  {
    pushStyle();
    strokeWeight(1);
    stroke(255); // White
    line(c.x, c.y, c.z, c.x+v.x, c.y+v.y, c.z+v.z);
    popStyle();
  }
    
  void drawOtherCollisionVelocity(PVector c, PVector v)
  {
    pushStyle();
    strokeWeight(1);
    stroke(255); // White
    line(c.x, c.y, c.z, c.x+v.x, c.y+v.y, c.z+v.z);
    popStyle();
  }

  
  void pause()
  {
    m_pause = true;
  }
  void unpause()
  {
    m_pause = false;
  }
  
  void setColor(color c)
  {
    m_c = c;
  }
  
}
