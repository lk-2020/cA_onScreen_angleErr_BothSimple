MyButton startButton;
int startButtonX;
int startButtonY;
int startButtonWidth = 90;
int startButtonHeight = 60;

MyButton stopButton;
int stopButtonX;
int stopButtonY;
int stopButtonWidth = 90;
int stopButtonHeight = 60;

boolean start = false;

// VARIABLES

int temp=0;
int dWidth = 1280;
int dHeight = 720;

float rightHandJoint0, rightHandJoint1, leftHandJoint0, leftHandJoint1;
float sqrtL[], isLengthEqualL[], sqrtR[], isLengthEqualR[];
boolean first = true;

//hands
int whiteSkeletonXincr = 150;

int whiteSkeletonX = dWidth/2 ;
int whiteSkeletonY = 720/2;

int whiteRightHandJointX = dWidth/2 + 100 ;
int whiteRightHandJointY = 304;
int whiteLeftHandJointX = whiteRightHandJointX-200;
int whiteLeftHandJointY = whiteRightHandJointY;
int whiteRightHandEndX = dWidth/2 + 100 + 50;
int whiteRightHandEndY = 200;
int whiteLeftHandEndX = dWidth/2 - 100;
int whiteLeftHandEndY = 200;


int jRx; // joint right hand

boolean touchEvent1 = false, touchEvent2 = false;
boolean touchEvent_[];

color[] animColor = {
  color(255, 255, 0)/*yellow*/, color(125, 193, 255)/*pink*/, color(184, 20, 103)/*blue*/
};

public class xandy
{
  public double x;
  public double y;
}


int whiteHandLength = 200; 
float angle;
float[] angleArray = {
  0, 15, 30, 45, 60, 75, 90
};
int i =0 ;
//-----------------------------------------------------------------------------------------

void setup() {

  background(0);
  //size(displayWidth, displayHeight);

  size(1280, 720);
  //size(2560,1600);
  orientation(LANDSCAPE);
  background(0);
  fill(0, 0, 244);
  //rect(100, 100, 100, 100);
  stroke(255);
  rectMode(CENTER);
  //ellipseMode(CORNERS);

  startButtonX = dWidth - 200 ;
  startButtonY = dHeight - 70;
  stopButtonX = dWidth - 100 ;
  stopButtonY = dHeight - 70;
  startButton = new MyButton(startButtonX, startButtonY, startButtonWidth, startButtonHeight, "Start");
  stopButton = new MyButton(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight, "Stop");
}

//-----------------------------------------------------------------------------------------

void draw() {
  background(0);
  println("temp" + temp);
  startButton.draw();
  stopButton.draw();

  if (startButton.isMouseOverButton()) {
    cursor(HAND);

    if (mousePressed) {
      start = true;
    }
  }
  else if (stopButton.isMouseOverButton()) {
    cursor(HAND);

    if (mousePressed) {
      start = false;
    }
  }
  else
  {
    cursor(ARROW);
  }
  strokeWeight(25);
  stroke(255);



  if (start == true)
  {
    angle = radians(angleArray[0]);

    if ((temp > 100) && (temp < 200))
    {
      angle = radians(angleArray[2]);
    }
    else if ((temp > 300) && (temp < 400))
    {
      angle = radians(-angleArray[2]);
    }
    else if ((temp > 500) && (temp < 600))
    {
      angle = radians(angleArray[5]);
    }
    else if ((temp > 700) && (temp < 800))
    {
      angle = radians(angleArray[4]);
    }
    else if ((temp > 900) && (temp < 1000))
    {
      angle = radians(-angleArray[5]);
    }
    else if ((temp > 1100) && (temp < 1200))
    {
      angle = radians(-angleArray[4]);
    }
    else if ((temp > 1300) && (temp < 1400))
    {
      angle = radians(-angleArray[3]);
    }
    else if ((temp > 1500) && (temp < 1600))
    {
      angle = radians(angleArray[6]);
    }
    else if ((temp > 1700) && (temp < 1800))
    {
      angle = radians(angleArray[3]);
    }
    else if (temp>1900)
    {
      temp = 0;
      i++;
    }
    if (i == 2)
      start = false;
        temp ++;
  }
  else if (start == false)
  {
    angle = 0;
    temp = 0;
  }
  
  strokeWeight(35);
  segmentL(whiteLeftHandJointX, whiteLeftHandJointY, radians(180) - angle, whiteHandLength);
  segmentR(whiteRightHandJointX, whiteRightHandJointY, angle, whiteHandLength);
  drawWhiteChar();
  
}


void drawWhiteChar() //white left body
{
  fill(255);
  noStroke();
  //noFill();
    //rect(whiteSkeletonX, whiteSkeletonY, 160, 160, 15);
  rect(whiteSkeletonX, whiteSkeletonY+30, 240, 220, 15);
}


void segmentL(float x, float y, float a, int handLength) {
  pushMatrix();
  translate(x, y);
  //rotate(radians(180));
  //positive values rotate objects in clockwise by that angle
  rotate(-a);
  line(0, 0, handLength, 0);
  popMatrix();
}

void segmentR(float x, float y, float a, int handLength) {
  pushMatrix();
  translate(x, y);
  //rotate();
  //positive values rotate objects in clockwise by that angle
  rotate(-a);
  line(0, 0, handLength, 0);
  popMatrix();
}
