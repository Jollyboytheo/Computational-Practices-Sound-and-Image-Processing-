PImage img; // Declaring a variable of type PImage

void setup() {
  size(768,445);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("Slawn-Brit-Award.jpg");
}

void draw(){
  background(0);
  //Draw the image to the screen at coordinate (0,0)
  image(img,0,0);
}
  
  
