class Walker{
  float x, y;
  
  float tx, ty;
  
  Walker(){
    tx = 0;
    ty = 10000;
  }
  
  void step(){
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    
    tx += 0.01;
    ty += 0.01;
  }
}

Walker walker;

void setup(){
  size(400, 400);
  background(255);
  
  walker = new Walker();
}

void draw(){
  walker.step();
  fill(100);
  ellipse(walker.x, walker.y, 16, 16);
}