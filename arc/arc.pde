

float i = random(0, TWO_PI);
float j = random(0, TWO_PI);

void setup()
{
  size(600, 600);
  background(55);
}

void draw()
{
  noStroke();
  fill(55, 50);
  rect(0, 0, width, height);

  {
    noFill();
    stroke(128);
    ellipse(300, 300, 100, 100);
  }
  {
    // Inner Circle (Grey)
    stroke(86);
    ellipse(300, 300, 100, 100);
  }
  {
    stroke(51, 158, 242);
    
    // outer arc
    arc(300, 300, 500, 500, 0, TWO_PI);
    
    // inner arc
    arc(300, 300, 110, 110, 0, TWO_PI);
  }
  
  
  if (i == TWO_PI)
  {
    i = 0;
  }
  if (j == -TWO_PI)
  {
    j = 0;
  }
  
  stroke(66);
  strokeWeight(1);
  fill(0);
  
  pushMatrix();
  translate(height/2, width/2);
  ellipse(sin(i)*250, cos(i)*250, 20, 20);
  popMatrix();


  fill(255);
  pushMatrix();
  translate(height/2, width/2);
  ellipse(sin(j)*50, cos(j)*50, 5, 5);
  popMatrix();

  i = i + 0.001;
  j = j - 0.01;
}
