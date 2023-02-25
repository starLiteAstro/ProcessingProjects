int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;
color red = color(238,75,43);
color black = color(0,0,0);
color white = color(255,255,255);
int t;

float[][] terrain;
float flying = 0;

void setup() {
  size(1000, 800, P3D);
  cols = w / scl;
  rows = h / scl;
  
  terrain = new float[cols][rows];
  
}

void draw() {
  flying -= 0.01;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  frameRate(60);
  stroke(153,153,0);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y+1]);
    }
    endShape();
  }
}
