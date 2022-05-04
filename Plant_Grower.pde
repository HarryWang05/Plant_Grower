import g4p_controls.*;

Plant[] plants = new Plant[12]; // Array of all the plants
int midX; // Middle x value of screen
int groundLevel = 500; // y value where plant starts growing
float s, w, f; // sunlight, water, and fertilizer global variables
boolean p; // paused
boolean running = true; // if program should run
String typeOfPlant,nameOfPlant; // GUI values

PFont font;
Button[] bArr = new Button[12];
Button start, exit;
boolean plantClick = false;
int plantIndex = -1;
boolean begin;
boolean plantView = false;

void setup() {
  
  // Set text settings
  font = createFont("Inter-Bold.ttf", 50);
  textFont(font);
  textSize(50);
  
  // General
  size(800,700);
  createGUI();
  addNewPlantsWindow.setVisible(false);
  variableSliders.setVisible(false);
  begin = false;
  background(5, 141, 4);
  menu();
  midX = width/2;
  exit = new Button(width-100, 0, width, 100, true);
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
    // Render exit button
    exit.pack(106, 76, 3);
    exit.label("EXIT");
  }
}

// Render start menu
void menu(){
  text("Plant Grower", width/2 -150, height/4);

  start = new Button(width/2-50, height/3 -25, width/2 +50, height/3 +25, true);
  start.pack(106, 76, 3);
  start.label("START");
}

// Render pots and plant indicators
void pots(){
  addNewPlantsWindow.setVisible(false);
  variableSliders.setVisible(false);
  background(5, 141, 4);
  int padding = 90;
  for(int i =0; i < 12; i++){
    Button b = new Button(float((i%6)*125 + padding), (i/6)*125 + 300.0, 100.0); 
    b.pack(106, 76, 3);
    bArr[i] = b;
    // Render a green circle if there is a plant
    if(plants[i] != null) {
      fill(127, 255, 0);
      circle(float((i%6)*125 + padding),(i/6)*125 + 300.0,50.0);
    }
  }
  fill(0);
  text("Pick Your Pot", width/2 -60, height/4);
}

// Return the button the mouse if over
int overButtons(Button[] buttonArray){
  for(int i = 0; i<buttonArray.length; i++){
    if(buttonArray[i].overButton()){
      return i;
    }     
  }
  return -1;
}

// Render pot
void pot() {
    rectMode(CORNERS);
     fill(106, 76, 3);

     quad(width/2 - 100, height/2 +125, width/2 +100, height/2 +125, width/2 +50, height/2 + 275, width/2 -50, height/2 + 275);
      rect(width/2 - 110, height/2 +100, width/2 +110, height/2 + 135);
      fill(0);
      rect(0.0, height/2 + 300, 800.0, height);
    rectMode(CORNER);

}

// For clicking on buttons
void mousePressed() {
  // Start button
  if(start.overButton() && start.start) {
    background(5, 141, 4);
    pots();
    begin = true;
  }
  // Clicked on pot
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
  // Exit button
  if(plantView && exit.overButton()) {
    plantView = false;
    pots();
  }

}
