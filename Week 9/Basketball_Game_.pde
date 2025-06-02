Basketball ball;
Rim rim;
int score = 0; // 
int timeLeft = 60; // seconds
int lastSecond;
boolean gameOver = false;

void setup() {
  size(600, 400);
  ball = new Basketball();
  rim = new Rim();
  lastSecond = millis();
}

void draw() {
  background(220);
  
  // Timer
  if (!gameOver && millis() - lastSecond >= 1000) {
    timeLeft--;
    lastSecond = millis();
    if (timeLeft <= 0) {
      gameOver = true;
    }
  }
  
  fill(0);
  textSize(20);
  text("Time: " + timeLeft, 20, 30);
  text("Score: " + score, 20, 60);
  
  // Draw and update rim
  rim.update();
  rim.display();
  
  // Draw and update ball
  ball.update();
  ball.display();
  
  // Check for scoring
  if (ball.isMoving && ball.y + ball.radius > rim.y && ball.y - ball.radius < rim.y + rim.height) {
    if (ball.x > rim.x && ball.x < rim.x + rim.rimWidth) {
      score++;
      ball.resetBall();
    }
  }
  
  // Game Over
  if (gameOver) {
    fill(0, 150);
    rect(0, 0, width, height);
    fill(255);
    textSize(36);
    textAlign(CENTER, CENTER);
    text("Game Over!\nFinal Score: " + score, width/2, height/2);
    noLoop();
  }
}

void keyPressed() {
  if (keyCode == UP && !ball.isMoving && !gameOver) {
    ball.shoot();
  }
}

// Basketball class
class Basketball {
  float x, y;
  float ySpeed, xSpeed;
  float gravity = 0.5;
  float airResistance = 0.98;
  float radius = 15;
  boolean isMoving = false;
  
  Basketball() {
    resetBall();
  }
  
  void update() {
    if (isMoving) {
      ySpeed += gravity;
      xSpeed *= airResistance;
      x += xSpeed;
      y += ySpeed;
      
      // Ground collision
      if (y > height - radius) {
        resetBall();
      }
      
      // Side walls
      if (x < radius) {
        x = radius;
        xSpeed *= -0.5;
      }
      if (x > width - radius) {
        x = width - radius;
        xSpeed *= -0.5;
      }
    }
  }
  
  void display() {
    fill(255, 140, 0);
    stroke(0);
    ellipse(x, y, radius*2, radius*2);
  }
  
  void shoot() {
    ySpeed = -18;  // Increase this to make ball go higher
    xSpeed = random(-3, 3);
    isMoving = true;
  }
  
  void resetBall() {
    x = width/2;
    y = height - radius;
    ySpeed = 0;
    xSpeed = 0;
    isMoving = false;
  }
}

// Rim class
class Rim {
  float x, y;
  float rimWidth = 80;  
  float height = 10;
  float speed = 3;
  
  Rim() {
    x = width/2 - rimWidth/2;  
    y = 100;
  }
  
  void update() {
    x += speed;
    if (x < 0 || x + rimWidth > width) {  
      speed *= -1;
    }
  }
  
  void display() {
    fill(200, 0, 0);
    rect(x, y, rimWidth, height, 5);  
  }
}

// References I used to learn for the above code:
// --> https://processing.org/reference/millis_.html
// --> https://processing.org/reference/text_.html
// --> https://processing.org/tutorials/objects
// --> https://processing.org/reference/class.html
// --> https://happycoding.io/tutorials/processing/collision-detection
//--> https://stackoverflow.com/questions/19484568/how-to-prevent-user-from-entering-decimal-value-in-c/19484612#19484612
// --> https://processing.org/reference/keyPressed_.html
// --> https://processing.org/reference/keyCode.html
// --> https://natureofcode.com/forces/
// --> https://processing.org/reference/random_.html
// --> https://processing.org/examples/bounce.html
