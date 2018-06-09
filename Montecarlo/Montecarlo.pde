int  count  = 0;
int count_circle = 0;
float r = 640;
 
void setup(){
  size(640, 640);
  background(255);
  colorMode(RGB, 255);
}

void draw(){
  float x = random(640);
  float y = random(640);

  if(x * x + y * y <= r * r){
    stroke(255, 0, 0);
    count_circle++;
  }else{
    stroke(0, 0, 255);
  }
  count++;
  point(x, y);
  
  noFill();
  stroke(0, 0, 0);
  ellipse(0, 0, r * 2, r * 2);
  
  println(4 * parseFloat(count_circle) / parseFloat(count));
}