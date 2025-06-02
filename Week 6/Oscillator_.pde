import processing.sound.*;

SawOsc oscillator;
LowPass lowPassFilter;
BandPass filter2; 

void setup() {
  size(400,400);
  
  oscillator = new SawOsc(this);
  //lowPassFilter = new LowPass(this);
  filter2 = new BandPass(this);
  
  //lowPassFilter.process(oscillator);
  filter2.process(oscillator);
  
  oscillator.freq(440);
  oscillator.amp(0.5);
  
  oscillator.play();
}

void draw() {
  background(0);
}

void mouseMoved() {
  //oscillator.freq(map(mouseX,0,width,80,2000));
  //oscillator.amp(map(mouseY,0,height,0.8,0));
  //lowPassFilter.freq(map(mouseX,0,width,50,6000));
  filter2.freq(map(mouseY,0, height, 50,6000));
}
