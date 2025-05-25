PImage img;

void setup() {
  size(1200, 680);
  img = loadImage("spider-man.jpg"); 
  img.resize(width, height);
  img.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int idx = x + y * img.width;
      color oldColor = img.pixels[idx];
      float oldPixel = brightness(oldColor);
      float newPixel = oldPixel < 128 ? 0 : 255;
      img.pixels[idx] = color(newPixel);
      float quantError = oldPixel - newPixel;

      // Distributing the error to neighboring pixels
      if (x + 1 < img.width)
        img.pixels[idx + 1] = color(constrain(brightness(img.pixels[idx + 1]) + quantError * 7 / 16, 0, 255));
      if (x - 1 >= 0 && y + 1 < img.height)
        img.pixels[idx - 1 + img.width] = color(constrain(brightness(img.pixels[idx - 1 + img.width]) + quantError * 3 / 16, 0, 255));
      if (y + 1 < img.height)
        img.pixels[idx + img.width] = color(constrain(brightness(img.pixels[idx + img.width]) + quantError * 5 / 16, 0, 255));
      if (x + 1 < img.width && y + 1 < img.height)
        img.pixels[idx + 1 + img.width] = color(constrain(brightness(img.pixels[idx + 1 + img.width]) + quantError * 1 / 16, 0, 255));
    }
  }

  img.updatePixels();
  image(img, 0, 0);
}

// Resources I used for the above code:

// --> https://www.youtube.com/watch?v=0L2n8Tg2FwI
// --> https://github.com/Danleb/dithering 
// --> https://tannerhelland.com/2012/12/28/dithering-eleven-algorithms-source-code.html
