ArrayList<Particle> particles = new ArrayList<Particle>();
PVector wind = new PVector();
float gravity = 0.1;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  background(0);
  
  particles.add(new Particle(new PVector(width/2, height-20)));  // Add new particles at bottom center

  
  // Apply forces
  applyWind();
  applyMouseForce();
  
  // Update and display particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.applyForce(wind);
    p.applyForce(new PVector(0, -gravity));
    p.update();
    p.display();
    
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

void applyWind() {
  if (frameCount % 30 == 0) {
    wind = PVector.fromAngle(random(-QUARTER_PI, QUARTER_PI)).mult(0.1);
  }
}

void applyMouseForce() {
  if (mousePressed) {
    PVector mousePos = new PVector(mouseX, mouseY);
    for (Particle p : particles) {
      PVector dir = PVector.sub(p.position, mousePos);
      float distance = dir.mag();
      if (distance < 100) {
        dir.normalize().mult(50/(distance+0.1));
        p.applyForce(dir);
      }
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float hue;
  
  Particle(PVector start) {
    position = start.copy();
    velocity = new PVector(random(-1, 1), random(-5, -8));
    acceleration = new PVector(0, 0);
    lifespan = 255;
    hue = random(20, 40); // Orange-red hues
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 3;
    
    // Add turbulence
    velocity.add(PVector.random2D().mult(0.1));
  }
  
  void display() {
    fill(hue, 80, 90, lifespan);
    float size = map(lifespan, 0, 255, 0, 10);
    ellipse(position.x, position.y, size, size);
  }
  
  boolean isDead() {
    return lifespan <= 0;
  }
}

// References I used for the above code:
// --> https://processing.org/examples/simpleparticlesystem.html
// --> https://natureofcode.com/particles/
// --> https://agatedragon.blog/2024/07/11/spawning-particles-in-processing/
// --> https://tympanus.net/codrops/2019/01/17/interactive-particles-with-three-js/
