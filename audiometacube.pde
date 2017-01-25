import peasy.*;
import processing.sound.*;

// PeasyCam cam;
int spacer;
Cube[][][] points;
int p_number;
float rot_y;
float rot_x;
float rot_z;
float a_pwr;

AudioDevice myAudioServer;
Amplitude amp;
SoundFile sample;
 AudioIn in;

void setup () {
  size (600, 600, P3D);
  //  cam = new PeasyCam(this, 500);
  //  cam.setMinimumDistance(50);
  //  cam.setMaximumDistance(500);
  //  frameRate(10);
  frameRate(30);
  spacer = 6;
  p_number = 60;
  points = new Cube[p_number][p_number][p_number];
  for (int y = 0; y < points.length; y += spacer) {
    for (int x = 0; x < points.length; x += spacer) {
      for (int z = 0; z < points.length; z += spacer) {
        points[y][x][z] = new Cube(y, x, z);
      }
    }
  }
  noCursor();

  myAudioServer = new AudioDevice(this, 44100, 128);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
    in.start();
//  sample = new SoundFile(this, "temp_juttu.wav");
//  sample.loop();
  amp.input(in);
}

void draw () {
  background(0);
  fill(150);
  strokeWeight(1);
  stroke(255);
  //  line(width/2,0,width/2,height);
  //  line(0,height/2,width,height/2);
  a_pwr = amp.analyze();

  translate(width/2, height/2, 410);
  rotateY(rot_y);
  rotateX(cos(rot_x));
  rotateX(sin(rot_z));
  pushMatrix();


  //  rotateX(radians(90));

  for (int y = 0; y < points.length; y += spacer) {
    for (int x = 0; x < points.length; x += spacer) {
      for (int z = 0; z < points.length; z += spacer) {

        points[y][x][z].display();
        points[y][x][z].move(a_pwr);
        points[y][x][z].xplosion();
      }
    }
  }
  popMatrix();
  rot_y+=0.003;
  rot_x+=0.008;
  rot_z-=0.001;
//  println(amp.analyze());
}

/*void mousePressed() {
  if (xplode == false) {
    xplode = true;
  } else if (xplode == true) {
    xplode = false;
  } 
} */