import g4p_controls.*;

Plant[] plants = new Plant[12];
int midX;
int groundLevel = 500;
int whichPlant = 0;
float s, w, f;
boolean p;
boolean running = true;

PFont font;
Button[] bArr = new Button[12];
Button start;
boolean plantClick = false;
int plantIndex = -1;
boolean begin;
boolean plantView = false;

void setup() {
  
  // Set text settings
  font = createFont("Inter-Bold.ttf", 50);
  textFont(font);
  textSize(50);
  
  
  size(800,700);
  createGUI();
  addNewPlantsWindow.setVisible(false);
  variableSliders.setVisible(false);
  begin = false;
  background(5, 141, 4);
  menu();
  midX = width/2;
  
  // Fill pots with new sunflowers
  for(int i = 0; i < 12; i++) {
    plants[i] = new Sunflower("sunflower"+(i+1));
  }
}

void draw() {
  // If viewing a plant and not paused, call grow() for current plant
  if(plantView){
    if(running) {
      background(5, 141, 4);
      if(plants[plantIndex] != null) {
        plants[plantIndex].grow();
      }
      fill(106, 76, 3);
      pot();
    }
  }
}

void menu(){
  text("Plant Grower", width/2 -150, height/4);

  start = new Button(width/2-50, height/3 -25, width/2 +50, height/3 +25, true);
  start.pack(106, 76, 3);
  start.label("START");
}
void pots(){
  int padding = 100;
  for(int i =0; i < 12; i++){
  Button b = new Button(float((i%6)*125 + padding), (i/6)*125 + 300.0, 100.0); 
  b.pack(106, 76, 3);
  bArr[i] = b;
  
  }
  fill(0);
  text("Pick Your Pot", width/2 -150, height/4);
}
int overButtons(Button[] buttonArray){
  for(int i = 0; i<buttonArray.length; i++){
    if(buttonArray[i].overButton()){
      return i;
    }     
  }
  return -1;
}
void pot() {
    rectMode(CORNERS);
     fill(106, 76, 3);

     quad(width/2 - 100, height/2 +125, width/2 +100, height/2 +125, width/2 +50, height/2 + 275, width/2 -50, height/2 + 275);
      rect(width/2 - 110, height/2 +100, width/2 +110, height/2 + 135);
      fill(0);
      rect(0.0, height/2 + 300, 800.0, height);
    rectMode(CORNER);

}
void mousePressed() {
  if(start.overButton() && start.start) {
    background(5, 141, 4);
    pots();
    begin = true;
  }
  if(begin && !plantView) {
    if(overButtons(bArr) !=-1) {
      variableSliders.setVisible(true);
      plantIndex = overButtons(bArr);
      background(5, 141, 4);
      fill(106, 76, 3);
      plantView = true;
      pot();
      
    }
  }

}
