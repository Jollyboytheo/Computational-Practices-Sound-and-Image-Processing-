void setup() {
  size(400,400); // This sets the size 
}

void draw() {
  
  loadPixels();
  
  float normalizedX = width/2;
  float normalizedY = height /2;
  
  float maxDist = dist(normalizedX, normalizedY, 0,0);
  
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      //float normalizedX = map(x, 0, width, 0, 1); 
     // float normalizedY = map(y,0,height,0,1);
     
     float d = dist(x,y,normalizedX,normalizedY);
     
     float normalizedDist = d / maxDist;
      
      int red = int(255 * normalizedDist );        
      int green = 100;                           
      int blue = int(255 * normalizedDist); 
      int alpha = int(20 * normalizedDist);
      
      
      color c = color(red, green, blue, alpha);
      
      pixels[x + y * width] = c;
    }
  }
  updatePixels();
  
}
