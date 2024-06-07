import processing.sound.*;
import processing.serial.*;

Serial myPort;

void setup () {
  //fullScreen();
  //size(800, 800); //fullscreen height = 878
  //noStroke();
  //println("1");
  myPort = new Serial(this, Serial.list()[1], 115200);
  println(Serial.list());
  //playWater(200);
}

void draw (){
  if (myPort.available() > 0) {
    String val = myPort.readStringUntil('\n');
    println(val);
    if (val != null) {
        val = trim(val);
        playWater(int(val));
      }
    
  }
  
}

void playWater(int x){
  //BrownNoise noise = new BrownNoise(this);
  //LowPass lowPass1 = new LowPass(this);
  //LowPass lowPass2 = new LowPass(this);
  //lowPass1.process(noise, 400);
  //lowPass2.process(noise, 14);
  //lowPass2.res(8.0);
  ////lowPass2.gain(400);
  //HighPass highPass = new HighPass(this);
  //highPass.process(lowPass1, lowPass2);
  
  //noise.play(0.5);
  
  Pulse pulse = new Pulse(this);
  Env env  = new Env(this); 
  pulse.freq(x);
  pulse.play();
  //env.play(pulse, attackTime, sustainTime, sustainLevel, releaseTime);
  env.play(pulse, 0.01, 0.2, 0.2, 0.3);
  
}
