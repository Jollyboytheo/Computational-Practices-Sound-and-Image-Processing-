PImage img;
float maskSize = 150;

void setup() {
  size(750, 422);
  img = loadImage("111006152321_2.jpg");
}

void draw() {
  image(img, 0, 0);
  loadPixels();
  
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      float d = dist(x, y, mouseX, mouseY);
      
      if (d < maskSize) {
        // Inside mask: invert colors
        color c = pixels[x + y*width];
        pixels[x + y*width] = color(255-red(c), 255-green(c), 255-blue(c));
      } else {
        // Outside mask: apply threshold
        color c = pixels[x + y*width];
        float b = brightness(c);
        pixels[x + y*width] = b > 127 ? color(255) : color(0);
      }
    }
  }
  
  updatePixels();
}
