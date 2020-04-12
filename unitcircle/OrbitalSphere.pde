

class OrbitalSphere
{
  float theAngle = 0;

  PVector m_location = new PVector();
  PVector m_velocity = new PVector();
  PVector m_acceleration = new PVector();

  PVector m_target = new PVector();

  float m_mass = 20;
  float m_radius = 30;
  float m_angleIncrement = 0.01;

  private boolean m_pause = false;

  OrbitalSphere()
  {
    m_velocity = PVector.random3D();
    m_velocity.mult(2);
  }

  void updateTargetLocation()
  {
    m_angleIncrement = 0.01;
    theAngle = theAngle + m_angleIncrement;

    if (theAngle == TWO_PI)
    {
      theAngle = 0;
    }

    m_target.x = cos(theAngle) * 250;
    m_target.y = sin(theAngle) * 250;
    m_target.z = 0;
  }

  void update()
  {
    updateTargetLocation();

    if (m_pause)
    { 
      return;
    }

    m_velocity.add(m_acceleration);
    m_location.add(m_velocity);
    
    // Slow down the ball over time.
    // m_velocity.mult(0.9995);

    m_acceleration.mult(0);
  }

  void display()
  { 
    pushStyle();
    strokeWeight(3);
    stroke(#64EEFF);
    point(m_target.x, m_target.y, m_target.z);
    popStyle();


    {
      pushStyle();
      
      // Now make another sphere that rotates around this sphere.
      {
        pushMatrix();
        translate(m_location.x, m_location.y, m_location.z);
        noFill();
        stroke(155);
        strokeWeight(0.5);
        sphere(m_radius);
        popMatrix();
      }

      // orange point
      {
        
        pushMatrix();
        stroke(#FA811E);
        PVector locTmp = m_location.copy();
        PVector velTmp = m_velocity.copy();
        velTmp.normalize().mult(32);
        velTmp = locTmp.add(velTmp);
        strokeWeight(5);
        point(velTmp.x, velTmp.y, velTmp.z);
        popMatrix();
      }
      popStyle();
    }

    
    // Blue Point (Center of OS)
    pushStyle();
    pushMatrix();
    strokeWeight(5);
    stroke(#48AAC6);
    point(m_location.x, m_location.y, m_location.z);
    popMatrix();
    popStyle();
  }

  void checkBoundaryCollision()
  {
    if (m_location.z >= 200 - m_radius)
    {
      m_location.z = 200 - m_radius;
      m_velocity.z *= -1;
    }
    else if (m_location.z <= -200 + m_radius)
    {
      m_location.z = -200 + m_radius;
      m_velocity.z *= -1;
    }
    
    if (m_location.x >= 200 - m_radius)
    {
      m_location.x = 200 - m_radius;
      m_velocity.x *= -1;
    }
    else if (m_location.x <= -200 + m_radius)
    {
      m_location.x = -200 + m_radius;
      m_velocity.x *= -1;
    }

    if (m_location.y >= 200 - m_radius)
    {
      m_location.y = 200 - m_radius;
      m_velocity.y *= -1;
    }
    else if (m_location.y <= -200 + m_radius)
    {
      m_location.y = -200 + m_radius;
      m_velocity.y *= -1;
    }
  }
  
  void checkBallCollision(CenterSphere cs)
  {
    // Check for Boundary Collision
    PVector csLocation = cs.m_location.copy(); 
    PVector diff = csLocation.sub(m_location); // the vector difference from cs to os
    float distance = diff.mag();
    
    diff.rotate(PI);
    diff.z *= -1;
    diff.normalize();
    diff.mult(100);

    // Green Line
    pushStyle();
    strokeWeight(2);
    stroke(#65C648);
    point(diff.x, diff.y, diff.z);
    line(cs.m_location.x, cs.m_location.y, cs.m_location.z,
         diff.x, diff.y, diff.z);
    popStyle();

    PVector collisionVector = diff.copy();
    collisionVector.normalize();
    collisionVector.mult(100);

    // Pink Point (Surface Intersection)
    pushStyle();
    strokeWeight(17);
    stroke(#FF64FD);
    point(collisionVector.x, collisionVector.y, collisionVector.z);
    popStyle();

    // Purple Line
    pushStyle();
    strokeWeight(2);
    stroke(#B346F7);
    line(m_location.x, m_location.y, m_location.z,
         collisionVector.x, collisionVector.y, collisionVector.z);
    popStyle();

    // orange line
    pushMatrix();
    pushStyle();
    stroke(#C67748);
    PVector locTmp = m_location.copy();
    PVector velTmp = m_velocity.copy();
    velTmp.normalize().mult(32);
    velTmp = locTmp.add(velTmp);
    strokeWeight(3);
    line(velTmp.x, velTmp.y, velTmp.z,
         collisionVector.x, collisionVector.y, collisionVector.z);
    stroke(255);
    strokeWeight(7);
    point(velTmp.x, velTmp.y, velTmp.z);
    point(this.m_location.x, this.m_location.y, this.m_location.z);
    
    popStyle();
    popMatrix();

    pushMatrix();
    pushStyle();
    PVector velTmp2 = velTmp.copy();     // orange
    PVector locTmp2 = m_location.copy(); // purple

    velTmp2.normalize();
    locTmp2.normalize();

    PVector rotatedVel = velTmp2.add(locTmp2);

    rotatedVel.normalize();
    rotatedVel.mult(2);
    strokeWeight(1);
    stroke(255);
    PVector tmp = rotatedVel.copy();
    tmp.mult(20);
    pushMatrix();
    translate(this.m_location.x, this.m_location.y, this.m_location.z);
    line(0,0,0,
         tmp.x, tmp.y, tmp.z);
    popMatrix();
    
    popStyle();
    popMatrix();
    
    // Collision
    if (distance <= 130)
    {
      m_velocity = rotatedVel;
    }
  }

  void pause()
  {
    m_pause = true;
  }
  void unpause()
  {
    m_pause = false;
  }
}
