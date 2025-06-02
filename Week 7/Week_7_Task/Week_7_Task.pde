
import processing.sound.*;
SoundFile sample1; // 120 BPM Drums 
SoundFile sample2; // Rock and Roll 808 Drum 
SoundFile sample3; // Electronic
SoundFile sample4; // German Ambulance
SoundFile sample5; // Pulse

float bpm = 120; // beats per minute

float myFrameRate = 120 / 60; // frame rate = beats per second

void setup() {
  size(640, 360);
  background(255);

  // Load a soundfile from the /data folder of the sketch and play it back
  // https://processing.org/reference/libraries/sound/SoundFile.html
  sample1 = new SoundFile(this, "../samples/120-bpm-drums.wav");
  // set amplitude
  sample1.amp(1.0); // This makes the sample louder or quieter  
  // playback rate
  // * 2 for octave higher
  // -1 to pllay backwards
  sample1.rate(1.0); // This influences the speed of the sample 
  sample2 = new SoundFile(this, "../samples/rock-n-roll-beat-808-drum-sound.wav");
  sample2.amp(0.5);
  sample3 = new SoundFile(this, "../samples/electronic.wav");
  sample3.amp(2.0);
  sample4 = new SoundFile(this, "../samples/german ambulance.wav");
  sample4.amp(1.0);
  sample5 = new SoundFile(this, "../samples/pulse.wav");
  sample5.amp(2.0);

  frameRate(myFrameRate);
}

void draw() {
  background(random(255), random(255), random(255));
  
  
  // play every beat
  sample1.play();
  
  //// play every fourth beat
  if (frameCount % 4 == 0) {
   sample2.play();
  }
  
  sample3.play();
  sample4.play();
  sample5.play();
}
