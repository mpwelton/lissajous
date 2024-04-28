float t=0;
float maxTheta = 105;
float maxWeight = 1;
float freqMod = 14400;
float volume = 0.5;
float freq01 = 3.01;
float freq02 = 6.01;
float freq03 = 9.01;
float freq04 = 12.01;
float lfo01 = 2;
float lfo02 = 3;
float lfo03 = 4;
float lfo04 = 5;
float vol01 = 0.1;
float vol02 = 0.1;
float vol03 = 0.1;
float vol04 = 0.1;

void setup(){
 
  //fullScreen(2);
 
  size(1600, 900);
 
  blendMode(REPLACE);
 
}

void draw() {
 
  translate(width/2, height/2);
 
  beginShape();            
 
  background(0);
   
    noFill();
    
   for (float theta = 0; theta <= maxTheta * PI; theta +=0.01) {
   
    float phaseX = PI * 2.0;

    float phaseY = PI * 0.5;

    float amp01 = (height * vol01) * ((sin(radians(frameCount / lfo01)) + 1) / 2);
    float amp02 = (height * vol02) * ((sin(radians(frameCount / lfo02)) + 1) / 2);
    float amp03 = (height * vol03) * ((sin(radians(frameCount / lfo03)) + 1) / 2);
    float amp04 = (height * vol04) * ((sin(radians(frameCount / lfo04)) + 1) / 2);
    
    float totalAmp = (amp01 + amp02 + amp03 + amp04);
    float volumeMultiplier = totalAmp / (height * 0.9);
    float newAmp01 = amp01 / volumeMultiplier;
    float newAmp02 = amp02 / volumeMultiplier;
    float newAmp03 = amp03 / volumeMultiplier;
    float newAmp04 = amp04 / volumeMultiplier;    
 
    float x = ((sin((theta * freq01) + phaseX) * newAmp01) + (sin((theta * freq02) + phaseX) * newAmp02) + (sin((theta * freq03) + phaseX) * newAmp03) + (sin((theta * freq04) + phaseX) * newAmp04)) * volume;
    float y = ((sin((theta * freq01) + phaseY) * newAmp01) + (sin((theta * freq02) + phaseY) * newAmp02) + (sin((theta * freq03) + phaseY) * newAmp03) + (sin((theta * freq04) + phaseY) * newAmp04)) * volume;
    
    strokeWeight(map(theta, 0, maxTheta, 1, maxWeight));

    colorMode(RGB, 255, 255, 255);
        
    float red = map(sin(radians(frameCount)), -1, 1, 192, 255);
    float green = map(sin(radians(frameCount) + 45), -1, 1, 192, 255);
    float blue = map(sin(radians(frameCount) + 90), -1, 1, 192, 255);
    
    float colVal01 = map(x, 0, (height * 0.4), 128, 255);
    float colVal02 = map(y, 0, (height * 0.4), 128, 255);
        
    //stroke(red, colVal01, colVal02);
    
    point(x, y);
    
    stroke(red, colVal01, colVal02);
    
  }
 
  endShape();
 
  t += 0.001;

}
