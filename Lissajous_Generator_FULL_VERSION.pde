float maxTheta;
float freqMod;
float freqX1;
float freqX2;
float freqX3;
float freqX4;
float freqY1;
float freqY2;
float freqY3;
float freqY4;
float freqZ1;
float freqZ2;
float freqZ3;
float freqZ4;
float vol01;
float vol02;
float vol03;
float vol04;
float lfo01;
float lfo02;
float lfo03;
float lfo04;
float noise;
float maxWeight;
float thetaIncrement;

void setup(){
 
  maxTheta = 140;
  freqMod = 36000;
  freqX1 = 2.0;
  freqX2 = 2.0;
  freqX3 = 2.0;
  freqX4 = 2.0;
  freqY1 = 3.0;
  freqY2 = 3.0;
  freqY3 = 3.0;
  freqY4 = 3.0;
  freqZ1 = 1.0;
  freqZ2 = 1.0;
  freqZ3 = 1.0;
  freqZ4 = 1.0; 
  vol01 = 0.25;
  vol02 = 0.25;
  vol03 = 0.25;
  vol04 = 0.25;
  lfo01 = 8.9;
  lfo02 = 9.1;
  lfo03 = 9.3;
  lfo04 = 9.5;
  noise = 0.005;
  maxWeight = 2;
  thetaIncrement = 0.02;
 
  //fullScreen(P3D);
  size(1080, 1080, P3D);  
 
  blendMode(REPLACE);
 
}

void draw() {
 
  translate(width/2, height/2);
 
  beginShape();            
 
  background(0, 0, 0);
   
 noFill();
    
   for (float theta = 0; theta <= maxTheta * (PI * 2); theta +=thetaIncrement) {
   
    float phaseX1 = PI * (2.0 + (sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseX2 = PI * (2.0 + (sin(radians(frameCount / PI) + 1) / 2) * 2);    
    float phaseX3 = PI * (2.0 + (cos(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseX4 = PI * (2.0 + (cos(radians(frameCount / PI) + 1) / 2) * 2);    

    float phaseY1 = (PI * 0.5) + ((sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseY2 = (PI * 0.5) + ((sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseY3 = (PI * 0.5) + ((cos(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseY4 = (PI * 0.5) + ((cos(radians(frameCount / PI) + 1) / 2) * 2);
    
    float phaseZ1 = (PI * 0.5) + ((sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseZ2 = (PI * 0.5) + ((sin(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseZ3 = (PI * 0.5) + ((cos(radians(frameCount / PI) + 1) / 2) * 2);
    float phaseZ4 = (PI * 0.5) + ((cos(radians(frameCount / PI) + 1) / 2) * 2);      
    
    float ampX1 = width * 0.12;
    float ampX2 = width * 0.12;
    float ampX3 = width * 0.12;
    float ampX4 = width * 0.12;      
   
    float ampY1 = height * 0.12;
    float ampY2 = height * 0.12;
    float ampY3 = height * 0.12;    
    float ampY4 = height * 0.12;
    
    //float ampZ1 = height * 0.12;
    //float ampZ2 = height * 0.12;
    //float ampZ3 = height * 0.12;    
    //float ampZ4 = height * 0.12;
    
    float ampZ1 = (height * vol01) * ((sin(radians(frameCount / lfo01)) + 1) / 2);
    float ampZ2 = (height * vol02) * ((sin(radians(frameCount / lfo02)) + 1) / 2);
    float ampZ3 = (height * vol03) * ((sin(radians(frameCount / lfo03)) + 1) / 2);
    float ampZ4 = (height * vol04) * ((sin(radians(frameCount / lfo04)) + 1) / 2);    
    
    //float totalAmp = (amp01 + amp02 + amp03 + amp04);
    //float volumeMultiplier = totalAmp / (height * 0.9);
    //float newAmp01 = amp01 / volumeMultiplier;
    //float newAmp02 = amp02 / volumeMultiplier;
    //float newAmp03 = amp03 / volumeMultiplier;
    //float newAmp04 = amp04 / volumeMultiplier;
        
    float x = ((sin((theta * ((freqX1 + noise) * sin(radians(theta) / freqMod))) + phaseX1) * ampX1) + (sin((theta * (freqX2 + noise)) + phaseX2) * ampX2) + (sin((theta * (freqX3 + noise)) + phaseX3) * ampX3) + (sin((theta * (freqX4 + noise)) + phaseX4) * ampX4));
    float y = ((sin((theta * ((freqY1 + noise) * sin(radians(theta) / freqMod))) + phaseY1) * ampY1) + (sin((theta * (freqY2 + noise)) + phaseY2) * ampY2) + (sin((theta * (freqY3 + noise)) + phaseY3) * ampY3) + (sin((theta * (freqY4 + noise)) + phaseY4) * ampY4));    
    float z = ((sin((theta * ((freqZ1 + noise) * sin(radians(theta) / freqMod))) + phaseZ1) * ampZ1) + (sin((theta * (freqZ2 + noise)) + phaseZ2) * ampZ2) + (sin((theta * (freqZ3 + noise)) + phaseZ3) * ampZ3) + (sin((theta * (freqZ4 + noise)) + phaseZ4) * ampZ4));    
    
    colorMode(RGB, 255, 255, 255, 100);
    
    //strokeWeight(3);
    strokeWeight(map(theta, 0, maxTheta, 1, maxWeight));
        
    //float red = map(sin(radians(frameCount)), -1, 1, 192, 255);
    //float green = map(sin(radians(frameCount) + 45), -1, 1, 192, 255);
    //float blue = map(sin(radians(frameCount) + 90), -1, 1, 192, 255);
    
    float colVal01 = map(x, 0, (height * 0.4), 128, 255); 
    float colVal02 = map(y, 0, (height * 0.4), 128, 255);
    float colVal03 = map(z, 0, (height * 0.4), 128, 255);
    
    //stroke(255, 255, 128);
    stroke(colVal01, colVal02, colVal03);
    
    point(x, y, z);
    
  }
 
  endShape();
 
}
