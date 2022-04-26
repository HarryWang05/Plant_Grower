import g4p_controls.*;

Sunflower hi = new Sunflower("Hi");
int midX = 300;
int groundLevel = 500;

void setup() {
  size(600,600);
  createGUI();
}

void draw() {
  background(0);
  hi.grow();
}
