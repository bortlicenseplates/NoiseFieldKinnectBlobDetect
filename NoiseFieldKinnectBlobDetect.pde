
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Field theField;
Points points;
Kinector kinector;

Kinect2 kinect;

Blobs blobs;

private int res = 50;
private int pNum = 1000;
int kinectSkip = 50;

boolean debug = false;

void setup() {
  frameRate(60);
  colorMode(HSB);
  size(displayWidth, displayHeight, P3D);

  kinect = new Kinect2(this);
  kinect.initDepth();
  kinect.initDevice();
  kinector = new Kinector(kinect.getDepthImage().width, kinect.getDepthImage().height, kinectSkip);
  theField = new Field(res);
  points = new Points(pNum);
  blobs = new Blobs(kinect.getDepthImage().width, kinect.getDepthImage().height);
  background(0);
}

void draw() {
  //pushStyle();
  //fill(0, abs(sin((frameCount *0.001)%(TWO_PI)) * 255));
  //rect(0, 0, width, height);
  //popStyle();
  background(0);
  theField.run();
  //points.run();
  image(kinect.getDepthImage(), 0,0);
  blobs.run();
}

void keyReleased(){
  if(key == ' ') debug = !debug;
  
  if(key == '='){
    kinector.threshold ++;

  } else if (key == '-'){
    kinector.threshold --;
    println(kinector.threshold);
  }
}