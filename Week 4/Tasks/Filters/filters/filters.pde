PImage img;
float contrast = 0.8;
float bright = 50;

void setup() {
  size(750, 422);
  img = loadImage("111006152321_2.jpg");
  
  // Apply filters to image
  img.filter(THRESHOLD, 0.2);
  img.filter(POSTERIZE, 4);
  
  // Pixel manipulations
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    float br = brightness(c);
    
    // Duotone effect
    img.pixels[i] = lerpColor(color(255,0,0), color(0,0,255), br/255);
    
    // Brightness/contrast
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    r = (r - 128) * contrast + 128 + bright;
    g = (g - 128) * contrast + 128 + bright;
    b = (b - 128) * contrast + 28 + bright;
    img.pixels[i] = color(r, g, b);
  }
  img.updatePixels();
  
  image(img, 0, 0);
}

void draw() {
}
