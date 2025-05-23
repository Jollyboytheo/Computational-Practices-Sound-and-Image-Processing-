void setup()
{
  size(400,400);
  background(255);

  
}

void draw(){
  if (frameCount % 10 == 0) {
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 7 % 255);
    pushMatrix();
    translate(200, 200);
    rotate(radians(frameCount * 2  % 360));
    //rect(0, 0, 80, 20);
    stroke(128);
  fill(252, 240, 8);
  rect(0, 0, 40, 40);

  stroke(0);
  pushMatrix();
  scale(2.0);
  fill(252, 142, 8);
  rect(10, 10, 40, 40);
  popMatrix();
    popMatrix();
  }
}
