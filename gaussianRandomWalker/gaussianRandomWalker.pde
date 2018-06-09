import java.util.Random;

Random generator;

void setup(){
  size(640, 360);
  generator = new Random();
  background(255);
  colorMode(RGB, 256);
}

float x = 640 / 2;
float y = 360 / 2;
float old_x = x;
float old_y = y;

void draw(){
  float mean = 0.0;
  float sd = 2.0;
  x += (float)generator.nextGaussian() * sd + mean;
  y += (float)generator.nextGaussian() * sd + mean;
  
  stroke(255, 0, 0, 20);
  line(old_x, old_y, x, y);
  
  old_x = x;
  old_y = y;
}