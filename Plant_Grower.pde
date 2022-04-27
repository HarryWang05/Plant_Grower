import g4p_controls.*;
PFont font;
Button[] bArr = new Button[12];
Button start;
int midX = 300;
int groundLevel = 500;
int whichPlant = 0;
boolean begin;
void setup() {
  begin = false;
  font = createFont("Inter-Bold.ttf", 50);
  textFont(font);
  background(5, 141, 4);
  fill(0);
  text("Plant Grower", width/2 -150, height/4);

  start = new Button(width/2-50, height/2 -25, width/2 +50, height/2 +25, true);
  start.pack();
  start.label("START");

  
  size(800,600);
  createGUI();
  textSize(50);
  
}
void pots(){
  int padding = 100;
  for(int i =0; i < 12; i++){
  Button b = new Button(float((i%6)*125 + padding), (i/6)*125 + 300.0, 100.0); 
  b.pack();
  bArr[i] = b;
  
  }
  fill(0);
  text("Pick Your Pot", width/2 -150, height/4);
}
boolean overButtons(Button[] buttonArray){
  for(Button button: buttonArray){
    if(button.overButton()){
      return true;
    }     
  }
  return false;
}
void mousePressed(){
  if(start.overButton() && start.start){
    background(5, 141, 4);
    pots();
    begin = true;
  }
  if(begin){
    print(overButtons(bArr));
  }

}

void draw() {

}
