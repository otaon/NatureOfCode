import java.util.Random;

Random generator;

void setup(){
  size(640, 360);
  generator = new Random();
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  float mean_x = 320.0;
  float mean_y = 180.0;
  float sd = 40.0;
  float filter_sd = 20.0;
  float x = (float)generator.nextGaussian() * sd + mean_x;
  float y = (float)generator.nextGaussian() * sd + mean_y;
  float filter_x = (float)generator.nextGaussian() * filter_sd + mean_x;
  float filter_y = (float)generator.nextGaussian() * filter_sd + mean_y;
  
  noStroke();
//  fill(degrees(atan2(x - mean_x, y - mean_y) + PI), (sqrt((x - mean_x) * (x - mean_x) + (y - mean_y) * (y - mean_y))), 100, 100);
  fill(degrees(atan2(x - mean_x, y - mean_y) + PI), 100, 100, 10);
  ellipse(x, y, 16, 16);
  fill(0, 0, 100, 10);
  ellipse(filter_x, filter_y, 8, 8);
}