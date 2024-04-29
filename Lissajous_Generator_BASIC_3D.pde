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
float noise;

void setup(){
 
  maxTheta = 180;
  freqMod = 7200;
  freqX1 = 1.0;
  freqX2 = 1.0;
  freqX3 = 1.0;
  freqX4 = 1.0;
  freqY1 = 2.0;
  freqY2 = 2.0;
  freqY3 = 2.0;
  freqY3 = 2.0;
  freqZ1 = 3.0;
  freqZ2 = 3.0;
  freqZ3 = 3.0;
  freqZ4 = 3.0;
  noise = 0.005;
 
  size(1080, 1080, P3D);  
 
  blendMode(REPLACE);
 
}

void draw() {
 
  translate(width/2, height/2);
 
  beginShape();            
 
  background(0, 32, 32);
   
 noFill();
    
   for (float theta = 0; theta <= maxTheta * (PI * 2); theta +=0.05) {
   
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
    
    float ampZ1 = height * 0.12;
    float ampZ2 = height * 0.12;
    float ampZ3 = height * 0.12;    
    float ampZ4 = height * 0.12;
    
    float totalXAmp = (ampX1 + ampX2 + ampX3 + ampX4);
    float volumeMultiplierX = totalXAmp / (width * 0.48);
    float newAmpX1 = ampX1 / volumeMultiplierX;
    float newAmpX2 = ampX2 / volumeMultiplierX;
    float newAmpX3 = ampX3 / volumeMultiplierX;
    float newAmpX4 = ampX4 / volumeMultiplierX;
    
    float totalYAmp = (ampY1 + ampY2 + ampY3 + ampY4);
    float volumeMultiplierY = totalYAmp / (width * 0.48);
    float newAmpY1 = ampY1 / volumeMultiplierY;
    float newAmpY2 = ampY2 / volumeMultiplierY;
    float newAmpY3 = ampY3 / volumeMultiplierY;
    float newAmpY4 = ampY4 / volumeMultiplierY; 
    
    float totalZAmp = (ampZ1 + ampZ2 + ampZ3 + ampZ4);
    float volumeMultiplierZ = totalZAmp / (width * 0.48);
    float newAmpZ1 = ampZ1 / volumeMultiplierY;
    float newAmpZ2 = ampZ2 / volumeMultiplierY;
    float newAmpZ3 = ampZ3 / volumeMultiplierY;
    float newAmpZ4 = ampZ4 / volumeMultiplierY; 
    
    float x = ((sin((theta * ((freqX1 + noise) * sin(radians(theta) / freqMod))) + phaseX1) * newAmpX1) + (sin((theta * (freqX2 + noise)) + phaseX2) * newAmpX2) + (sin((theta * (freqX3 + noise)) + phaseX3) * newAmpX3) + (sin((theta * (freqX4 + noise)) + phaseX4) * newAmpX4));
    float y = ((sin((theta * ((freqY1 + noise) * sin(radians(theta) / freqMod))) + phaseY1) * newAmpY1) + (sin((theta * (freqY2 + noise)) + phaseY2) * newAmpY2) + (sin((theta * (freqY3 + noise)) + phaseY3) * newAmpY3) + (sin((theta * (freqY4 + noise)) + phaseY4) * newAmpY4));    
    float z = ((sin((theta * ((freqZ1 + noise) * sin(radians(theta) / freqMod))) + phaseZ1) * newAmpZ1) + (sin((theta * (freqZ2 + noise)) + phaseZ2) * newAmpZ2) + (sin((theta * (freqZ3 + noise)) + phaseZ3) * newAmpZ3) + (sin((theta * (freqZ4 + noise)) + phaseZ4) * newAmpZ4));

    
    colorMode(RGB, 255, 255, 255, 100);
    
    strokeWeight(3);
    
    stroke(192, 192, 0);
    
    point(x, y, z);
    
  }
 
  endShape();
 
}
