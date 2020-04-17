

float acceleration = 4.0;

float rotX = 0.001 * acceleration;
float rotY = 0.002 * acceleration;
float rotZ = 0.001 * acceleration;

boolean spin = true;

BezierCube bc = new BezierCube(0, 0, 0,
                               180,180,180);

//******************************************************************************
// setup
//******************************************************************************
void setup()
{
  size(800,600, P3D);
  background(55);

  noFill();
  stroke(255);
  
  frameRate(60);
}

//******************************************************************************
// draw
//******************************************************************************
void draw()
{
  background(55);
  lights();
  translate(width/2, height/2, -250);

  // Rotate everything, including external large cube
  if (spin == true)
  {
    rotX += .004;
    rotY += .008;
    rotZ += .004;
  }

  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  stroke(255);

  bc.draw();
}

void keyPressed()
{
  if (key == ' ')
  {
     if (spin == false)
     {
       spin = true;
     }
     else
     {
       spin = false;
     } 
  }
  else if (key == 'd')
  {
    bc.keyPressed();
  }
}

void mouseMoved()
{
  float intensity = (float)mouseY / (float)height;
  bc.mouseMoved(intensity);
}
