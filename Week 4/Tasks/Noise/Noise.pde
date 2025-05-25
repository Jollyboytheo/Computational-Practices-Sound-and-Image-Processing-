void setup() {
  size(600, 600);
  loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      float bright = noise(x*0.01, y*0.01) * 255;
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
}


Float xoffHorizontal = 0.05;
Float xoffVertical = 1000.05; // different starting point

void draw() {

Float nx = noise(xoffHorizontal);
Float x = map(nx, 0,1,0,width);
ellipse(x, height/2, 20,20); // Horizontal ellipse

Float ny = noise(xoffVertical);
Float y = map(ny, 0,1,0,height);
ellipse(width/2, y, 20,20); // Vertical ellipse


xoffHorizontal += 0.1;
xoffVertical += 0.1;
}
