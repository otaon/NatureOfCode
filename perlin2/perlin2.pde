void setup(){
  size(400, 400);
  background(255);
}

float tz = 0;

void draw(){
  loadPixels();
  for(int plot_x = 0; plot_x < 400; plot_x++){
    for(int plot_y = 0; plot_y < 400; plot_y++){
      pixels[plot_x + width * plot_y] = color(map(noise(plot_x * 0.01, plot_y * 0.01, tz * 0.01), 0, 1, 0, 255));
    }
  }
  tz += 1;
  updatePixels();
}