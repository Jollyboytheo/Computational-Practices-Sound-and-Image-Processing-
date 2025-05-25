PImage img, result;
float[][] kernel = {
  { 0, -1,  0 },
  { -1, 5, -1 },
  { 0, -1,  0 }
}; // 

void setup() {
  size(1000, 1000);
  img = loadImage("LIBRA.jpg");
  img.resize(width, height);
  img.filter(GRAY);
  result = createImage(img.width, img.height, RGB);
  img.loadPixels();
  result.loadPixels();

  for (int y = 1; y < img.height - 1; y++) {
    for (int x = 1; x < img.width - 1; x++) {
      float sum = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int px = x + kx;
          int py = y + ky;
          float val = brightness(img.pixels[px + py * img.width]);
          sum += kernel[ky + 1][kx + 1] * val;
        }
      }
      result.pixels[x + y * img.width] = color(constrain(sum, 0, 255));
    }
  }
  result.updatePixels();
  image(result, 0, 0);
}

// Resources I used for the above code:
// --> https://www.youtube.com/watch?v=0L2n8Tg2FwI
// --> https://github.com/Danleb/dithering 
// --> https://tannerhelland.com/2012/12/28/dithering-eleven-algorithms-source-code.html
