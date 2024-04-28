float maxTheta;
float freqMod;
float noise;
float freqX1;
float freqX2;
float freqX3;
float freqX4;
float freqY1;
float freqY2;
float freqY3;
float freqY4;


void setup(){
 
  maxTheta = 180;
  freqMod = 7200;
  noise = 0.00001;  
  freqX1 = 1.0;
  freqX2 = 2.0;
  freqX3 = 3.0;
  freqX4 = 4.0;
  freqY1 = 1.0;
  freqY2 = 2.0;
  freqY3 = 3.0;
  freqY4 = 3.0;
 
  size(1080, 1080);  
 
  blendMode(REPLACE);
 
}

void draw() {
 
  translate(width/2, height/2);
 
  beginShape();            
 
  background(128, 128, 128);
   
 noFill();
    
   for (float theta = 0; theta <= maxTheta * (PI * 2); theta +=0.05) {
   
    float phaseX1 = PI * (2.0 + (sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseX2 = PI * (2.0 + (sin(radians(frameCount / PI) + 1) / 2) * 2);    
    float phaseX3 = PI * (2.0 + (sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseX4 = PI * (2.0 + (sin(radians(frameCount / PI) + 1) / 2) * 2);    

    float phaseY1 = PI * (0.5 + (cos(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseY2 = PI * (0.5 + (cos(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseY3 = PI * (0.5 + (cos(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseY4 = PI * (0.5 + (cos(radians(frameCount / PI) + 1) / 2) * 2);    
    
    float ampX1 = width * 0.12;
    float ampX2 = width * 0.12;
    float ampX3 = width * 0.12;
    float ampX4 = width * 0.12;      
   
    float ampY1 = height * 0.12;
    float ampY2 = height * 0.12;
    float ampY3 = height * 0.12;    
    float ampY4 = height * 0.12;  
    
    float x = ((sin((theta * ((freqX1 + noise) * sin(radians(theta) / freqMod))) + phaseX1) * ampX1) + (sin((theta * (freqX2 + noise)) + phaseX2) * ampX2) + (sin((theta * (freqX3 + noise)) + phaseX3) * ampX3) + (sin((theta * (freqX4 + noise)) + phaseX4) * ampX4));
    float y = ((sin((theta * ((freqY1 + noise) * sin(radians(theta) / freqMod))) + phaseY1) * ampY1) + (sin((theta * (freqY2 + noise)) + phaseY2) * ampY2) + (sin((theta * (freqY3 + noise)) + phaseY3) * ampY3) + (sin((theta * (freqY4 + noise)) + phaseY4) * ampY4));    
    
    colorMode(RGB, 255, 255, 255, 100);
    
    strokeWeight(3);
    
    stroke(0, 0, 0);
    
    point(x, y);
    
  }
 
  endShape();
 
}
