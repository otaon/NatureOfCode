class Walker{
  int x;
  int y;
  
  int r;
  int g;
  int b;
  
  // constructor
  Walker(){
    x = width / 2;
    y = height / 2;
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
  }
  
  // display self
  void display(){
    stroke(r, g, b);
    point(x,y);
  }
  
  // go to next step
  void step(){
    int stepx = int(random(3)) - 1;
    int stepy = int(random(3)) - 1;
    
    x += stepx;
    y += stepy;
  }
}

// gloabla valiable
Walker w[];  // Walker Objects

// this method is called once at first (maybe)
void setup(){
  size(640, 360);
  w = new Walker[10];
  for(int index = 0; index < 10; index++){
    w[index] = new Walker();
  }
  background(255);
  colorMode(RGB,256);
}

// this method is called each time at Processing want to draw (how often...?)
void draw(){
  for(int index = 0; index < 10; index++){
    w[index].step();
    w[index].display();
  }
}