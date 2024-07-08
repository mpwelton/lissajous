import themidibus.*;

MidiBus myBus;

float t=0;
float maxTheta;
float thetaIncrement;
float maxWeight;
float noise;
float volume;
float volumeX;
float panX;
float panY;
float panZ;
float volumeY;
float volumeZ;
int freqX1;
int freqX2;
int freqX3;
int freqY1;
int freqY2;
int freqY3;
int freqZ1;
int freqZ2;
int freqZ3;
float phaseModX;
float phaseModY;
float phaseModZ;
float ampModX1;
float ampModX2;
float ampModX3;
float ampModY1;
float ampModY2;
float ampModY3;
float ampModZ1;
float ampModZ2;
float ampModZ3;
float redMin;
float greenMin;
float blueMin;
float red;
float green;
float blue;
float brightness;
float bGround;

void setup(){
 
  MidiBus.list();
  myBus = new MidiBus(this, "Launch Control XL", -1);  
 
  //fullScreen(P3D);
 
  size(1280, 762, P3D);
 
  //size(3840, 2160, P3D); //4K
 
  blendMode(REPLACE);
 
  maxTheta = 1440; //1440
  thetaIncrement = 0.01; //0.01
  maxWeight = 1.0; //1.0
  noise = 0.005;  
  volume = 1.0;
  volumeX = 1.0;
  volumeY = 1.0;
  volumeZ = 1.0;
  panX = 1.0;  
  panY = 1.0;  
  panZ = 1.0;  
  freqX1 = 1;
  freqX2 = 1;
  freqX3 = 1;
  freqY1 = 1;
  freqY2 = 1;
  freqY3 = 1;
  freqZ1 = 1;
  freqZ2 = 1;
  freqZ3 = 1;
  ampModX1 = 0.1;
  ampModX2 = 0.1;
  ampModX3 = 0.1;
  ampModY1 = 0.1;
  ampModY2 = 0.1;
  ampModY3 = 0.1;
  ampModZ1 = 0.1;
  ampModZ2 = 0.1;
  ampModZ3 = 0.1;
  phaseModX = 0;
  phaseModY = 0;
  phaseModZ = 0;
  redMin = 0.0;
  greenMin = 0.0;
  blueMin = 0.0;
  red = 255;
  green = 255;
  blue = 255;
  brightness = 0.0;
  bGround = 127;
    
}

void controllerChange(int channel, int number, int value) {
  println(number,value);
  if(number == 13) {
    freqX1 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 14) {
    freqX2 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 15) {
    freqX3 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 29) {
    freqY1 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 30) {
    freqY2 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 31) {
    freqY3 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 49) {
    freqZ1 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 50) {
    freqZ2 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 51) {
    freqZ3 = int(map(value, 0, 127, 1, 8));
  }
  if(number == 18) {
    panX = map(value, 0, 127, -(width / 4), (width / 4));
  }  
  if(number == 34) {
    panY = map(value, 0, 127, -(height / 4), (height / 4));
  }  
  if(number == 54) {
    panZ = map(value, 0, 127, -(height / 4), (height / 4));
  }   
  if(number == 19) {
    volumeX = map(value, 0, 127, 0, 2);
  } 
  if(number == 35) {
    volumeY = map(value, 0, 127, 0, 2);
  } 
  if(number == 55) {
    volumeZ = map(value, 0, 127, 0, 2);
  }   
  if(number == 20) {
    phaseModX = map(value, 0, 127, 0, 2);
  }  
  if(number == 36) {
    phaseModY = map(value, 0, 127, 0, 2);
  } 
  if(number == 56) {
    phaseModZ = map(value, 0, 127, 0, 2);
  }   
  if(number == 77) {
    redMin = map(value, 0, 127, 0, 127);
  }
  if(number == 78) {
    greenMin = map(value, 0, 127, 0, 127);
  }
  if(number == 79) {
    blueMin = map(value, 0, 127, 0, 127);
  }  
  if(number == 80) {
    brightness = map(value, 0, 127, -64, 64);
  }
  if(number == 81) {
    bGround = map(value, 0, 127, 0, 255);
  }  
  if(number == 82) {
    thetaIncrement = map(value, 0, 127, 0.001, 0.1);
  }   
  if(number == 83) {
    noise = map(value, 0, 127, 0.001, 0.1);
  }   
  if(number == 84) {
    volume = map(value, 0, 127, 0, 2);
  }   
}

void draw() {
 
  translate(width/2, height/2);
 
  beginShape();            
 
  background(bGround);
   
  noFill();
    
   for (float theta = 0; theta <= maxTheta * PI; theta +=thetaIncrement) {
   
    float phaseX1 = PI * (2.0 + phaseModX);
    float phaseX2 = PI * (2.0 + phaseModX);
    float phaseX3 = PI * (2.0 + phaseModX);

    float phaseY1 = PI * (0.5 + phaseModY);
    float phaseY2 = PI * (0.5 + phaseModY);
    float phaseY3 = PI * (0.5 + phaseModY);
    
    float phaseZ1 = PI * (0.5 + phaseModZ);
    float phaseZ2 = PI * (0.5 + phaseModZ);   
    float phaseZ3 = PI * (0.5 + phaseModZ);    
        
    float ampX1 = width * ampModX1;
    float ampX2 = width * ampModX2;
    float ampX3 = width * ampModX3;

    float ampY1 = height * ampModY1;
    float ampY2 = height * ampModY2;
    float ampY3 = height * ampModY3;
    
    float ampZ1 = height * ampModZ1;
    float ampZ2 = height * ampModZ2;
    float ampZ3 = height * ampModZ2;    
 
    float x = ((((sin((theta * (freqX1 + noise)) + phaseX1) * ampX1) + (sin((theta * (freqX2 + noise)) + phaseX2) * ampX2) + (sin((theta * (freqX3 + noise)) + phaseX3) * ampX3)) + panX) * volumeX) * volume;
    float y = ((((sin((theta * (freqY1 + noise)) + phaseY1) * ampY1) + (sin((theta * (freqY2 + noise)) + phaseY2) * ampY2) + (sin((theta * (freqY3 + noise)) + phaseY3) * ampY3)) + panY) * volumeY) * volume;
    float z = ((((sin((theta * (freqZ1 + noise)) + phaseZ1) * ampZ1) + (sin((theta * (freqZ2 + noise)) + phaseZ2) * ampZ2) + (sin((theta * (freqZ3 + noise)) + phaseZ3) * ampZ3)) + panZ) * volumeZ) * volume;

    colorMode(RGB);
    
    strokeWeight(map(theta, 0, maxTheta, 1, maxWeight));
    
    float noiseVal = noise(x, y, z);
    
    red = map((noiseVal * x), 0, 255, redMin, 255);
    green = map((noiseVal * y), 0, 255, greenMin, 255);    
    blue = map((noiseVal * z), 0, 255, blueMin, 255);
    
    stroke((red + brightness), (green + brightness), (blue + brightness));
    
    point(x, y, z);
    
  }
 
  endShape();
 
  t += 0.001;

}
